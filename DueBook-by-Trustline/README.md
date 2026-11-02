# DueBook by Trustline

**Tagline:** Know Your Numbers. Stay in Control.

DueBook is a multipage HTML/CSS/JavaScript frontend with a Node.js/Express/MongoDB API. It is deliberately built without React or Bootstrap so the source is approachable if you know HTML, CSS and JavaScript.

## Included

- Public home page, login, registration, forgot/reset password, privacy, terms, refund and cookie-policy draft pages.
- App pages for dashboard, customers, customer statements, sales, new sale, invoices, payments, expenses, inventory, reports, reminders, staff, audit log, settings and password changes.
- Express API with MongoDB models, password hashing, JWT sessions, rate limiting, role checks, business-scoped queries, password-reset tokens, and audit events.
- CSV exports for selected records and printable invoices.
- Responsive layout, keyboard skip links, status messages, reduced-motion support, and a basic dark-mode toggle.

## Requirements

- Node.js 20 or newer (a current Node.js LTS release is recommended).
- MongoDB Atlas database or a local MongoDB server.
- VS Code and a static file server such as the Live Server extension.

## Windows setup

1. Extract this ZIP to a normal folder.
2. Install Node.js LTS if it is not already installed.
3. Create a MongoDB database in MongoDB Atlas or run MongoDB locally.
4. Copy `backend/.env.example` to `backend/.env` (the `start-windows.bat` helper can create the copy for you).
5. Edit `backend/.env` and set:
   - `MONGODB_URI` to your database connection string.
   - `JWT_SECRET` to a long random secret (at least 32 characters).
   - `FRONTEND_ORIGIN` to the exact local address/port used by your frontend, e.g. `http://127.0.0.1:5500` or `http://localhost:5500`.
   - `APP_PUBLIC_URL` to the frontend base URL.
6. Open a terminal in the `backend` folder and run `npm install`, then `npm start`.
7. In VS Code, open the project root and use Live Server on `index.html`. Do not open app pages with a `file:///` URL; the browser needs a local HTTP origin to call the API.
8. Register your first account. The account becomes the Owner of its own business workspace.

`start-windows.bat` is a helper, not a one-click deployment system. You still need a working MongoDB connection and a local static server.

## API

The base URL is `http://localhost:5000/api` by default. Read `docs/API.md` for the route list. The browser scripts currently use `http://localhost:5000/api`; change `window.DUEBOOK_API_URL` before `js/auth.js` and `js/app.js` load if you deploy to another API host. For a production build, configure HTTPS, a production database, exact CORS origins, backups, monitoring and a secret manager.

## Money values

The current starter stores monetary amounts as decimal major units (for example, `1250.50` means ₦1,250.50) rather than kobo integers. For regulated financial-grade use, consider migrating to integer kobo with explicit currency handling and tested rounding rules before launch.

## Important limitations — read before using with real businesses

This is a functional starter implementation, not a security-audited or production-certified financial application. The main flows have source code, but it has not been verified against your actual MongoDB instance, production deployment, email provider, or real business workflow. Test all actions using fake data first.

- Some advanced requirements are not implemented yet: sales stock deduction/restoration, inventory movement ledger and weighted-average costing, atomic multi-user payment transactions, refunds/voiding workflows, CSV import validation, complete staff forced-password-change enforcement, automated SMS/WhatsApp sending, automated deletion workflow, file upload for logos, and comprehensive test coverage.
- Product inventory is currently tracked separately from sales; sales do not deduct stock automatically.
- Payment records are append-only in normal UI but this starter does not provide a full refund workflow.
- Staff accounts are created with a temporary password, but a forced-change flow is not yet enforced; provide staff with secure individual passwords and do not deploy this workflow unchanged.
- The dashboard and reports are basic; profit is marked incomplete unless every sale item has a saved cost.
- Legal pages are draft text and must be reviewed by a qualified Nigerian lawyer. Replace placeholder business/legal contacts before public launch.
- Password-reset links are printed to the backend terminal only when SMTP is not configured and `NODE_ENV` is not `production`. Configure SMTP before public launch. The public forgot-password response is generic.
- The login token is kept in `sessionStorage`, which reduces persistence but does not eliminate the risks of script injection. Add a professional security review before handling sensitive data.
- The app has not been tested for regulatory compliance or certified for handling sensitive health/financial records. Do not enter medical data or highly sensitive personal information.

## Folder map

- `*.html` — individual page shells.
- `css/style.css` — responsive styling.
- `js/auth.js` — registration, login and password-reset interactions.
- `js/app.js` — dashboard and business screens.
- `backend/server.js` — API server.
- `backend/routes/` — API endpoints.
- `backend/models/` — MongoDB models.
- `backend/middleware/` — authentication and role checks.
- `docs/API.md` — endpoint reference.

## Legal and business configuration

The legal pages are draft templates. Add the registered business name, official support contacts, retention details, privacy notice and final commercial terms before accepting customers or payment.

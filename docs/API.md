# DueBook API reference (starter)

Default base URL: `http://localhost:5000/api`

Authenticated routes require `Authorization: Bearer <token>` unless noted.

## Public authentication

- `POST /auth/register` — create a business owner account. Requires name, businessName, email, phone, password, `adultConfirmed: true`, `acceptTerms: true`.
- `POST /auth/login` — returns a JWT and safe user object.
- `POST /auth/forgot-password` — generic response to avoid revealing whether an email exists. Reset token expires after 60 minutes.
- `POST /auth/reset-password` — consumes a single-use reset token.

## Authenticated

- `POST /auth/logout` — increments token version to invalidate active tokens for that user.
- `POST /auth/change-password` — changes password and invalidates prior tokens.
- `GET /health` is public at `/api/health`.
- `GET /dashboard/summary`
- `GET, POST /customers`; `GET, PATCH, DELETE /customers/:id`
- `GET, POST /sales`; `POST /sales/:id/cancel`
- `GET, POST /payments`
- `GET, POST /expenses`
- `GET, POST /inventory`
- `GET /reports/summary`
- `GET /reminders`
- `GET, POST /staff`
- `GET /audit-log`
- `GET, PUT /settings`

## Notes

- Business data routes scope queries by the authenticated user's `businessId`.
- Roles: Owner, Manager, Cashier, Viewer. The role enforcement in this starter is intentionally simple; review every route before production use.
- API amounts are decimal major units, not integer kobo. Example: `1250.50` represents ₦1,250.50.
- Error responses use `{ "message": "..." }`.

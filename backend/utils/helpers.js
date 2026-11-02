async function audit(req,action,entityType,entityId,summary){try{const {AuditLog}=require('../models');await AuditLog.create({businessId:req.user.businessId,actorId:req.user._id,actorName:req.user.name,action,entityType,entityId,summary,ip:req.ip})}catch(e){console.error('Audit write failed:',e.message)}}
function statusFor(total,paid,dueDate){if(paid>=total)return 'paid';if(paid>0)return 'partial';if(dueDate&&new Date(dueDate)<new Date())return 'overdue';return 'unpaid'}
function money(n){return Math.round((Number(n)+Number.EPSILON)*100)/100}
module.exports={audit,statusFor,money};

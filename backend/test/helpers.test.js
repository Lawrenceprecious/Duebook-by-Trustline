const test=require('node:test');const assert=require('node:assert/strict');const {statusFor,money}=require('../utils/helpers');
test('money rounds to two decimal places',()=>assert.equal(money(12.345),12.35));
test('statusFor determines paid and partial statuses',()=>{assert.equal(statusFor(100,100),'paid');assert.equal(statusFor(100,30),'partial');assert.equal(statusFor(100,0),'unpaid')});
test('statusFor marks an unpaid past-due invoice overdue',()=>assert.equal(statusFor(100,0,new Date(Date.now()-86400000)),'overdue'));

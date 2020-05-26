trigger processtrigger on opportunity (before insert,before update) {

if(trigger.isInsert || trigger.isUpdate)
{
for(opportunity o:trigger.new)
{
    if (o.Approval_Status__c=='Approved'&&o.Probability==null) 
    {
        o.addError('Probability cannot be null');
    }
}

}

}
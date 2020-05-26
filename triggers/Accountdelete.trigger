trigger Accountdelete on Account (before delete) {

    if (trigger.isbefore)
    {
        if(trigger.isdelete)
        {
            //map<id,account> accmap= new map <id,account>([select id,(select id,name from opportunities) from account where id in:trigger.old]);
            list<account> acclist= [select id,(select id,name from opportunities) from account where id in:trigger.old];
            for (Account a:acclist){
                if(a.opportunities.size()>=1)
                {
                    trigger.oldmap.get(a.id).adderror('this account has opportunities and cannot be deleted');
                }
            }
                
        }
    }
    
}
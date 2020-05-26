trigger DuplicateContact on Contact (before insert) {

    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            set<string> emailset= new set<string>();
            for(contact c:trigger.new)
            {
                emailset.add(c.email);
                system.debug(emailset);
            }
            list<contact> conlist= [select email,id from contact where email in:emailset];
            system.debug(conlist);
            map<string,contact> conmap= new map<string,contact> ();
            for(contact c:conlist)
            {
                conmap.put(c.email,c);
            }
            
            system.debug(conmap);
                
            for(contact c:trigger.new)
            {
                if(conmap.containsKey(c.email))
            {
                c.Email.addError('duplicate contacts');
            }
               } 
        }
    }
}
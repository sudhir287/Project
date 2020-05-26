@RestResource(urlMapping='/accountdata/*')
global class Restclass {
  
    @HttpGet
    global static Account getAccount(){
        RestRequest req= RestContext.request;
        RestResponse res= RestContext.response;
        string key= req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
       Account a= [select id,name,rating from account where id=:key];
        return a;
    }
    
    @HttpDelete
    
    global static string deleteaccount(){
        RestRequest req= RestContext.request;
        RestResponse res= Restcontext.response;
       string keyword= req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
        string key='%'+keyword.substringAfterLast('=')+'%';
        system.debug(key);
        Account a= [select id,name,rating from account where name like:key limit 1];
        delete a;
        return 'deleted';
    }
        
    @HttpPost
    global static id createaccount(string accname,string accrating,string accIndustry){
        Account a = new account();
        a.Name=accname;
        a.Rating=accrating;
        a.Industry=accIndustry;
        insert a;
        return a.Id;
    }
    
    @HttpPatch
    global static list<Account> updateaccount(string accrating){
        string rat= accrating;
        RestRequest req= Restcontext.request;
        string requestid=req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
        list<account> acclist=[select id,name,rating from account where id =:requestid];
            list<account> updatedlist= new list<account>();
        for(account a:acclist)
        {
            a.rating=rat;
            updatedlist.add(a);
        }
        
        return updatedlist;
    }
    
        
}
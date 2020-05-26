public class AccountRestclass {
     public string ckey='3MVG9G9pzCUSkzZstFETDaHfc88bZn.f3AkbCnDYtGk5H87ddGM0bzwOnVNzYpE9wX7.Ibe_MTswCaxNRdCq3';
    public string csecret='4984910C797043919711DB810B972F7B2D2BEFDEC50B7F1E708C80E2D6EA3B72';
    public string username='sudhir.b@live.com';
    public string password='Sales@1234fhIfaapy1EdyWaDqrxuUsL0X';
    public string endpoint='https://login.salesforce.com/services/oauth2/token';
     public list<accountwrap> accts {get;set;}
    public string aname {get;set;}
     public string arating {get;set;}
      public string aindustry {get;set;}
   public string oldrating {get;set;}
       public string newrating {get;set;}
    public list<accountwrap> updatedaccts {get;set;}
    
    public accountrestclass(){
    accts= new list <accountwrap>();
    }
    public string gettoken(){
        
   string reqBody='grant_type=password&client_id='+cKey+'&client_secret='+cSecret+'&username='+username+'&password='+password;                                    
        
        Http h=new Http();
        HttpRequest req=new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse hresp=h.send(req);
        responseWrapper wResp=(responseWrapper) JSON.deserialize(hresp.getBody(),responseWrapper.class);
        system.debug('Instance url'+wResp.instance_url);
        system.debug('session id'+wResp.access_token);
        return wResp.access_token;   
   /*     
    string requestbody='grant_type=password&client_id='+ckey+'&client_secret='+csecret+'&username='+username+'&password='+password;
     system.debug(requestbody);
     Http h= new Http();
     Httprequest hr = new Httprequest();
     hr.setMethod('POST');
     hr.setEndpoint('https://login.salesforce.com/services/oauth2/token');
     hr.setBody(requestbody);
     Httpresponse hs=h.send(hr);
        system.debug(hs.getStatus());
        system.debug(hs.getStatuscode());
        
 responsewrapper resw=(responsewrapper) JSON.deserialize(hs.getBody(),responsewrapper.class);  
 //map<String, object> m = (Map<String,object>) JSON.deserializeUntyped(hs.getBody());
       //string token=(string) m.get('access_token');
        system.debug(resw);
       return resw.access_token;*/
    }
    
        
   public void fetchdata(){
        string endpoint='https://sudhir287-dev-ed.my.salesforce.com/services/apexrest/accountdata/';
        //string otken= gettoken();
      //  AccountRestclass.responsewrapper rewrap = gettoken();
        //system.debug(otken);
        string otken= gettoken();
        system.debug(otken);
        //if(rewrap!=null && rewrap.access_token!='')
        Http h= new Http();
        Httprequest hr= new Httprequest();
   
    // changed this one  hr.setHeader('Authorization',otken);
     hr.setHeader('Authorization','Bearer '+otken);
        
         hr.setHeader('Content-Type','application/json');
        hr.setEndpoint(endpoint);
        hr.setMethod('GET');
        Httpresponse hs= h.send(hr);
        system.debug(hs);
            system.debug(hs.getStatus());
            system.debug(hs.getStatusCode());
            system.debug(hs.getBody());
        accts=(list<accountwrap>)JSON.deserialize(hs.getBody(),list<accountwrap>.class);
            system.debug(accts);
        
         }
    public void savedata(){
         string endpoint='https://sudhir287-dev-ed.my.salesforce.com/services/apexrest/accountdata/';
        
        http h= new http();
        httprequest hr= new httprequest();
        string otken= gettoken();
        string jsonstring= '{"accname":"'+aname+'","accrating":"'+arating+'","accIndustry":"'+aIndustry+'"}';
        hr.setEndpoint(endpoint);
        hr.setMethod('POST');
        hr.setHeader('Authorization','Bearer '+otken);
        hr.setHeader('Content-Type','application/json');
        hr.setBody(jsonstring);
        httpresponse hs= h.send(hr);
        system.debug(hs);
    }
    
    public void updatedata(){
        string endpoint='https://sudhir287-dev-ed.my.salesforce.com/services/apexrest/accountdata/';
        string otken= gettoken();
        string jsonstring='{"rating1":"'+oldrating+'","rating2":"'+newrating+'"}';
         http h = new http();
        httprequest hr= new httprequest();
        hr.setHeader('Authorization','Bearer '+otken);
        hr.setHeader('Content-Type','application/json');
        hr.setMethod('PUT');
        hr.setEndpoint(endpoint);
        hr.setBody(jsonstring);
        httpresponse hs=h.send(hr);
        system.debug(hs.getBody());
     updatedaccts =  (list<accountwrap>)json.deserialize(hs.getBody(),list<accountwrap>.class );
        system.debug(updatedaccts);
        
    }
    

    public class accountwrap{
        public string name {get;set;}
        public string rating {get;set;}
      }
     public class responsewrapper{
         public  string id;
         public string access_token;
        public  string instance_url;
    }

    
}
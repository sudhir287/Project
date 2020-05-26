public class LinkedinClass{

    public string basicinfo {get;set;}

  public boolean iscode {get;set;}
  public string codefromurl {get;set;}
 public string LinkedinauthURL ='https://www.linkedin.com/oauth/v2/authorization?' ;
  public string redirectURL='https://sudhir54-dev-ed--c.visualforce.com/apex/linkedin';
  public string accesstokenURL='https://www.linkedin.com/oauth/v2/accessToken';
   public List<LinkedIn_Data__c> linkedlnInfoList { get; set; }
  
  public string consumerkey='818qkamp9056xe';
  public string consumersecret='3p9idpjwc3fxqIMp';
  public string errorMessage ;
  
  public LinkedinClass(){
   codefromurl=apexpages.currentpage().getparameters().get('code');
  if(codefromurl==null||codefromurl=='')
   
   iscode=true;
  else
  iscode=false;
  }


public void getaccesstoken() {
   string requestbody='grant_type=authorization_code&code='+codefromurl+'&redirect_uri='+redirectURL+'&client_id='+consumerkey+'&client_secret='+consumersecret;
    Http h= new Http();
    Httprequest hr= new Httprequest();
    hr.setmethod('POST');
    hr.setbody(requestbody);
    hr.setEndpoint(accesstokenURL);
     hr.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    Httpresponse hs= h.send(hr);
    system.debug(hs.getBody());
    
    if(hs.getStatuscode()==200)
    {
    
    map<string,object> tokeninfo =(map<string,object>)json.deserializeuntyped(hs.getBody());
    
    
    LinkedIn_Data__c linkedlnInfo = new LinkedIn_Data__c();
    linkedlnInfo.Access_Token__c= string.valueof(tokeninfo.get('access_token'));
    linkedlnInfo.Expires_In_Seconds__c =double.valueof(tokeninfo.get('expires_in'));
         linkedlnInfo.Name ='LinkedlnInfo';
         
          ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,

                                         'Congrattzzzzz..... You have done successfull Integration with Linkedln'));
                                         
                        upsert linkedlnInfo;                  
                                         
     }
    
    else{
    errorMessage = 'Unexpected Error while communicating with LinkedIn API';
    
    apexpages.addmessage(new apexpages.message(apexpages.severity.ERROR,errorMessage));
    
    }
    
    
    }
    
    
public PageReference getauthorizationcode() {
    
       string requesttoaccessURL=LinkedinauthURL+'response_type=code&client_id='+consumerkey+'&redirect_uri='+redirectURL+'&scope=r_basicprofile';
     pagereference page1= new pagereference(requesttoaccessURL);
    system.debug(requesttoaccessURL);
        return page1;
    }
public void getinfo() {
        
        String errorMessage ='';

        Http http = new Http();

        HttpRequest httpReq = new HttpRequest();

        HttpResponse httpRes = new HttpResponse();

       

        List<LinkedIn_Data__c> linkedlnInfoListNew = [Select Id, Name,Access_Token__c,Expires_In_Seconds__c From LinkedIn_Data__c Where Name='LinkedlnInfo'];

       

        httpReq.SetMethod('GET');

        httpReq.setEndpoint('https://api.linkedin.com/v2/me');

        httpReq.setHeader('Authorization', 'Bearer '+linkedlnInfoListNew[0].Access_Token__c);

        httpReq.setHeader('Content-Type', 'application/json');

       

        

            httpRes = http.send(httpReq);
    system.debug(httpRes.getBody());

            if(httpRes.getStatusCode() == 200){

                Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());

                String firstName = String.valueOf(TokenInfo.get('firstName'));

                String lastName = String.valueOf(TokenInfo.get('lastName'));

                String headline = String.valueOf(TokenInfo.get('profilePicture'));

                 String prn = String.valueOf(TokenInfo.get('id'));

             BasicInfo = firstName +'  ' + lastName +'  '+headline+' '+prn;
    }
}
}
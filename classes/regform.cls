public class regform {

public account acc{get;set;}

public regform(){
acc= new account();

}

    public PageReference dosave() {
    
    partnerSoapSforceCom.soap objsession= new partnerSoapSforceCom.soap();
    
    SFcredential__mdt userdata= [select id,Username__c,Password__c,Stoken__c from SFcredential__mdt where developername='SFsource'];
   //PartnerSoapSforcecom.LoginResult loginres= objsession.login('sudhir.b@live.com','Sales@287ceORwreqr0tevKvlZ41GdFm1p');
   PartnerSoapSforcecom.LoginResult loginres= objsession.login(userdata.Username__c,userdata.Password__c+userdata.Stoken__c);
   string sessionId= loginres.sessionID;
   
   Customerregister.SessionHeader_element header= new Customerregister.SessionHeader_element();
   header.sessionID=sessionId;
   
  Customerregister.customerreg objreg= new Customerregister.customerreg();
  objreg.SessionHeader=header;
  string result=objreg.createaccount(acc.name,acc.phone);
  if (result=='success')
  {
  insert acc;
  }
   return (new pagereference('/'+acc.Id).setredirect(true));
    }

}
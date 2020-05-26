public without sharing class saveformdata {
    
    @AuraEnabled
    public static Id saveform(Account acc){
     system.debug(acc.Name);
        insert acc;
     return acc.Id;
     }
    
   
   
}
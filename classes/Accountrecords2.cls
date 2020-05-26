public with sharing class Accountrecords2 {
  
    public list<selectOption> options{ get; set; }
    
   public String searchkey { get; set; }
    
    public list<account> accts { get; set; }
   
 
    public PageReference dosearch() {
        accts= [select name,rating,industry from account where rating=:searchkey];
        return null;
    }






}
public with sharing class Accountrecords {
     
    public String searchkey { get; set; }
    public list<account> accts { get; set; }

    public PageReference dosearch() {
        accts= [select name,rating,industry from account where rating=:searchkey];
        return null;
    }


    
}
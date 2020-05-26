public class Paginationclass {
    
    @AuraEnabled
    
    public static list<Account> accountlist(){
        
        return [select Name,Rating,Phone from Account];
    }

}
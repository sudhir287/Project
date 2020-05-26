public class accountupdatescheduler implements schedulable{

public void execute(System.SchedulableContext SC){
 list <account> accountlist= [select id,name,rating from account];
 list<account> updatedaccountlist= new list<account>();
 for(Account a :accountlist){
  a.name= a.name+'Test';
  updatedaccountlist.add(a);
 }
database.update(updatedaccountlist);
}

}
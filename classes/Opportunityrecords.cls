public with sharing class Opportunityrecords {

public list<opportunity> opps{get;set;}
public string searchkey {get;set;}
public list<selectoption> stageoptions {get;set;}
public set<string> stages;
  public Opportunityrecords() {
  stageoptions=new list<selectoption>();
   /*stageoptions.add(new selectOption('Closed Won','Closed Won'));
   stageoptions.add(new selectOption('Qualification','Qualification'));*/
   stages=new set<string>();
   for(opportunity opp:[select id,stagename from opportunity])
   if(!stages.contains(opp.stagename))
   {
    {
   stageoptions.add(new selectOption(opp.stagename,opp.stagename));
    stages.add(opp.stagename);
  }
 } 
 }
public pagereference dosearch(){
opps=[select name,stagename,amount,type from opportunity where stagename=:searchkey];

return null;
}

}
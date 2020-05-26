public with sharing class accountlist {

    public list <wrapaccount>varlist { get; set; }
    public list<account> showaccountlist {get;set;}
    
    
    public accountlist()
    {
    list<account> acclist= [select name,rating from account];
    varlist= new list<wrapaccount>();
     for(account a: acclist)
    {
    wrapaccount wrap = new wrapaccount(a);
    varlist.add(wrap);
    }
    
    }
    
    public void showselected()
    {
    showaccountlist = new list<account>();
    for( wrapaccount a: varlist)
    {
     if(a.selected==true)
     {
     showaccountlist.add(a.acc);
    }
    }
    }
    
    public class wrapaccount{
     public account acc {get;set;}
     public boolean selected {get;set;}
     
     public wrapaccount(account a){
     acc=a;
     selected=false;
     }
     
    
    }
}
public class savecontactdata {

    @AuraEnabled
    public static Id savecontact(Contact con)
    {
     
        system.debug(con);
        insert con;
     return con.Id;
     }
}
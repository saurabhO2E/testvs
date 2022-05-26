public class AccountHandler {
    public static Account insertNewAccount(String accName)
    {
        Account a=new Account(name=accName);
        try
        {
            insert a;
            return a;
        }
        catch(DMlException de)
        {
           System.debug(de.getMessage());
           return null;
            
        }
        
        
        
        
    }

}
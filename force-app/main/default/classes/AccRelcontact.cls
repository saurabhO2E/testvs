public with sharing class AccRelcontact {
    @AuraEnabled(cacheable=true)
    public static list<Account> getContacts() {
     List<Account> Acc = [SELECT Id, name,Phone,Rating,AccountNumber,Site, (SELECT Id, LastName FROM Contacts) FROM Account];
        
        //system.debug(Acc[0].Contacts[0].Name);

        //Add isAccessible() check
        return Acc;
    }
}
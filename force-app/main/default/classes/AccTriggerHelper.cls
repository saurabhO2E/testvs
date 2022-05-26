public class AccTriggerHelper 
{
    public static void ques1(List<Account>acList)
    {
        List<Id>idList=new List<Id>();
        List<Opportunity>opList=new List<Opportunity>();
        for(Account a: acList)
        idList.add(a.id);
        List<account>alist=[select name ,(select name from opportunities) from account where id IN :idList];
        for(Account a : aList)
        {
            List<opportunity>oList=a.opportunities;
            if(oList.size()==0)
            {
                opList.add(new opportunity(name = 'First ooportunity - '+a.name , closeDate=date.valueOf('2018-06-23'), StageName = 'closed Won',accountid=a.id));
                
            }
            
        }
        insert opList;
     }
     
    public static void ques2(List<Opportunity>opList)
    {
        Map<String,opportunity>mMap=new map<String,opportunity>();
        List<string>nameList=new List<string>();
        for(opportunity o : opList)
        {
            namelist.add(o.name);
        }  
        List<opportunity>oList=[select name,accountid from opportunity where name IN : nameList];
        for(opportunity o : oList)
        {
            mMap.put(o.name,o);
        }
        for(opportunity o : opList)
        {
            if(mMap.containskey(o.name))
            {
                Opportunity op=mMap.get(o.name);
                if(op.accountid==o.accountid)
                {
                    o.name+='Duplicate Opportunity';
                }
                    
            }
        }
        
        
        
    }
    
    public static void ques4(List<Account>acList)
    {
        List<Id>idList=new List<Id>();
        List<Opportunity>opList=new List<Opportunity>();
        for(Account a: acList)
        idList.add(a.id);
        List<account>alist=[select name ,(select name,probability from opportunities) from account where id IN :idList];
         integer i=0;
        for(account a  : alist)
        {
            List<opportunity>oList=a.opportunities;
            for(opportunity op : olist)
            {
                if(!(op.Probability==100 || op.Probability==0))
                {
                    aclist.get(i).addError('Cant be deleted');
                }
            }
            i++;
        }
        
    }
    
    
     public static void ques6(List<Lead>ldList)
     {
         List<Database.LeadConvert>lcList=new List<Database.LeadConvert>();
         
         for(Lead l :ldList)
         {
            if(l.LeadSource=='Phone Inquiry' && l.isConverted==false)
            {Database.LeadConvert lc=new Database.LeadConvert();
             lc.setLeadID(l.id);
             lc.convertedstatus='Closed - Converted';
             lc.ownerId=userinfo.getUserId();
             lcList.add(lc);
            }
         }
         
         Database.convertLead(lcList,false);
         
         
         
     }

    
    public static void ques7(List<opportunity>opList)
    {
        List<Opportunity>newopList=new List<Opportunity>();
        for(opportunity o :opList)
        {
            Opportunity op=new Opportunity();
            op.name=o.name+' Backup';
            op.CloseDate=o.CloseDate;
            op.stageName=o.stageName;
            
            newopList.add(op);
        }
        Database.insert(newopList);
        
    }
    
    public static void ques9(List<Opportunity>opList)
    {
        Id uId=userinfo.getUserId();
        List<Opportunity>oList=[Select name,stageName,probability from opportunity where ownerid= :uId AND probability!=100 AND probability!=0];
        if(oList.size()>=2)
        {
            opportunity op=oplist.get(0);
            op.addError('User already has more than 2 open opportunity');
        }
        
        
    }
    
    
    
    public static void  ques8(List<opportunity>oldList ,List<opportunity>newList)
    {
       integer i=0;
       list<id>rid=new list<id>();
       for(opportunity o:oldList ) 
       {
           rid.add(o.id);
       }
        List<opportunity>opList=[select name ,stageName ,(select id from tasks) from opportunity where id IN : rid]; 
        for(opportunity o : opList)
        {
            List<task>tList=o.tasks;
            if(tlist.size() >0)
            {
                if(o.stageName != newlist.get(i).stageName && (o.stageName!='closed Won' && o.stageName!='closed Lost'))
                {
                    newList.get(i).stageName.addError('You caant change the stage until any task is related to it');
                }
            }
            i++;
        }
        
    }
    
     public static void ques3(List<account>acList)
     {
         list<id>uid=new List<id>();
         List<Account_Backup__c>acbList=new List<Account_Backup__c>();
         for(account a :acList)
         {
             uid.add(a.id);
         }
             
         List<account>aList=[select name , phone from account where masterRecordid!=null AND id IN :uid ALL ROWS];
         for(account a : aList)
         {
            acbList.add(new Account_Backup__c(name=a.name ,phone_number__c=a.phone)); 
         }
         
         insert acbList;
     
    
}
    
    
    
    public static void ques10(List<opportunityLineItem> olList)
    {
        List<id>pId=new List<Id>();
        
       
        for(opportunityLineItem o : olList)
        {
                        
            if(o.ListPrice<1000)
            {
                o.addError('This product cant be added');
                
            }
            else
            {
               pId.add(o.product2id);     
            }
            
         }
        List<Product2>pList=[Select Description from product2 where id IN : PID];
        integer i=0;
        for(opportunityLineItem op : olList)
        {
            op.Description=plist.get(i).Description;
            i++;
           
        }
        
        
        
        
       
 }
    
    
    public static void ques5(List<opportunity>opList)
    {
        List<Id>accId=new List<id>();
        for(opportunity o : opList)
        {
            if(o.amount > 10000)
            {
                accId.add(o.AccountId);
            }
        }
        List<Account>accList=[select name,Rating,CustomerPriority__c from Account where id IN :accId ];
         
        for(Account a : accList)
        {
            a.Rating='Hot';
            a.CustomerPriority__c='High';
        }
        update accList;
           
             
           
       }
    
}
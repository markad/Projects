trigger NewJobApplicationTrigger on Job_Application__c (before insert) {
    
    
    Map<Id, Job_Application__c> jobs = new Map<Id, Job_Application__c>([SELECT Id, Candidate__r.First_Name__c,
                                                                        Candidate__r.Last_Name__c,
                                                                        Position__r.Min_Pay__c,Position__r.Max_Pay__c
                                                                        FROM Job_Application__c WHERE Id IN:Trigger.New]);
    
   System.Debug(jobs);

   /* Map<Id,Candidate__c> lCandidate_Details=new Map<Id,Candidate__c>([SELECT First_Name__c,Last_Name__c FROM Candidate__c WHERE Id=:lCandidate_Id]);    
    Map<Id,Position__c> lPosition_Details=new Map<Id,Position__c>([SELECT Min_Pay__c,Max_Pay__c FROM Position__c WHERE Id=:lPosition_Id]);    
    for(Job_Application__c jobObject:trigger.new){
        jobObject.Candidate_Name__c=lCandidate_Details.get(jobObject.Candidate__c).First_Name__c+' '+lCandidate_Details.get(jobObject.Candidate__c).Last_Name__c;
        jobObject.Max_Salary__c=lPosition_Details.get(jobObject.Position__c).Max_Pay__c;
        jobObject.Min_Salary__c=lPosition_Details.get(jobObject.Position__c).Min_Pay__c;
            System.debug(''+jobObject);
*/
   
}
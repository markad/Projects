trigger NewTaskLead on Lead (after insert) {

           

        for(Lead lL:trigger.new){
        Task lTask=new Task();
        lTask.Subject='Call the User';
        lTask.WhoId=lL.Id;
        //Insert into DB    
        insert lTask;
    
       }
    
}
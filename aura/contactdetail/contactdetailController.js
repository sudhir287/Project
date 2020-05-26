({
	savedetails : function(component, event, helper) {
		console.log('contact comp');
        component.set("v.contactdetails.AccountId",component.get("v.parentrecordid"));
        var Con=component.get("v.contactdetails");
        var action=component.get("c.savecontact");
        action.setParams({'con':Con})
        action.setCallback(this,function(response){
          var state= response.getState();
            if(state==='SUCCESS')
            {
                console.log('contact saved succesfully');
            }
            else if(state==='ERROR')
            {
                var errors= response.getError();
                if(errors[0]&&errors[0].message)
            {
                
                console.log('error message is'+errors[0].message);
            }
            }
            
       })
        $A.enqueueAction(action);
	},
    
    delete : function(component, event, helper){
      var currentsizelist= component.get("v.contdetaillist");
     var index= component.get("v.indexno");
    currentsizelist.splice(index,1);
    component.set("v.contdetaillist",currentsizelist)
    
    
}
})
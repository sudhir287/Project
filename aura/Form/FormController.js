({
	savedata : function(component, event, helper) {
        console.log("save function");
		var Acc= component.get("v.Accountdata");
        var action= component.get("c.saveform");
        action.setParams({acc:Acc});
        action.setCallback(this,function(response){
          var state=  response.getState();
           if (state=="SUCCESS")
           {
          
               alert('data saved');
               console.log(response.getReturnValue());
               component.set("v.datasubmitted",'true');
               component.set("v.parentid",response.getReturnValue());
             }
            else if(state="ERROR"){
              var errors= response.getError();
            if(errors[0]&&errors[0].message)
            {
                console.log('error message is'+errors[0].message);
            }
            }
        })
       $A.enqueueAction(action); 
	},
    
    adddetails : function(component, event, helper) {
        var currentlist=component.get("v.contactdetaillist");
        var currentsize=parseInt((currentlist.length));
        var newsize=parseInt(currentsize)+1;
        currentlist.push(newsize);
        component.set("v.contactdetaillist",currentlist);
        
        
    }
        
        
        
        
})
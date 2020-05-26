({
	doinit : function(component, event, helper) {
		
        var action= component.get("c.accountlist");
        action.setCallback(this,function(response){
            var records=response.getReturnValue();
            component.set('v.AllAccounts',records);
            component.set('v.Maxpage', Math.floor((records.length+9)/10));
            helper.renderpage(component);
        })
        $A.enqueueAction(action);
	},
    renderpage : function(component, event, helper){
        helper.renderpage(component);
    }
    
   
})
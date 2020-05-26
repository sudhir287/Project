({
	Previous : function(component, event, helper) {
		var currentTab=component.get("v.selTabid");
        if(currentTab == '2'){
            component.set("v.selTabid", '1');
        } 
       else if(currentTab == '3'){
            component.set("v.selTabid", '2');
        } 
      
	},
    Next : function(component, event, helper) {
		var currentTab=component.get("v.selTabid");
        if(currentTab == '1'){
            component.set("v.selTabid", '2');
        } 
       else if(currentTab == '2'){
            component.set("v.selTabid", '3');
        }
	}
})
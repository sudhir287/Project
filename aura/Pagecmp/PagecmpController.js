({
	first : function(component, event, helper) {
       component.set("v.currentPageNumber",1); 
		
	},
    last : function(component, event, helper) {
       component.set("v.currentPageNumber",component.get("v.maxPageNumber")); 
		
	},
    previous : function(component, event, helper) {
       component.set("v.currentPageNumber",Math.max(component.get("v.currentPageNumber")-1,1)); 
		
	},
    next : function(component, event, helper) {
       component.set("v.currentPageNumber",Math.min(component.get("v.currentPageNumber")+1,component.get("v.maxPageNumber"))); 	
	}
    
    
})
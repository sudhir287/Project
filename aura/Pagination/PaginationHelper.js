({
	renderpage : function(component) {
        var records=component.get("v.AllAccounts");
        var pagenumber= component.get("v.Pagenumber");
        var currentlist=records.slice((pagenumber-1)*10,pagenumber*10);
        component.set("v.Currentlist",currentlist);
		
	}
})
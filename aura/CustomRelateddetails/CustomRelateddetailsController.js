({
    doinit : function(component, event, helper) {
     var recid= component.get("v.recordid");
     var action=component.get("c.getopp");
      action.setParams({"accid":recid});
      action.setCallback(this,function(Response)
      {
       var state=Response.getState();
       if(state=='SUCCESS')
       {
           var opplist=Response.getReturnValue;
           component.set("v.oppdetail",opplist);
       }
        else
        {
            console.log('no results');
        }

      });
     $A.enqueueAction(action);
    }
})

	var linkRelay = function(e){
												
		  var ele = Event.element(e);																						
		  if (ele.getAttribute("box") != null)
		  {
			Modalbox.show(ele.getAttribute("href"), {title: ele.getAttribute("box"), width: 500, height: 220});
		  	return false;
		  }
		  else
		  {
		    window.location = ele.getAttribute("href");
		  }
 											}
	var myFishEye = new FishEyeToolBar("fishEye", { createSub : function(ele, options){ 
					return new FishEyeItemDown(ele, options);
														}});
myFishEye.addEventListener("itemClick", linkRelay);

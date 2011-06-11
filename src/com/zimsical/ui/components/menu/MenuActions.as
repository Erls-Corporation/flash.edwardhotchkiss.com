
package com.zimsical.ui.components.menu {
   
  	import com.asual.SWFAddress.SWFAddress;
  	import com.zimsical.ui.components.menu.Views;
  	
  	import flash.display.Loader;
  	import flash.events.Event;
  	import flash.events.ProgressEvent;
  	import flash.net.URLLoader;
  	import flash.net.URLRequest;

  	public class MenuActions 
  	{
		
    	public static function getContent(viewName:String, fontSize:Number, callback:Function):void
    	{
      		var url:String;
      		
      		switch (viewName) {
        		case Views.CONTACT:
        			SWFAddress.setValue("contact/");
          			break;
          		case Views.EDWARD:
        			SWFAddress.setValue("edward-hotchkiss/");
          			url = "./assets/data/edward.txt";
          			break;	
        		case Views.PORTFOLIO:
        			SWFAddress.setValue("portfolio/");
          			url = "./assets/data/portfolio.txt";
          			break;
        		case Views.PROJECTSANDBLOG:
        			SWFAddress.setValue("projects-and-blog/");
          			url = "./assets/data/projectsandblog.txt";
          			break;
        		default:
        			SWFAddress.setValue("/");
          			trace("Error: unknown viewName");
          			callback(null);
          			return;
          		break;
      		}

			if (url != "undefined" && url != null) {
      			var loader:URLLoader = new URLLoader();
      			loader.addEventListener(Event.COMPLETE, function():void { callback(loader.data); });
      			loader.load(new URLRequest(url));
   			}
    	}
  	
  	}
  	
}

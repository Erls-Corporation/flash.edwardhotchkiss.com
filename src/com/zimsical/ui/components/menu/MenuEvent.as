	
package com.zimsical.ui.components.menu {
  
  	import com.zimsical.ui.components.menu.MenuItemVO;
  	
  	import flash.events.Event;
   	
  	public class MenuEvent extends Event {
    	
    	public static const TYPE_CLICK:String = "MenuEvent.TYPE_CLICK";
    	
    	public var valueObject:MenuItemVO;
    
    	public function MenuEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    	{	
      		super(type, bubbles, cancelable);
    	}
  
  	}
  	
}

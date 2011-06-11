
package com.zimsical.ui.components.menu {

  	import com.zimsical.ui.components.menu.Views;
  	import com.zimsical.ui.components.menu.MenuItemVO;
  
  	import flash.display.Sprite;
  
  	public class Menu extends Sprite { 
    	
    	private const ITEM_PADDING:Number = 10;

    	private var items:Array;
    
    	public function Menu() {  

      		items = new Array();

      		var edward:MenuItemVO = new MenuItemVO();
      		edward.title = "EDWARD";
      		edward.fontSize = 12;
      		edward.isExternal = false;
      		edward.type = Views.EDWARD;
      		items.push(new MenuItem(edward));
      		
      		var portfolio:MenuItemVO = new MenuItemVO();
      		portfolio.title = "PORTFOLIO";
      		portfolio.fontSize = 1;
      		portfolio.isExternal = false;
      		portfolio.type = "portfolio";
      		items.push(new MenuItem(portfolio));

      		var ProjectsAndBlog:MenuItemVO = new MenuItemVO();
      		ProjectsAndBlog.title = "PROJECTS & BLOG";
      		ProjectsAndBlog.fontSize = 16;
      		ProjectsAndBlog.isExternal = false;
      		ProjectsAndBlog.type = Views.PROJECTSANDBLOG;
      		items.push(new MenuItem(ProjectsAndBlog));

      		var contact:MenuItemVO = new MenuItemVO();
      		contact.title = "CONTACT";
      		contact.isExternal = false;
      		contact.type = Views.CONTACT;
      		items.push(new MenuItem(contact));

      		draw();
      		    	
    	}
    
    	public function draw():void {
        	
        	for (var i:Number = 0; i < items.length; i++) {
        		var prev:MenuItem = items[i - 1];
        		items[i].y = 0;
        		items[i].x = (prev) ? prev.x + MenuItem(items[i]).TOTAL_WIDTH + ITEM_PADDING : 0;
        		addChild(items[i]);
      		
      		}
    	
    	}
    	
  	}

}

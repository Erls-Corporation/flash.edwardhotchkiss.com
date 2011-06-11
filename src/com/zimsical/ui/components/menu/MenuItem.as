
package com.zimsical.ui.components.menu {
	
  	import com.zimsical.ui.components.menu.Views;
  	import com.zimsical.ui.components.menu.MenuItemVO;
  	import com.greensock.TweenLite;
  	import com.greensock.plugins.TweenPlugin;
  	import com.greensock.plugins.TintPlugin;
  	import com.asual.SWFAddress.SWFAddress;
  	import com.asual.SWFAddress.SWFAddressEvent;
  	import flash.display.Sprite;
  	import flash.events.MouseEvent;
  	import flash.text.TextField;
  	import flash.text.TextFormat;
  	import flash.text.TextFieldAutoSize;

  	public class MenuItem extends Sprite {

    	public const TOTAL_WIDTH:Number = 240;
    	public const TOTAL_HEIGHT:Number = 30;

    	private var clicker:Sprite;
    	private var backgroundRight:Sprite;
    	private var title:TextField;

    	private var valueObject:MenuItemVO;
    	
    	public function MenuItem(viewVO:MenuItemVO) { 

      		valueObject = viewVO;

      		title = new TextField();
      		title.autoSize = TextFieldAutoSize.CENTER;
			var myX:Number = (TOTAL_WIDTH / 2) - (title.width / 2);
      		title.x = myX;
      		title.y = 5;
      		title.multiline = false;
      		title.height = TOTAL_HEIGHT;
      		title.selectable = false;
      		title.text = viewVO.title;
      		title.embedFonts = true;

      		var tf:TextFormat = new TextFormat();
      		tf.color = 0xFFFFFF;
      		tf.size = 14;
      		tf.font = "Ubahn";
      		title.setTextFormat(tf);
      		tf = null;

      		backgroundRight = new Sprite();
      		backgroundRight.alpha = 1;
      		backgroundRight.graphics.beginFill(0xF920A2);
      		backgroundRight.graphics.drawRect(0, 0, TOTAL_WIDTH, TOTAL_HEIGHT);
      		backgroundRight.x = 0;
      		backgroundRight.y = 0;
      
      		clicker = new Sprite();
      		clicker.graphics.beginFill(0xFFFFFF);
      		clicker.graphics.drawRect(0, 0, TOTAL_WIDTH, TOTAL_HEIGHT);
      		clicker.x = clicker.y = 0;
      		clicker.alpha = .000001;
      		clicker.buttonMode = true;
      		clicker.useHandCursor = true;
      		clicker.mouseChildren = true;

      		addChild(backgroundRight);
      		addChild(title);
      		addChild(clicker);
      
      		if (valueObject.isStatic) {
      			
        		onMouseOver(null);
      		
      		} else {
        		clicker.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        		clicker.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        		clicker.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
      		}
      		
    	}

    	private function onMouseOver(e:MouseEvent):void
    	{ 
      		TweenLite.to(backgroundRight, 0.2, { tint: 0xF66CBF });
    	}

    	private function onMouseOut(e:MouseEvent):void
    	{ 
      		TweenLite.to(backgroundRight, 0.2, { tint: 0xF920A2 });
    	}

	    private function onMouseDown(e:MouseEvent):void
    	{	
      		e = null;

     		if (!valueObject.isStatic) {
        		var me:MenuEvent = new MenuEvent(MenuEvent.TYPE_CLICK, true);
        		me.valueObject = valueObject;
        		dispatchEvent(me);
      		}
    
    	}
  	}
  	
}

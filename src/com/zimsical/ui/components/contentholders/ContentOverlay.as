
package com.zimsical.ui.components.contentholders
{

  	import flash.display.Sprite;
  	import flash.events.Event;
  	import flash.events.MouseEvent;
  	import flash.filters.DropShadowFilter;
  	import flash.text.AntiAliasType;
  	import flash.text.StyleSheet;
  	import flash.text.TextField;
  	import flash.text.TextFormat;
  	import com.asual.SWFAddress.SWFAddress;
  	import com.asual.SWFAddress.SWFAddressEvent;

  	public class ContentOverlay extends Sprite
  	{
  		
    	private var background:Sprite;
    	private var content:TextField;
    	private var closeButton:Sprite;

    	public function ContentOverlay(w:Number, h:Number, fontSize:Number)
    	{
      		background = new Sprite();
      		background.graphics.beginFill(0xFFFFFF);
      		background.graphics.drawRect(0, 0, w, h);
			var contentShadow1:DropShadowFilter = new DropShadowFilter(12, 45, 0x454545, .5, 8, 8);		
			var contentShadow2:DropShadowFilter = new DropShadowFilter(12, 245, 0x454545, .5, 8, 8);		
			var filtersArray:Array = new Array(contentShadow1, contentShadow2);
			background.filters = filtersArray;
      		content = new TextField();
      		content.htmlText = "One moment please, we're loading the page...";
      		content.x = content.y = 20;
      		content.height = h - 5;
      		content.width = w - 30;
      		content.wordWrap = true;
      		content.selectable = true;
      		content.multiline = true;
      		content.embedFonts = true;
      		content.antiAliasType = AntiAliasType.ADVANCED;
      		closeButton = new BackButton;
      		addChild(closeButton);
      		addChild(background);
      		addChild(content);
      		closeButton.x = background.x + background.width - 160;
      		closeButton.y = -50;
      		closeButton.addEventListener(MouseEvent.MOUSE_DOWN, onClose);	
    	}

    	public function setContent(text:String):void
    	{
      		content.htmlText = text;
      		content.embedFonts = true;
      		var tf:TextFormat = new TextFormat();
      		tf.font = "DIN-Regular";
      		tf.size = 14;
      		tf.color = 0x777777;
      		content.setTextFormat(tf);
            var myCSS:StyleSheet = new StyleSheet();
            myCSS.setStyle("a:link", {color:"#F920A2", textDecoration:"underline"} );
            content.styleSheet = myCSS;
    	}
    
    	public function onClose(e:MouseEvent):void
    	{
      		dispatchEvent(new Event(Event.CLOSE, true));
			SWFAddress.setValue("/");
    	}
    	
  	}

}

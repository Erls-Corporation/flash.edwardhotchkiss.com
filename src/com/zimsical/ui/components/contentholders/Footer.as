
package com.zimsical.ui.components.contentholders
{

	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.events.Event;

	public class Footer extends Sprite {

		public var footer:Sprite;
		public var footerText:TextField;
		public var footerCopyText:String;
		public var footerTextFormat:TextFormat;
		
        public function Footer():void
        {
        	
        	addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
        }
            
        private function onAddedToStage(e:Event):void
        {
      		stage.addEventListener(Event.RESIZE, onStageResize, false, 0, true);
        	
      		footerText = new TextField;
      		footerCopyText = "[ <a href='http://www.mediatemple.net?refdom=edwardhotchkiss.com'>I LOVE MEDIATEMPLE</a> ]";
      		footerText.htmlText = footerCopyText;
           	footerText.embedFonts = true;
      		footerText.multiline = false;
      		footerText.selectable = false;
      		footerText.embedFonts = true;
      		footerText.antiAliasType = AntiAliasType.ADVANCED;
      		
      		footerTextFormat = new TextFormat;
      		footerTextFormat.color = 0x000000;
      		footerTextFormat.size = 8;
      		footerTextFormat.font = "Silkscreen";
      		footerText.setTextFormat(footerTextFormat);
      		footerTextFormat = null;	
      		
            var myCSS:StyleSheet = new StyleSheet();
            myCSS.setStyle("a:link", {color:"#F920A2"});
            footerText.styleSheet = myCSS;
           
            footer = new Sprite;
			footer.graphics.beginFill(0xFFFFFF);
      		footer.graphics.drawRect(0, stage.stageHeight, stage.stageWidth, 30);
      		addChild(footer);
      		footer.addChild(footerText);
      		footerText.width = 115;
            footerText.x = stage.stageWidth - footerText.width - 20;
            footerText.y = stage.stageHeight + 10;
            
            TweenLite.to(footer, 0.8, {y:"-30", ease:Expo.easeOut });
            
        }
        
        private function onStageResize(e:Event):void
        {

        }

	}
	
}

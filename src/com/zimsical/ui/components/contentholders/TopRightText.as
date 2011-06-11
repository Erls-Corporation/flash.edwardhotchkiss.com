
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
	
	public class TopRightText extends Sprite
	{

		public var topData:Sprite;
		public var topDataQuote:TextField;
		public var topDataEmail:TextField;
		public var topDataPhone:TextField;
		public var topDataGlobalTextFormat:TextFormat;
		public var topDataEmailTextFormat:TextFormat;
		
        public function TopRightText():void
        {

			topData = new Sprite;
			addChild(topData);

        	topDataQuote = new TextField;
      		topDataQuote.text = '"Only settle for the best"';
           	topDataQuote.embedFonts = true;
      		topDataQuote.multiline = false;
      		topDataQuote.selectable = false;
      		topDataQuote.embedFonts = true;
      		topDataQuote.antiAliasType = AntiAliasType.ADVANCED;
      		topDataQuote.width = 400;
      		topDataQuote.height = 200;
      		
      		topDataGlobalTextFormat = new TextFormat;
      		topDataGlobalTextFormat.color = 0xFFFFFF;
      		topDataGlobalTextFormat.size = 36;
      		topDataGlobalTextFormat.font = "Bebas";
      		topDataGlobalTextFormat.letterSpacing = -1;

      		topDataQuote.setTextFormat(topDataGlobalTextFormat);
      		
      		topData.addChild(topDataQuote);
      		topDataQuote.x = 40;
      		topDataQuote.y = 200;

        }

	}
	
}

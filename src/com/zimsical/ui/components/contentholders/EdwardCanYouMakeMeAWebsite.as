
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
	
	public class EdwardCanYouMakeMeAWebsite extends Sprite
	{

		public var dollarBillzHolder:Sprite;
		public var dollarBillzTextField:TextField;
		public var dollarTextFormat:TextFormat;
		
        public function EdwardCanYouMakeMeAWebsite(stageWidth:Number, stageHeight:Number):void
        {

			dollarBillzHolder = new Sprite;
			dollarBillzHolder.graphics.beginFill(0xFFFFFF);
			dollarBillzHolder.graphics.drawRect(0, 0, stageWidth, stageHeight);
			dollarBillzHolder.graphics.endFill();
			addChild(dollarBillzHolder);

        	dollarBillzTextField = new TextField;
      		dollarBillzTextField.text = "FUCK YOU, PAY ME";
           	dollarBillzTextField.embedFonts = true;
      		dollarBillzTextField.multiline = false;
      		dollarBillzTextField.selectable = false;
      		dollarBillzTextField.embedFonts = true;
      		dollarBillzTextField.antiAliasType = AntiAliasType.ADVANCED;
      		dollarBillzTextField.width = 940;
      		dollarBillzTextField.height = 240;
      		
      		dollarTextFormat = new TextFormat;
      		dollarTextFormat.color = 0xF920A2;
      		dollarTextFormat.size = 172;
      		dollarTextFormat.font = "Bebas";
      		dollarTextFormat.letterSpacing = -1;

      		dollarBillzTextField.setTextFormat(dollarTextFormat);
      		
      		dollarBillzHolder.addChild(dollarBillzTextField);
      		dollarBillzTextField.x = (stageWidth / 2) - (dollarBillzTextField.width / 2);
      		dollarBillzTextField.y = (stageHeight / 2) - (dollarBillzTextField.height / 2);

        }

	}
	
}

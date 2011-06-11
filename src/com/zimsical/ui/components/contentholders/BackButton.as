
package com.zimsical.ui.components.contentholders
{

	import flash.display.Sprite;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	import flash.text.TextFormat;
	import flash.text.TextField;
	
	public class BackButton extends Sprite {
	
		private var backButton:Sprite;
		
		public function BackButton()
		{

			backButton = new Sprite;
			backButton.graphics.beginFill(0xFFFFFF, 0.9);
			backButton.graphics.drawRect(0, 0, 160, 30);
			backButton.graphics.endFill();
			addChild(backButton);
			var backText:TextField = backButtonText();
			backButton.addChild(backText);
			backText.x = (backButton.width / 2) - (backText.width / 2);
			backText.y = (backButton.height / 2) - (backText.height / 2);
			backButton.buttonMode = true;
			backButton.useHandCursor = true;
			
		}
		
		private function backButtonText():TextField
		{
      		
      		var backText:TextField = new TextField();
      		backText.text = "GO BACK";
      		backText.autoSize = TextFieldAutoSize.CENTER;
      		backText.multiline = false;
      		backText.height = 30;
      		backText.selectable = false;
      		backText.embedFonts = true;
      		backText.antiAliasType = AntiAliasType.ADVANCED;
      		
      		var backTextFormat:TextFormat = new TextFormat;
      		backTextFormat.color = 0xF920A2;
      		backTextFormat.size = 14;
      		backTextFormat.font = "Ubahn";
      		backText.setTextFormat(backTextFormat);
      		backTextFormat = null;	
      		
      		return backText;
		
		}

	}

}

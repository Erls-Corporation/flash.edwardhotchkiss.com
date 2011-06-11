
package com.zimsical.ui.components.social
{
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

  	TweenPlugin.activate([TintPlugin]);
  	
	public class Twitter extends Sprite
	{

		public var twitterLogo:Sprite = new Sprite;
		public var twitterLogoColor:uint = 0xFFFFFF;
		public var twitterLogoAlpha:Number = 0.5;
		public var twitterLogoWidth:int = 120;
		public var twitterLogoHeight:int = 32;
		public var twitterLogoX:int = 40;
		public var twitterLogoYFinish:int = 160;
		public var twitterLogoTextColor:Number = 0xF920A2;
		public var twitterLogoTextColorOver:Number = 0xF66CBF;
		public var mouseDownCallback:Function = twitterMouseDown;
		public var mouseOverCallback:Function = twitterMouseOver;
		public var mouseOutCallback:Function = twitterMouseOut;
		public var twitterInitFunc:Function = twitterInit;
		private var twitterText:TextField = new TextField;
		
		public function Twitter(stageWidth:Number, stageHeight:Number)
		{
			twitterLogo = drawtwitterLogo();
			addChild(twitterLogo);
			var twitterText:TextField = makeTwitterText();
			twitterLogo.addChild(twitterText);
			twitterText.x = 24;
			twitterText.y = 3;
			twitterLogo.x = twitterLogoX;
			twitterLogo.y = stageHeight + twitterLogo.height;
			twitterLogo.buttonMode = true;
			twitterLogo.useHandCursor = true;
			twitterInitFunc();
		}
		
		private function drawtwitterLogo():Sprite
		{
			var twitterBox:Sprite = new Sprite;
			twitterBox.graphics.beginFill(twitterLogoColor, twitterLogoAlpha);
			twitterBox.graphics.drawRect(0, 0, twitterLogoWidth, twitterLogoHeight);
			twitterBox.graphics.endFill();
			return twitterBox;
		}
		
		private function makeTwitterText():TextField
		{
      		twitterText.autoSize = TextFieldAutoSize.CENTER;
      		twitterText.multiline = false;
      		twitterText.selectable = false;
      		twitterText.text = "twitter";
      		twitterText.embedFonts = true;
      		var twitterFormat:TextFormat = new TextFormat();
      		twitterFormat.color = twitterLogoTextColor;
      		twitterFormat.size = 22;
      		twitterFormat.font = "PicoBlackAl";
      		twitterText.setTextFormat(twitterFormat);
      		twitterFormat = null;
			return twitterText;
		}
		
		private function twitterInit():void {
            TweenLite.to(twitterLogo, 0.5, { delay:0.4, y:twitterLogoYFinish, ease:Expo.easeOut });
            twitterLogo.addEventListener(MouseEvent.CLICK, mouseDownCallback);
            twitterLogo.addEventListener(MouseEvent.MOUSE_OVER, mouseOverCallback);
            twitterLogo.addEventListener(MouseEvent.MOUSE_OUT, mouseOutCallback);
		}

		private function twitterMouseDown(e:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://www.twitter.com/edwardhotchkiss/"), "_blank");	
		}
		
		private function twitterMouseOver(e:MouseEvent):void
		{		
			TweenLite.to(twitterText, 0.3, { tint:twitterLogoTextColorOver });
		}

		private function twitterMouseOut(e:MouseEvent):void
		{
			TweenLite.to(twitterText, 0.3, { tint:twitterLogoTextColor });
		}
	
	}

}

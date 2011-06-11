
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
  	
	public class FaceBook extends Sprite
	{
		
		public var faceBookLogo:Sprite = new Sprite;
		public var faceBookLogoColor:uint = 0xFFFFFF;
		public var faceBookLogoAlpha:Number = 0.5;
		public var faceBookLogoWidth:int = 120;
		public var faceBookLogoHeight:int = 30;
		public var faceBookLogoX:int = 40;
		public var faceBookLogoYFinish:int = 200;
		public var faceBookLogoTextColor:Number = 0xF920A2;
		public var faceBookLogoTextColorOver:Number = 0xF66CBF;
		public var mouseDownCallback:Function = faceBookMouseDown;
		public var mouseOverCallback:Function = faceBookMouseOver;
		public var mouseOutCallback:Function = faceBookMouseOut;
		public var faceBookInitFunc:Function = faceBookInit;
		private var faceText:TextField = new TextField;
		
		public function FaceBook(stageWidth:Number, stageHeight:Number)
		{
			faceBookLogo = drawfaceBookLogo();
			addChild(faceBookLogo);
			var faceBookText:TextField = faceBookText();
			faceBookLogo.addChild(faceBookText);
			faceBookText.x = 22;
			faceBookText.y = 3;
			faceBookLogo.x = faceBookLogoX;
			faceBookLogo.y = stageHeight + faceBookLogo.height;
			faceBookLogo.buttonMode = true;
			faceBookLogo.useHandCursor = true;
			faceBookInitFunc();
		}
		
		private function drawfaceBookLogo():Sprite
		{
			var faceBookBox:Sprite = new Sprite;
			faceBookBox.graphics.beginFill(faceBookLogoColor, faceBookLogoAlpha);
			faceBookBox.graphics.drawRect(0, 0, faceBookLogoWidth, faceBookLogoHeight);
			faceBookBox.graphics.endFill();
			return faceBookBox;
		}
		
		private function faceBookText():TextField
		{
      		faceText.autoSize = TextFieldAutoSize.CENTER;
      		faceText.multiline = false;
      		faceText.selectable = false;
      		faceText.text = "facebook";
      		faceText.embedFonts = true;
      		var faceBookFormat:TextFormat = new TextFormat();
      		faceBookFormat.color = faceBookLogoTextColor;
      		faceBookFormat.size = 18;
      		faceBookFormat.font = "Aller";
      		faceText.setTextFormat(faceBookFormat);
      		faceBookFormat = null;
			return faceText;
		}
		
		private function faceBookInit():void {
            TweenLite.to(faceBookLogo, 0.7, { delay:0.7, y:faceBookLogoYFinish, ease:Expo.easeOut });
            faceBookLogo.addEventListener(MouseEvent.CLICK, mouseDownCallback);
            faceBookLogo.addEventListener(MouseEvent.MOUSE_OVER, mouseOverCallback);
            faceBookLogo.addEventListener(MouseEvent.MOUSE_OUT, mouseOutCallback);
		}
		
		private function faceBookMouseDown(e:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://www.facebook.com/pages/Edward-Hotchkiss-Designer/241356959865"), "_blank");	
		}
		
		private function faceBookMouseOver(e:MouseEvent):void
		{
			TweenLite.to(faceText, 0.5, { tint:faceBookLogoTextColorOver });
		}

		private function faceBookMouseOut(e:MouseEvent):void
		{
			TweenLite.to(faceText, 0.5, { tint:faceBookLogoTextColor });
		}
	
	}

}

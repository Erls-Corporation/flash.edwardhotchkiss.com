
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

  	TweenPlugin.activate([TintPlugin]);
  	
	public class TwitterBird extends Sprite
	{

		public var twitterBird:Sprite = new Sprite;
		public var twitterBirdBody:Sprite = new Sprite;
		public var twitterBirdOuterEye:Sprite = new Sprite;
		public var twitterBirdInnerEye:Sprite = new Sprite;
		public var twitterBirdOuterEyeColor:uint = 0xFFFFFF;
		public var twitterBirdInnerEyeColor:uint = 0x000000;
		public var twitterBirdAlpha:Number = 1;
		public var twitterBirdX:int;
		public var twitterBirdYFinish:int = 40;
		public var mouseDownCallback:Function = twitterBirdMouseDown;
		public var mouseOverCallback:Function = twitterBirdMouseOver;
		public var mouseOutCallback:Function = twitterBirdMouseOut;
		public var twitterBirdInitFunc:Function = twitterBirdInit;
		
		public function TwitterBird(stageWidth:Number, stageHeight:Number)
		{
			addChild(twitterBird);
			twitterBirdBody = drawBody();
			twitterBirdOuterEye = drawOuterEye();
			twitterBirdInnerEye = drawInnerEye();
			twitterBird.addChild(twitterBirdOuterEye);
			twitterBird.addChild(twitterBirdInnerEye);
			twitterBirdInnerEye.x = 1.5;
			twitterBirdInnerEye.y = 1.5;
			twitterBird.x = stageWidth - twitterBird.width - 40;
			twitterBird.y = stageHeight + twitterBird.height;
			twitterBird.buttonMode = true;
			twitterBird.useHandCursor = true;
			twitterBird.alpha = twitterBirdAlpha;
			twitterBirdInitFunc();
		}
		
		public function drawOuterEye():Sprite
		{
			var twitterBirdInnerEye:Sprite = new Sprite;
			twitterBirdInnerEye.graphics.beginFill(twitterBirdOuterEyeColor);
			twitterBirdInnerEye.graphics.drawEllipse(0, 0, 10, 15);
			twitterBirdInnerEye.graphics.endFill();
			return twitterBirdInnerEye;
		}
		
		public function drawInnerEye():Sprite
		{
			var twitterBirdInnerEye:Sprite = new Sprite;
			twitterBirdInnerEye.graphics.beginFill(twitterBirdInnerEyeColor);
			twitterBirdInnerEye.graphics.drawEllipse(0, 0, 7, 12);
			twitterBirdInnerEye.graphics.endFill();	
			return twitterBirdInnerEye;
		}

		public function drawBody():Sprite
		{
			var twitterBirdInnerEye:Sprite = new Sprite;
			twitterBirdInnerEye.graphics.beginFill(twitterBirdOuterEyeColor);
			twitterBirdInnerEye.graphics.drawEllipse(0, 0, 10, 15);
			twitterBirdInnerEye.graphics.endFill();
			return twitterBirdBody;
		}
		
		public function twitterBirdInit():void
		{
            TweenLite.to(twitterBird, 0.3, { delay:0.3, y:twitterBirdYFinish, ease:Expo.easeOut });
            twitterBird.addEventListener(MouseEvent.CLICK, mouseDownCallback);
            twitterBird.addEventListener(MouseEvent.MOUSE_OVER, mouseOverCallback);
            twitterBird.addEventListener(MouseEvent.MOUSE_OUT, mouseOutCallback);
		}

		public function twitterBirdMouseDown(e:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://www.twitter.com/edwardhotchkiss/"), "_blank");	
		}
		
		public function twitterBirdMouseOver(e:MouseEvent):void
		{		

		}

		public function twitterBirdMouseOut(e:MouseEvent):void
		{

		}
	
	}

}

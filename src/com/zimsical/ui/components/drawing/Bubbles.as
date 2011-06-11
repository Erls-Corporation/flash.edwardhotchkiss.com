
package com.zimsical.ui.components

{

	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.display.Sprite;

	public class Bubbles extends Sprite {
		
		private const SPEED:Number = 2.6;
		private const BUBBLE_COLOR:Number = 0xEBEBEB;

      	private var __yFinish:Number;
      	private var __SH:Number;
      	private var __SW:Number;
		private var __Bubbles:Array = new Array;

    	public function Bubbles(stageWidth:int, stageHeight:int):void {
    		__SW = stageWidth;
    		__SH = stageHeight;
    		for (var i:Number = 0; i < 50; i++) {
				var RandomXStartPos:Number = Math.random() * stageWidth;
				var __randomBubbleSize:int = Math.random() * 60;
				var RandomDelay:Number = Math.random() * 30 - 1;
				__yFinish = (stageHeight + 200) * -1;
				var __randomBubble:Sprite = new Sprite;
				__randomBubble.graphics.beginFill(BUBBLE_COLOR, 0.6);
				__randomBubble.graphics.drawCircle(RandomXStartPos, stageHeight + 100, __randomBubbleSize);
				__randomBubble.graphics.endFill();
				addChild(__randomBubble);
				__Bubbles[i] = __randomBubble;
   				TweenLite.to(__Bubbles[i], SPEED, { y:__yFinish, delay:RandomDelay, ease:Expo.easeIn, overwrite:2, onComplete:BubbleRepeater, onCompleteParams:[i] } );
      		};
       	};
       	
       	public function BubbleRepeater(__BubblesIndex:Number):void {
       		var Delay:Number = Math.random() * 2.6;
       		__Bubbles[__BubblesIndex].y = __SW;
   			TweenLite.to(__Bubbles[__BubblesIndex], SPEED, { delay:Delay, y:__yFinish, ease:Expo.easeIn, overwrite:2, onComplete:function():void { BubbleRepeater(__BubblesIndex) } } );
       	};

	};
	
};


package com.zimsical.ui.components.contentholders {
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class BG extends Sprite {

		public var myBG:Sprite = new Sprite();
		
		public var bgRotation:Number = Math.PI * 0.5;
		
        public function BG(stageWidth:int, stageHeight:int, myColor1:Number, myColor2:Number):void
        {
        	var fType:String = GradientType.LINEAR;
        	var colors:Array = [myColor1, myColor2];
        	var alphas:Array = [1, 1];
			var ratios:Array = [0, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(stageHeight, stageWidth, bgRotation, 0, 0);
			var sprMethod:String = SpreadMethod.PAD;
			var g:Graphics = myBG.graphics;
			g.beginGradientFill(fType, colors, alphas, ratios, matr, sprMethod );
      		g.drawRect(0, 0, stageWidth, stageHeight);
            addChild(myBG);
        }

	}
	
}

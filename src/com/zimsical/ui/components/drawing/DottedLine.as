
package com.zimsical.ui.drawing
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Rectangle;

	public class DottedLine extends Shape
	{
		private var lineWidth:Number;
		private var lineHeight:Number;
		private var lineColor:uint;
		private var lineAlpha:Number;
		private var lineDotWidth:Number;
		private var lineDotSpacing:Number;
		private var lineRotation:uint;
		
		public function DottedLine(w:Number = 50, h:Number = 1, color:uint = 0xFFFFFF, dotAlpha:Number = 1, dotWidth:Number = 1, spacing:Number = 0, r:uint = 90)
		{
			lineWidth = w;
			lineHeight = h;
			lineColor = color;
			this.alpha = dotAlpha;
			lineDotWidth = dotWidth;
			lineDotSpacing = spacing;
			lineRotation = r;
			drawDottedLine();
		}
		
		private function drawDottedLine():void
		{
			graphics.clear();
			var tile:BitmapData = new BitmapData(lineDotWidth + lineDotSpacing, lineHeight + 1, true);
			var r1:Rectangle = new Rectangle(0, 0, lineDotWidth, lineHeight);
			var argb:uint = returnARGB(lineColor, 255);
			tile.fillRect(r1, argb);
			var r2:Rectangle = new Rectangle(lineDotWidth, 0, lineDotWidth + lineDotSpacing, lineHeight);
			tile.fillRect(r2, 0x00000000);
			graphics.beginBitmapFill(tile, null, true);
			graphics.drawRect(0, 0, lineWidth, lineHeight);
			graphics.endFill();
			
		}
		
		private function returnARGB(rgb:uint, newAlpha:uint):uint
		{
			var argb:uint = 0;
			argb += (newAlpha<<24);
			argb += (rgb);
			return argb;
		}
		
	}
}

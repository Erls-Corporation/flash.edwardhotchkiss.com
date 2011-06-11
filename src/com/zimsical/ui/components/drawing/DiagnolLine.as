
package com.zimsical.ui.components.drawing
{

	import flash.display.Sprite;	

	public class DiagnolLine extends Sprite
	{

		private function DiagnolLine(lineColor:uint, lineSize:Number, lineRotation:Number = 0):Sprite
		{
			var diagnolLine:Sprite = new Sprite;
			diagnolLine.graphics.beginFill(lineColor, 1);
			for (var i:int = 0; i < lineSize; i++) {
				diagnolLine.graphics.drawRect(i, i, 1, 1);
			}
			diagnolLine.graphics.endFill();
			diagnolLine.rotation = lineRotation;
			return diagnolLine;
		}

	}
}
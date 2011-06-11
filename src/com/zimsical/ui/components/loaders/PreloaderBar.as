
package com.zimsical.ui.components.loaders
{

	import flash.display.Sprite;

	public class PreloaderBar extends Sprite
	{

		public var preloaderHolder:Sprite;
    	public var preloader:Sprite;

		public function PreloaderBar()
		{
			
			preloaderHolder = new Sprite;
			preloaderHolder.graphics.lineStyle(0, 0, 0, false);
			preloaderHolder.graphics.beginFill(0xCCCCCC, 1);
			preloaderHolder.graphics.drawRect(0, 0, 400, 1);
			preloaderHolder.graphics.endFill();
			addChild(preloaderHolder);
			
			preloader = new Sprite;
			preloader.graphics.lineStyle(0, 0, 0, false);
			preloader.graphics.beginFill(0xF920A2, 1);
			preloader.graphics.drawRect(0, 0, 400, 1);
			preloader.graphics.endFill();
			preloaderHolder.addChild(preloader);
			preloader.scaleX = 0;
			
		}

	}
	
}

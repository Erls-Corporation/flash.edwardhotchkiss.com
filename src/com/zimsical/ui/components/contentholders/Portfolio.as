
package com.zimsical.ui.components.contentholders
{

	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.asual.SWFAddress.SWFAddress;
	import com.zimsical.ui.components.contentholders.BG;
	import com.zimsical.ui.components.contentholders.EasingScrollBar;
	import com.zimsical.ui.components.contentholders.BackButton;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;

	public class Portfolio extends Sprite
	{

		private var portfolioBG2:Sprite;
		private var websiteID:int;
		private var websiteTitle:String;
		private var websiteDescription:String;
		private var websiteLink:String;
		private var portfolioType:String;
		private var screenshotName:String;
		private var myRole:String;
		private var itemHolder:Sprite
		private var loader:BulkLoader;
		private var projectScreenshot:Bitmap;
		private var preloaderHolder:Sprite;
		private var preloader:Sprite;
		private var items:Array;
		private var paragraphTextField:TextField;
		private var copyText:String;
		private var easingScrollBar:EasingScrollBar;
		private var stageWidth:Number;
		private var stageHeight:Number;
		private var websiteXML:XML;
		private var backButton:BackButton;
		
		public function Portfolio(SW:Number, SH:Number, wXML:XML)
		{
			websiteXML = wXML;
			stageWidth = SW;
			stageHeight = SH;

			portfolioBG2 = new Sprite;
			portfolioBG2.graphics.beginFill(0xFFFFFF, 0);
			portfolioBG2.graphics.drawRect(0, 0, stageWidth, stageHeight);
			portfolioBG2.graphics.endFill();
			portfolioBG2.width = stageWidth;
			portfolioBG2.height = stageHeight;
			addChild(portfolioBG2);
			portfolioBG2.x = 0;
			portfolioBG2.y = 0;
			portfolioScroller();
		}

		private function portfolioScroller():void
		{
			backButton = new BackButton;
			portfolioBG2.addChild(backButton);
			backButton.y = 50;
			backButton.x = (stageWidth / 2 ) + backButton.width - 20;
			
			var currentHeight:Number = new Number;
			currentHeight = 100;
			for (var i:int = 0; i < websiteXML..portfolio.portfolioItem.length(); i++)
			{
				copyText = getContent(i);
				var paragraph:Sprite = createParagraph(copyText);
				paragraph.x = (stageWidth / 2) - (300);
				portfolioBG2.addChild(paragraph);
				paragraph.y += currentHeight;
				currentHeight += paragraph.height + 25;
			}

			var filler:Sprite = new Sprite;
			filler.graphics.beginFill(0xFFFFFF, 0);
			filler.graphics.drawRect(0, 0, stageWidth, 100);
			filler.graphics.endFill();
			portfolioBG2.addChild(filler);
			filler.y = currentHeight;
			easingScrollBar = new EasingScrollBar(portfolioBG2, 0xFFFFFF, 0xF920A2, 0xF66CBF, 25, 25, 4, true);
			addChild(easingScrollBar);
			easingScrollBar.y = stageHeight;
            TweenLite.to(easingScrollBar, 0.8, {y:0, ease:Expo.easeOut });
            portfolioBG2.y = stageHeight;
			TweenLite.to(portfolioBG2, 1.6, {y:0, ease:Expo.easeOut });
			backButton.addEventListener(MouseEvent.CLICK, goBack);
		}
		
		private function goBack(e:MouseEvent):void
		{
			SWFAddress.setValue("/");
			removeChild(portfolioBG2);
			removeChild(easingScrollBar);
		}

		private function createParagraph(copyText:String):Sprite
		{
			var tf:TextFormat = new TextFormat();
			tf.font = "DIN-Regular";
			tf.size = 14;
			tf.color = 0x555555;
			paragraphTextField = new TextField();
			paragraphTextField.width = 560;
			paragraphTextField.autoSize = TextFieldAutoSize.LEFT;
			paragraphTextField.wordWrap = true;
			paragraphTextField.multiline = true;
			paragraphTextField.defaultTextFormat = tf;
			paragraphTextField.antiAliasType = AntiAliasType.ADVANCED;
			paragraphTextField.embedFonts = true;
			paragraphTextField.selectable = true;
			paragraphTextField.htmlText = copyText;
			var myCSS:StyleSheet = new StyleSheet();
            myCSS.setStyle("a:link", {color:"#F920A2", textDecoration:"underline"});
            paragraphTextField.styleSheet = myCSS;
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0xFFFFFF);
			s.graphics.drawRect(0, 0, 600, paragraphTextField.height + 25);
			s.graphics.endFill(); 
			s.addChild(paragraphTextField);
			paragraphTextField.x = 20;
			paragraphTextField.y = 20;

			var my_shadow1:DropShadowFilter = new DropShadowFilter();  
			my_shadow1.color = 0x555555;  
			my_shadow1.blurY = 8;
			my_shadow1.blurX = 8;  
			my_shadow1.angle = 45;  
			my_shadow1.alpha = 0.5;  
			my_shadow1.distance = 10;  
			
			var my_shadow2:DropShadowFilter = new DropShadowFilter();  
			my_shadow2.color = 0x555555;  
			my_shadow2.blurY = 8;
			my_shadow2.blurX = 8;  
			my_shadow2.angle = 245;  
			my_shadow2.alpha = 0.5;  
			my_shadow2.distance = 12; 

			var filtersArray:Array = new Array(my_shadow1, my_shadow2);
			
			s.filters = filtersArray;
			return s;
		}

		private function getContent(i:int):String
		{
			
			var copyTxt:String = "";

			websiteID = websiteXML..portfolio.portfolioItem[i].id.text();
			websiteTitle = websiteXML..portfolio.portfolioItem[i].itemTitle.text();
			myRole = websiteXML..portfolio.portfolioItem[i].myRole.text();
			websiteDescription = websiteXML..portfolio.portfolioItem[i].description.text();
			websiteLink = websiteXML..portfolio.portfolioItem[i].websiteLink.text();
			portfolioType = websiteXML..portfolio.portfolioItem[i].portfolioType.text();
			screenshotName = websiteXML..portfolio.portfolioItem[i].screenshotName.text();
			if (websiteLink != "") {
				copyTxt += '<a href="' + websiteLink + '" target="_blank">' + websiteTitle + "</a><br><br>";
			} else {
				copyTxt += '<u>' + websiteTitle + "</u><br><br>";					
			} 
			copyTxt += websiteDescription + "<br><br>";
			copyTxt += '<i>My Role: ' + myRole + "</i><br><br>";
			
			return copyTxt;
			
		}

		private function loadScreenShot(img:String):void
		{

			loader = new BulkLoader("item");
			loader.add("assets/images/Zimsical.png");
			loader.addEventListener(BulkLoader.PROGRESS, onLoadProgress);
			loader.addEventListener(BulkLoader.COMPLETE, onLoadComplete);
			
			preloader = new Sprite;
			preloader.graphics.lineStyle(0, 0, 0, false);
			preloader.graphics.beginFill(0xF920A2, 1);
			preloader.graphics.drawRect(0, 0, 400, 1);
			preloader.graphics.endFill();
			preloader.scaleX = 0;

			preloaderHolder = new Sprite;
			preloaderHolder.graphics.lineStyle(0, 0, 0, false);
			preloaderHolder.graphics.beginFill(0xFFFFFF, 1);
			preloaderHolder.graphics.drawRect(0, 0, 400, 1);
			preloaderHolder.graphics.endFill();
			preloaderHolder.addChild(preloader);			
			preloaderHolder.x = (stageWidth / 2) - (200);
			preloaderHolder.y = (stageHeight / 2) - (0.5);
			
			loader.start();

		}
		
		private function onLoadProgress(evt:BulkProgressEvent):void
		{
			preloader.scaleX = evt.percentLoaded;
		}

	  	private function onLoadComplete(e:Event):void
	  	{
	  		TweenLite.to(preloaderHolder, 1.0, { alpha:0, ease:Expo.easeInOut, onComplete:displayPortfolioItem } );
	  	}

		private function displayPortfolioItem():void {
			preloader = null;
	  		projectScreenshot = loader.getBitmap("assets/images/Zimsical.png");			
		}
	
	}

}

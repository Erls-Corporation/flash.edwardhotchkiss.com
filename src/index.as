
package
{

  	import br.com.stimuli.loading.BulkLoader;
  	import br.com.stimuli.loading.BulkProgressEvent;
  	import com.asual.SWFAddress.SWFAddress;
  	import com.asual.SWFAddress.SWFAddressEvent;
  	import com.greensock.TweenLite;
  	import com.greensock.easing.Elastic;
  	import com.greensock.easing.Expo;
  	import com.zimsical.audio.spectrumgraph.MP3LoopPlayer;
  	import com.zimsical.ui.browser.contextmenu.CustomContextualMenu;
  	import com.zimsical.ui.components.contentholders.BG;
  	import com.zimsical.ui.components.contentholders.ContactForm;
  	import com.zimsical.ui.components.contentholders.Footer;
  	import com.zimsical.ui.components.contentholders.TopLeftText;
  	import com.zimsical.ui.components.contentholders.TopRightText;
  	import com.zimsical.ui.components.contentholders.ContentOverlay;
  	import com.zimsical.ui.components.menu.Menu;
  	import com.zimsical.ui.components.menu.MenuActions;
  	import com.zimsical.ui.components.menu.MenuEvent;
  	import com.zimsical.ui.components.contentholders.Portfolio;
  	import com.zimsical.ui.components.social.FaceBook;
  	import com.zimsical.ui.components.social.Twitter;
  	import com.zimsical.ui.components.loaders.PreloaderBar;
  	import com.zimsical.ui.components.contentholders.EdwardCanYouMakeMeAWebsite;
  	import flash.display.Bitmap;
  	import flash.display.MovieClip;
  	import flash.display.Sprite;
  	import flash.events.ContextMenuEvent;
  	import flash.events.Event;
  	import flash.events.KeyboardEvent;
  	import flash.net.URLRequest;
  	import flash.net.navigateToURL;

	[SWF(width="900", height="500", frameRate="30", backgroundColor="#FFFFFF")]

	public class index extends Sprite
	{

		private var BGImage:Bitmap;
		private var navMenu:Menu;
	  	private var contentOverlay:ContentOverlay;
	  	private var linkFooter:Footer;
	  	private var currentViewType:String; 
	  	private var currentFontSize:Number;
	  	private var contentVisible:Boolean = false;
	  	private var contactForm:ContactForm = new ContactForm;
	  	private var menuTest:CustomContextualMenu;
	  	private var loader:BulkLoader;
	  	private var SWCFonts:MovieClip;
	  	private var websiteXML:XML;
	  	private var preloaderIndicator:PreloaderBar;
	  	private var portfolio:Portfolio;
	  	private var portfolioOpen:Boolean = false;
	  	private var makeMeWebsite:EdwardCanYouMakeMeAWebsite;

		public function index()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(e:Event):void
		{
			menuTest = new CustomContextualMenu(this);
			navMenu = new Menu();
			navMenu.x = Math.round((stage.stageWidth / 2) - (navMenu.width / 2));
			preloaderIndicator = new PreloaderBar;
			addChild(preloaderIndicator);
			preloaderIndicator.x = (stage.stageWidth / 2) - (preloaderIndicator.width / 2);
		  	preloaderIndicator.y = (stage.stageHeight / 2) - (preloaderIndicator.height / 2);
			loader = new BulkLoader("index");
			loader.add("assets/data/website.xml");
			loader.add("assets/images/Zimsical.png");
			loader.add("assets/fonts/fonts.swf");
			loader.addEventListener(BulkLoader.PROGRESS, onLoadProgress);
			loader.addEventListener(BulkLoader.COMPLETE, onLoadComplete);
			loader.start();
		}

		public function launchPortfolio():void
		{
			portfolio = new Portfolio(stage.stageWidth, stage.stageHeight, websiteXML);
			addChild(portfolio);
		}
		
		private function onLoadProgress(evt:BulkProgressEvent):void
		{
			preloaderIndicator.preloader.scaleX = evt.percentLoaded;
		}

	  	public function onLoadComplete(e:Event):void
	  	{
	  		BGImage = loader.getBitmap("assets/images/Zimsical.png");
	  		SWCFonts = loader.getMovieClip("assets/fonts/fonts.swf");
	  		websiteXML = loader.getXML("assets/data/website.xml");
			var newX:Number = stage.stageWidth + preloaderIndicator.width;
			TweenLite.to(preloaderIndicator, 0.9, { x:newX, ease:Elastic.easeInOut, delay:0.3, onComplete:launchWebsite } );
	  	}

		public function canYouMakeMeAWebsite():void
		{
			makeMeWebsite = new EdwardCanYouMakeMeAWebsite(stage.stageWidth, stage.stageHeight);
			addChild(makeMeWebsite);
		}
		
		public function addressChange(e:SWFAddressEvent):void
		{
			var parsedPageTitle:String = e.value.substring(1);
			var baseName:String = "Edward Hotchkiss - ";

			if (e.value == "/") {
				SWFAddress.setTitle("Edward Hotchkiss - Developer/Designer");
			}

			if (e.value == "/portfolio/")  {
				SWFAddress.setValue("portfolio/");
				SWFAddress.setTitle(baseName + "Portfolio");
				launchPortfolio();

			} else if (e.value == "/edward-hotchkiss/") {
				SWFAddress.setTitle(baseName + "Me");
				currentViewType = "edward";
				onContentOverlayOpen("text");
				
			} else if (e.value == "/contact/") {
				SWFAddress.setTitle(baseName + "Contact Me");
				currentViewType = "contact";
				onContentOverlayOpen("contact");
				
			} else if (e.value == "/projects-and-blog/") {
				SWFAddress.setTitle(baseName + "Projects & Blog");
				currentViewType = "ProjectsAndBlog";
				onContentOverlayOpen("text");
				
			} else if (e.value == "/free/websites/") {
				SWFAddress.setValue("free/websites/");
				SWFAddress.setTitle(baseName + "Can you make me a website?");
				canYouMakeMeAWebsite();
			} 
			
		}

		private function onMenuClick(e:MenuEvent):void
		{
			currentViewType = e.valueObject.type;
		  	if (e.valueObject.isExternal) {
		    	navigateToURL(new URLRequest(e.valueObject.url));
		  	} else {
		    	if (currentViewType == "contact") {
		    		onContentOverlayOpen("contact");
		    	} else if (currentViewType == "portfolio") {
		    		SWFAddress.setValue("portfolio/");
		    	} else {
		    		onContentOverlayOpen("text");
		  		}
		  	}
		}

		public function onContentOverlayClose(e:Event):void
		{
	    	var contentOverlayYFinish:Number = contentOverlay.y = stage.height + contentOverlay.height;
	   		TweenLite.to(contentOverlay, 0.4, { y:contentOverlayYFinish, ease:Expo.easeOut, onComplete:function():void { contentVisible = false } });
	   		SWFAddress.setValue("/");
	  	}

	  	private function onContentOverlayOpen(contentType:String):void
	  	{
	  		if (contentVisible == false) {
	  			contentVisible = true;
	    		contentOverlay = new ContentOverlay(600, 350, 12);
	    		contentOverlay.x = (stage.stageWidth / 2 ) - 300;
	    		contentOverlay.y = stage.height + contentOverlay.height;
	    		var contentYFinish:Number = (stage.stageHeight / 2) - 140;
	    		addChild(contentOverlay);
	    		if (contentType == "text") {
	    			MenuActions.getContent(currentViewType, currentFontSize, contentOverlay.setContent);
	    		} else if (contentType == "contact") {
	    			SWFAddress.setValue("contact/");
	    			contentOverlay.addChild(contactForm);
	    			contactForm.x = 15;
	    			contactForm.y = 15;
	    		}
	   			TweenLite.to(contentOverlay, 0.2, {y:contentYFinish, blurFilter:{blurX:10, blurY:10, remove:true}, ease:Expo.easeOut });
	  		}
	  	}

		public function detectKey(event:KeyboardEvent):void
		{
   			if (event.keyCode == 27) {
   				onContentOverlayClose(event);
   			}
		}
		
	  	public function launchWebsite():void
	  	{
			
			var myBG:BG = new BG(stage.stageWidth, stage.stageHeight, 0x989896, 0xF5F7F6);
			myBG.y = stage.stageHeight;
	  		addChild(myBG);
            TweenLite.to(myBG, 0.4, {y:0, ease:Expo.easeOut });

	    	addChild(BGImage);
      		BGImage.smoothing = true;
			BGImage.x = (stage.stageWidth / 2) - (BGImage.width / 2);
			BGImage.y = stage.stageHeight;
            TweenLite.to(BGImage, 0.7, {y:stage.stageHeight - BGImage.height - 60, ease:Expo.easeOut, overwrite:0 });

	    	navMenu.y = stage.stageHeight;
			addChild(navMenu);
            TweenLite.to(navMenu, 0.8, {y:stage.stageHeight - 180, ease:Expo.easeOut });
			
	    	linkFooter = new Footer();
	    	addChild(linkFooter);

			var myTopLeftText:TopLeftText = new TopLeftText;
			myTopLeftText.y = stage.stageHeight;
			addChild(myTopLeftText);
            TweenLite.to(myTopLeftText, 1.0, {y:-10, ease:Expo.easeOut});
            
            var myTopRightText:TopRightText = new TopRightText;
            myTopRightText.y = stage.stageHeight;
            myTopRightText.x = stage.width - (myTopRightText.width) - 40;
            addChild(myTopRightText);
            TweenLite.to(myTopRightText, 1.0, {y:-10, ease:Expo.easeOut});

	  		var lemonSpectrumGraph:MP3LoopPlayer = new MP3LoopPlayer(stage.stageWidth, stage.stageHeight);
            addChild(lemonSpectrumGraph);
			
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, addressChange);
			addEventListener(MenuEvent.TYPE_CLICK, onMenuClick);			
		  	addEventListener(Event.CLOSE, onContentOverlayClose);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, detectKey);
			
	  		var twitter:Twitter = new Twitter(stage.stageWidth, stage.stageHeight);
			addChild(twitter);

	  		var faceBook:FaceBook = new FaceBook(stage.stageWidth, stage.stageHeight);
			addChild(faceBook);

	  	}
	  	
	}
}

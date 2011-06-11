
package com.zimsical.ui.browser
{
	public class EnumerateFonts
	{
  		
  		public function ListFonts():void
  		
  		{
  			
			var fonts:Array = Font.enumerateFonts();
			trace(fonts.length + " Fonts");
			var font:Font;
			for (var i:int; i<fonts.length;i++) {
    			font = fonts[i];
    			trace("name : " + font.fontName);
    			trace("style : " + font.fontStyle);
    			trace("type : " + font.fontType);
  			}
  			
		}

	}
	
}
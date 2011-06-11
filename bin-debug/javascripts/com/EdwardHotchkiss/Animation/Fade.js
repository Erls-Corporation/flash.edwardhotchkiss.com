
/*

	Fade.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.Fade = function (options) {

    	if (this.length == 0) { 
        	return false; 
    	};

    	var settings = {
    		isVisible : false,
			Seconds : 2,
			Start : null,
			Stop : null,
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

   	 	var element = $(this);

		function IsVisible(obj) {
			if ($(obj).css("display") == "none") {
				vis = false;
			} else {
				vis = true;
			}
			return vis;
		}

		function Fader(id, OpacityStart, OpacityEnd, Seconds) {
			Milliseconds = Seconds * 1000;
			var speed = Math.round(Millisecond / 100);
			var timer = 0;
			if (OpacityStart > OpacityEnd) {
				for (i = OpacityStart; i >= OpacityEnd; i--) {
					setTimeout("ChangeOpacity('" + id + "'," + i + ")", (timer * speed));
					timer++;
				}
			} else if (OpacityStart < OpacityEnd) {
				for (i = OpacityStart; i <= OpacityEnd; i++) {
					setTimeout("ChangeOpacity('" + id + "'," + i + ")", (timer * speed));
					timer++;
				}
			}
		}

		if (IsVisible($(element)) == "false") {
			ChangeOpacity($(element), 0);
			$(element).css("display", "block");
		}

	};

}) (jQuery);

/*
$(document).ready(function(){
	$(document).Fade	({
			Start : 100,
			Stop: 1,
			Seconds : 5
		}
	);
})
*/

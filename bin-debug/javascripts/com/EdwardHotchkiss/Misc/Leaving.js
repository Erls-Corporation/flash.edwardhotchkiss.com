
/*

	Leaving.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.Leaving = function (options) {

    	if (options.length == 0) { 
        	return false; 
    	};

    	var settings = {
			Message : null,
			LeavingPromptCheckFunc : function() {}
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

		function Leaving() {
			if (settings.LeavingPromptCheckFunc) {
				return settings.Message;
			}
		}

		window.onbeforeunload = Leaving;

	}
	
}) (jQuery);
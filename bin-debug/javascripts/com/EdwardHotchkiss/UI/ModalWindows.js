
/*

	ModalWindows.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.ModalWindow = function (options) {

		// Extendable Settings
    	var settings = {
        	Type : null,
        	ShowStatus : true,
        	OverlayHTML : '<div id="Overlay"></div>',
        	HTML : '<div id="ModalWindow"><p>Modal Window <a href="#" id="modalCloser">[X]</a></p>',
        	CallbackHandler : function() {},
        	URL : null,
        	InitHandler : function () { OpenModalWindow(); }
    	};

		// Allow Plugin Extension
    	if (options) {
        	jQuery.extend(settings, options);
   	 	};
 
 		// Close Modal Window Event Delegation
		$(document).click(function(e) {
    		if ($(e.target).is('a')) {
				CloseModalWindow.call(e.target, e);
			}
 		});

		// Close the indicator
		function CloseModalWindow() {
			$("#ModalWindow").fadeOut("fast");
			$("#Overlay").fadeOut("slow");
			$("#Overlay").remove();
			$("#ModalWindow").remove();
		}
		
		// Create a semi transparent Overlay div
   	 	function OpenModalWindow() {
			$("body").append(settings.HTML);
			$("body").append(settings.OverlayHTML);
   	 		$("#Overlay").css("height", $(document).height());
   	 		$("#Overlay").fadeTo("slow", 0.45);
			$("#ModalWindow").fadeIn("slow");
   	 	};
		
		// Success Message
		function Message(msg) {
			$("#status").html(msg);
		}
		
		// Initialize
		settings.InitHandler();
		
	};

}) (jQuery);


/*

	AJAX.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.AJAX = function (options) {

		// Zero Arguments, Return
    	if (this.length == 0) { 
        	return false; 
    	};

		// Extendable Settings
    	var settings = {
    		// Default is GET
    		Form : null,
    		// Milliseconds
    		MiniumStatusTime : 2000,
    		Complete: 0,	
    		aSync : 1,
    		AJAXType : "POST",
			File : null,
			DataType : "xml",
			Serialize : true,
			// Funtion Handlers
			SuccessHandler : function (data) { },
        	CompleteHandler : function (data) { },
        	ErrorHandler : function (data) { Errror(); },
        	InitHandler : function () { },
        	DuringHandler : function () { },
        	Type : null,
        	ShowStatus : true,
        	LoadFile : null,
        	LoadFileDiv : null,
        	OverlayHTML : '<div id="overlay"></div>',
        	IndicatorHTML : '<div id="indicator"><p id="status">Loading...</p></div>'
    	};

		// Allow Plugin Extension
    	if (options) {
        	jQuery.extend(settings, options);
   	 	};
   	 	
   	 	// Execute onBefore Handler
   	 	settings.InitHandler();
		
		// Generic Lack-of-Detail Error Handler
		function Error() {
			alert("There was an unknown AJAX Error!");
		}
		
		// Create a semi transparent overlay div
   	 	function OpenOverlay() {
   	 		$("body").append(settings.OverlayHTML);
   	 		$("#overlay").css("height", $(document).height());
   	 		$("#overlay").fadeTo("dlow", 0.45);
   	 	};

		// Fadein the indicator
		function OpenIndicator() {
			$("body").append(settings.IndicatorHTML);
			$("#indicator").fadeIn("slow");
		}

		// Close the indicator
		function CloseIndicator() {
			$("#indicator").fadeOut("slow");
		};

		// Close the indicator
		function CloseOverlay() {
			$("#indicator").fadeOut("slow");
		};
		
		// Error Message
		function Error() {
		};
		
		// Generic Error Message
		function GenericError() {
			alert("A file is currently unavailable, please try again....");
		};
		
		// Success Message
		function Message(msg) {
			$("#status").html(msg);
		}
		
		// Open the Overlay
		OpenOverlay();
		
		// Open the Indicator
		OpenIndicator();
		
		// Start
		function Begin() {
			setInterval ( "CheckAJAXStatus()", 1000 );
		}
		
		// Check AJAX Status
		function CheckAJAXStatus() {
		}
		
		// Clear Intervel
		function StatusChecker() {
			clearInterval();
		}
		
		// AJAX Calls
		function MosoniAJAX() {
			$.ajax({
				type : settings.AJAXType,
				url : settings.File,
				dataType : settings.Type,
				success : function(data) {
					settings.SuccessHandler(data);
				},
				complete : function(data) {
					settings.CallbackHandler();
				},
				error : function(data) {
					settings.ErrorHandler();
				}
			});
		}
		
		// Do not submit form
		return false;
	};

}) (jQuery);

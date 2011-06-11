
/*

	EditInPlace.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.EditInPlace = function (options) {
	
    	if (this.length == 0) { 
        	return false; 
    	};

		var beingEdited = 0;

		var inputElement = null;

    	var settings = {
       		MinWidth        : 60,
    		MaxWidth        : 120,
        	URL             : null,
        	Name            : null,
        	ID              : null,
        	Changed         : null,
        	type            : 'input',
        	needURL         : 0,
        	oldHTML         : null,
        	event           : "click",
        	CallbackHandler : function () { return true; },
        	OnBeforeHandler : function() { return true; },
        	OnAutoSize      : function () { return true; },
        	OnInputShow     : function () { return true; },
        	AutoResize      : 1,
        	InputStyle      : "#tmpEdit { min-width: 120px; }"
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

		var element = $(this);

		element.unbind();
		
		element.type = "button";

        unedited = element.html();

		element.dblclick(function(el) {
			val = element.html();
			if (beingEdited == 0) {
				element.html('<input id="tmpEdit" type="text" value="' + val + '" />');
			}
			inputElement = element.find("input");
			inputElement.focus();
			inputElement.select();
			inputElement.css("min-width", settings.MinWidth);
			settings.OnInputShow();
			$(element).blur(function() {
				enterFunc();
			})
			$(inputElement).blur(function() {
				enterFunc();
			})
			$("#container").click(function() {
				enterFunc();
			})
			$("#pageTabs").click(function() {
			enterFun();
			})
			$("#insertZone").click(function() {
				enterFunc();
			})
			$("#blankslate").click(function() {
				enterFunc();
			})
			$("#container").blur(function() {
				enterFunc();
			})
			$("#insertZone").blur(function() {
				enterFunc();
			})
		})

		$(this).find("form").submit(function(){
			return false;
		});

		function isDefined(variable) {
			return (typeof(window[variable]) == "undefined") ?  false: true;
		}

		element.keyup(function(event) {
            var keycode = event.which;
            if (keycode == 27) {
				cancel();
            }
            if (keycode == 13) {
				enterFunc();
			} else {
				return true;
			}
		});
		
		function debug(event, element) {
			var keycode = event.which;
			var elementName = $(element).attr("id");
		}

		function enterFunc() {
			element.css("border", "none");
			newVal = $("#tmpEdit").val();
			if (newVal == "" || newVal == " ") {
				newVal = "Label:";
			}
			element.find("input").remove();
			element.html(newVal);
			settings.CallbackHandler();
		}

		function cancel() {
			element.css("border", "none");
			newVal = $("#tmpEdit").val();
			element.find("input").remove();
			element.html(unedited);
		}
		
	}

}) (jQuery);

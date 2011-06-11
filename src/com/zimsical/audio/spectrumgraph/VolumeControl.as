
package com.zimsical.audio.spectrumgraph {

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	public class VolumeControl extends Sprite {

    	public var volume:Number = 1.0;

    	public function VolumeControl() {
        	addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(KeyboardEvent.KEY_DOWN, VolumeDown);
			addEventListener(KeyboardEvent.KEY_UP, VolumeUp);
    	}
    	
		public function VolumeDown(evt:Event):void
		{
		}
		
		public function VolumeUp(evt:Event):void
		{	
		}

    	public function onClick(event:MouseEvent):void {
        	volume = event.localX / 100;
        	dispatchEvent(new Event(Event.CHANGE));
    	}
    	
	}
}
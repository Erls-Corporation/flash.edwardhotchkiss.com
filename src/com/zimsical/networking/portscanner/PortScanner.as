
package com.zimsical.networking.portscanner {

	import flash.net.Socket;

	public class PortScanner {
  
		private var socket:Socket;
  
		public function PortScanner(host:String, pStart:uint, pFinish:uint, pExclude:Array):void
		{
			for (var pN:Number = pStart; pN < pFinish; pN++) {
      			socket = new Socket();
      			socket.addEventListener(Event.CONNECT, onOpen(pN));
      			socket.connect(host, pN);
   			}
    	}
    
    	private function onOpen(event:Event, pN:uint):void {
      		trace("PORT # " + pN " OPEN");  
    	}
 
	}

}
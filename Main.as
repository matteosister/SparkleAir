package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip
	{
		private var numeroStelle:int = 4;
		
		
		public function Main()
		{
			loadObjects();
			addListeners();
		}
		
		private function loadObjects():void {
			
		}
		
		private function addListeners():void {
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		}
		
		private function mouseMove(evt:MouseEvent):void {
			for (var i:int = 1; i <= numeroStelle; i++) {
				var sp:Sparkle = new Sparkle();
				sp.x = this.mouseX;
				sp.y = this.mouseY;
				sp.rotation = getRandomRotation();
				sp.addEventListener(Event.ENTER_FRAME, onSparkleFrame);
				addChild(sp);	
			}
		}
		
		private function onSparkleFrame(evt:Event):void {
			var sparkle:Sparkle = evt.target as Sparkle;
			if (sparkle.currentFrame == sparkle.totalFrames) {
				sparkle.removeEventListener(Event.ENTER_FRAME, onSparkleFrame);
				removeChild(sparkle);
			}
		}
		
		private function getRandomRotation():int
		{
			return Math.round(Math.random() * 360);
		}
	}
}
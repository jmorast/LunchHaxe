package;

import nme.Assets;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.Lib;
import nme.ui.Keyboard;
import org.flixel.FlxGame;
import org.flixel.FlxState;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.system.FlxPreloader;
import LunchMode;

/**
 * ...
 * @author jhowell,jmorast
 */
class LunchHaxe extends Sprite {
	
	var lunchgame:LunchMode = null;
	
	public function new () {
		
		super ();
		
		if (stage != null) 
			init();
		else 
			addEventListener(Event.ADDED_TO_STAGE, init);
		
	}
	
	private function init(?e:Event = null):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		
		lunchgame = new LunchMode();
		lunchgame.useSystemCursor=true;
		addChild(lunchgame);
        
		#if (cpp || neko || flash)
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUP);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN , onKeyDOWN);
		//trace("key listener set");
		#end
	}
	
	#if (cpp || neko || flash)
	private function onKeyUP(e:KeyboardEvent):Void 
	{
		//trace("key up = "+e.keyCode);
		if (e.keyCode == Keyboard.LEFT) {
			lunchgame.setLeft(false);
		} else if (e.keyCode == Keyboard.RIGHT) {
			lunchgame.setRight(false);
		}
		
	}
	
	public function onKeyDOWN(e:KeyboardEvent):Void 
	{
		//trace("key down = "+e.keyCode);
		if (e.keyCode == Keyboard.LEFT) {
			lunchgame.setLeft(true);
		} else if (e.keyCode == Keyboard.RIGHT) {
			lunchgame.setRight(true);
		}
		
	}
	#end
	
	public static function main() {			
		Lib.current.addChild(new LunchHaxe());
	}

}

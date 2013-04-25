package;

import nme.Lib;
import org.flixel.FlxGame;
	
class LunchMode extends FlxGame
{
	private var left:Bool;
	private var right:Bool;
	
	public function setLeft(state:Bool) {
		//if (!this.left && state) trace("LEFT");
		this.left = state;	
	}
	
	public function setRight(state:Bool) {
		//if (!this.right && state) trace("RIGHT");
		this.right = state;
	}
	
	public function getLeft():Bool {
		return this.left;
	}
	
	public function getRight():Bool {
		return this.right;
	}
	
	public function new()
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		super(stageWidth, stageHeight, LunchHaxeState, 1);

		forceDebugger = true;
		
		
	}
}
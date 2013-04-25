package;


import org.flixel.FlxState;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxText;
import nme.Lib;


/**
 * ...
 * @author jhowell
 */
class LunchHaxeState extends FlxState {
	
	private var timer:Int = 0;
	private var bgSpaceTop:FlxSprite;
	private var bgSpaceBottom:FlxSprite;
	private var bgDebrisTop:FlxSprite;
	private var bgDebrisBottom:FlxSprite;
	private var fpsCounter:FlxText;
	private var times:Array<Float>;
	
	public function new () {	
		super();	
	}		
	
	override public function create():Void {
		
		// create a colored sprite
		// var bgGround:FlxSprite = new FlxSprite(0,0);
        // create a colored sprite bgGround.makeGraphic(FlxG.width,FlxG.height, 0xff117F20);
        // add(bgGround);


        bgSpaceTop = new FlxSprite(1,1,"assets/bg-space.png");
 		bgSpaceTop.y = 0 - bgSpaceTop.height;
        add(bgSpaceTop);     
        bgSpaceBottom = new FlxSprite(1,1,"assets/bg-space.png");
        add(bgSpaceBottom);

        bgDebrisTop = new FlxSprite(1,1,"assets/bg-debris.png");
        bgDebrisTop.y = 0 - bgDebrisTop.height;
        add(bgDebrisTop);

        bgDebrisBottom = new FlxSprite(1,1,"assets/bg-debris.png");
        add(bgDebrisBottom);
        
        fpsCounter = new FlxText(5, 5, FlxG.width, "FPS: " + 30);
        fpsCounter.setFormat(null, 10, 0xff0000, "left");
		add(fpsCounter);
		
		times = [];
        
	}
	
	override public function update():Void 
	{
		super.update();
		timer++;
		if (timer > (5)) {
			timer = 0;
			moveBackground();
		}
		
		// fps counter
		var t = Lib.getTimer(); // mSec
		var now:Float = t / 1000;
		times.push(now);
		// if the first element of the array is more than a second ago
		while(times[0] < now - 1)
		{
			// remove first element of the array
			times.shift();
		}
		// now number of elements in the array is the number of updates in 1 second
		fpsCounter.text = FlxG.width + "x" + FlxG.height + "\nFPS: " + times.length + "/" + Lib.current.stage.frameRate;
		


	}

	private function moveBackground():Void {
		var tempy:Int = Math.ceil(bgSpaceBottom.y);
		if (tempy > FlxG.height) {
			bgSpaceBottom.y = 1;
			bgSpaceTop.y = 0 - bgSpaceTop.height;	
		} else {
			bgSpaceTop.y += .15 ;
			bgSpaceBottom.y += .15;
		}
		tempy =  Math.ceil(bgDebrisBottom.y);
		if (tempy > FlxG.height) {
			bgDebrisBottom.y = 1;
			bgDebrisTop.y = 0 - bgDebrisTop.height;	
		} else {
			bgDebrisTop.y += 1.5 ;
			bgDebrisBottom.y += 1.5;
		}
	}

}

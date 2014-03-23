import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{
	private var state:Bool
	soundState = true;

	override public function init()
	{
#if debug
		HXP.console.enable();
		HXP.scene = new scenes.GameScene();
#else
		HXP.scene = new scenes.MainMenu();
#end
	}



	public static function mute(){
		if (state){
			state = false;
		}
		else{
			state = true;
		}
	}
	public static function main() { new Main(); }

}
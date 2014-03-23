import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
		HXP.scene = new scenes.GameScene();
#else
		HXP.scene = new scenes.MainMenu();
#end
	}

	public static function main() { new Main(); }

}
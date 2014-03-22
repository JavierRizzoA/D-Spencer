package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;

class GameScene extends Scene {
	public var sentryGun:entities.SentryGun;

	public override function begin() {
		sentryGun = new entities.SentryGun(HXP.halfWidth, HXP.halfHeight);

		add(sentryGun);
		add(new entities.Person(800, 600));
		add(new entities.Person(0, 0));
		add(new entities.Person(0, 600));
		add(new entities.Person(800, 0));
	}
}
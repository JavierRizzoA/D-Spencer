package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;

class GameScene extends Scene {
	public var sentryGun:entities.SentryGun;
	public var sentryBase:Image;

	public override function begin() {
		sentryBase = new Image("graphics/entities/sentry.png");
		sentryBase.centerOrigin();
		sentryBase.layer = 100;
		addGraphic(sentryBase, 0, HXP.halfWidth, HXP.halfHeight);

		sentryGun = new entities.SentryGun(HXP.halfWidth, HXP.halfHeight);

		add(sentryGun);
		add(new entities.PeopleGenerator(0, 0));
	}
}
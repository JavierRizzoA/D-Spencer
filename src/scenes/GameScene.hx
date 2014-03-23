package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;

class GameScene extends Scene {
	public var sentryGun:entities.SentryGun;
	public var sentryBase:Image;
	public var background:Image;
	public var outline:Image;
	public var circle:Image;
	public var display:entities.FoodDisplay;

	public override function begin() {
		sentryBase = new Image("graphics/entities/sentry.png");
		background = new Image("graphics/backgrounds/gamebg.png");
		outline = Image.createCircle(40, 0x000000);
		circle = Image.createCircle(35, 0xFFFFFF);

		outline.centerOrigin();
		circle.centerOrigin();
		sentryBase.centerOrigin();
		sentryBase.layer = 50;
		background.layer = 100;
		outline.layer = 50;
		circle.layer = 51;
		addGraphic(outline, (HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		addGraphic(circle, (HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		addGraphic(sentryBase, 0, HXP.halfWidth, HXP.halfHeight);
		addGraphic(background);
		sentryGun = new entities.SentryGun(HXP.halfWidth, HXP.halfHeight);
		display = new entities.FoodDisplay((HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		display.layer = 0;
		add(sentryGun);
		add(new entities.PeopleGenerator(0, 0));
		add(display);
	}
}
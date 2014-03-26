package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.Sfx;

class GameScene extends Scene {
	public var sentryGun:entities.SentryGun;
	public var sentryBase:Image;
	public var background:Image;
	public var outline:Image;
	public var circle:Image;
	public var display:entities.FoodDisplay;
	private var lives:Array<entities.Star>;
	private var prestige:Image;
	private var score:Text;
	public var bgmusic:Sfx;

	public override function begin() {
		sentryBase = new Image("graphics/entities/sentry.png");
		background = new Image("graphics/backgrounds/gamebg.png");
		outline = Image.createCircle(40, 0x000000);
		circle = Image.createCircle(35, 0xFFFFFF);
		prestige = new Image("graphics/gui/prestige.png");
		score = new Text("0", 250, 0, 0, 0, {color: 0x000000, size: 50});
		bgmusic = new Sfx("audio/gameplaybg.mp3");

		outline.centerOrigin();
		circle.centerOrigin();
		sentryBase.centerOrigin();
		//sentryBase.layer = 50;
		//background.layer = 100;
		//outline.layer = 50;
		//circle.layer = 51;
		//prestige.layer = 52;
		addGraphic(outline, 50, (HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		addGraphic(circle, 51, (HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		addGraphic(prestige, 52, 200, 0);
		addGraphic(sentryBase, 49, HXP.halfWidth, HXP.halfHeight);
		addGraphic(background, 100);
		sentryGun = new entities.SentryGun(HXP.halfWidth, HXP.halfHeight);
		display = new entities.FoodDisplay((HXP.halfWidth - 23) * 2, (HXP.halfHeight - 23) * 2);
		display.layer = 0;
		add(sentryGun);
		add(new entities.PeopleGenerator(0, 0));
		add(display);
		addGraphic(score);
		add(new entities.MuteButton(750, 0));
		lives = new Array();
		for(i in 0 ... 3) {
			lives[i] = new entities.Star(i * 50, 0);
			add(lives[i]);
		}
		bgmusic.loop();
	}

	private function manageLives() {
		switch (sentryGun.lives) {
			case 0:
				lives[0].visible = false;
				lives[1].visible = false;
				lives[2].visible = false;
			case 1:
				lives[0].visible = true;
				lives[1].visible = false;
				lives[2].visible = false;
			case 2:
				lives[0].visible = true;
				lives[1].visible = true;
				lives[2].visible = false;
			case 3:
				lives[0].visible = true;
				lives[1].visible = true;
				lives[2].visible = true;
		}
	}

	private function displayScore() {
		score.text = sentryGun.score + ""; 
	}

	public override function update() {
		manageLives();
		displayScore();
		super.update();
	}
}
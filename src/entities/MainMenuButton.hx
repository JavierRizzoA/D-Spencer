package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

class MainMenuButton extends Entity {

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		image = new Image("graphics/gui/main_menu.png");
		image.centerOrigin();
		graphic = image;
		setHitbox(475, 60, 237, 30);

	}

	private function handleInput() {
		if(collidePoint(x, y, Input.mouseX, Input.mouseY)) {
			if(Input.mousePressed) {
				new com.haxepunk.Sfx("audio/click.mp3").play();
				HXP.scene = new scenes.MainMenu();
			}
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}
}
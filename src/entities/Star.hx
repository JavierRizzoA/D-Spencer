package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Star extends Entity {

	public function new(x:Float, y:Float) {
		super(x, y);
		graphic = new Image("graphics/gui/star.png");
		layer = 9;

	}

	public override function update() {

		super.update();
	}
}

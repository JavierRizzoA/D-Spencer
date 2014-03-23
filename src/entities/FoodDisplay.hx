package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class FoodDisplay extends Entity {
	public function new(x:Float, y:Float) {
		super(x, y);

	}

	public function displayFood(food:Int) {
		var image:Image;
		image = new Image("graphics/entities/food/taco_big.png");
		switch(food) {
			case 0:
				image = new Image("graphics/entities/food/taco_big.png");
			case 1:
				image = new Image("graphics/entities/food/pizza_big.png");
			case 2:
				image = new Image("graphics/entities/food/china_big.png");
			case 3:
				image = new Image("graphics/entities/food/pretzel_big.png");
		}
		image.centerOrigin();
		graphic = image;
	}


	public override function update() {

		super.update();
	}
}
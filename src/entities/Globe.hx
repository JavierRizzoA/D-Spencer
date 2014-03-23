package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Globe extends Entity {
	
	private var image:Image;

	public function new(x:Float, y:Float, food:Int) {
		super(x, y);
		switch(food) {
			case 0:
				image = new Image("graphics/entities/globes/globe_taco.png");
			case 1:
				image = new Image("graphics/entities/globes/globe_pizza.png");
			case 2:
				image = new Image("graphics/entities/globes/globe_china.png");
			case 3:
				image = new Image("graphics/entities/globes/globe_pretzel.png");
		}
		graphic = image;

	}

	public override function update() {

		super.update();
	}

}
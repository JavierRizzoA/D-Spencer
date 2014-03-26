package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class FoodProjectile extends Entity {
	private var angle:Float;
	private var image:Image;
	public var food:Int;
	public var classic:Bool;
	public function new(x:Float, y:Float, a:Float, food:Int) {
		super(x, y);
		angle = a;
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
		try {
			//image.layer = 20;
		}
		graphic = image;
		type = "projectile";
		setHitbox(32, 32, 16, 16);
		image.angle = Std.random(361);
		this.food = food;
		classic = false;
	}

	public function destroy() {
		HXP.scene.remove(this);
	}

	public function checkBounds() {
		if(x + width < 0) {
			destroy();
		} else if(x - width > HXP.width) {
			destroy();
		} else if(y + height < 0) {
			destroy();
		} else if(y - height > HXP.height) {
			destroy();
		}
	}

	public override function update() {
		moveAtAngle(angle, 5);
		image.angle += 5;
		if(classic) {
			image = Image.createRect(32, 32, 0xFFFFFF);
		}
		checkBounds();
		super.update();
	}
}
package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;

class SentryGun extends Entity {

	public static var h:Int = 128;
	public static var w:Int = 128;

	private var image:Image;
	private var angle:Float;
	private var currentFood:Int;
	private var shoot:Sfx;
	private var changeFood:Sfx;

	public var classic:Bool;
	public var score:Int;
	public var lives:Int;

	public function new(x:Float, y:Float) {
		super(x, y);
		setHitbox(w, h, 64, 64);
		image = new Image("graphics/entities/gun.png");
		graphic = image;
		image.centerOrigin();
		type = "sentry";
		layer = 0;
		currentFood = 0;
		shoot = new Sfx("audio/shoot.mp3");
		changeFood = new Sfx("audio/change_food.mp3");
		classic = false;
		score = 0;
		lives = 3;
	}

	private function handleInput() {
		if(Input.mousePressed) {
			createFood();
			shoot.play();
		}
		if(Input.rightMousePressed) {
			changeFood.play();
			currentFood++;
			currentFood %= 4;
		}
		cast(HXP.scene, scenes.GameScene).display.displayFood(currentFood);
	}

	private function createFood() {
		HXP.scene.add(new FoodProjectile(x, y, angle, currentFood));
	}

	private function rotate() {
		if(classic) {
			image = new Image("graphics/entities/sentry_gun.png");
		}
		if(Input.mouseX >= this.x) {
			angle = Math.asin((this.y - Input.mouseY)/Math.sqrt((Math.pow(this.y - Input.mouseY,2))+(Math.pow(this.x - Input.mouseX,2)))) * 57.2957795;
		}
		else	{
			angle = -Math.asin((this.y - Input.mouseY)/Math.sqrt((Math.pow(this.y - Input.mouseY,2))+(Math.pow(this.x - Input.mouseX,2)))) * 57.2957795 + 180;
		}
		image.angle = angle;
	}

	private function checkCollision() {
		var e:Entity = null;
		e = collide("person", x, y);
		if(e != null) {
			lives--;
		}
	}

	public override function update() {
		handleInput();
		rotate();
		checkCollision();
		super.update();
	}

}
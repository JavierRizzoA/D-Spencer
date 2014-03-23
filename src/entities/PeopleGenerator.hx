package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;

class PeopleGenerator extends Entity {

	public function new(x:Float, y:Float) {
		super(x, y);

	}

	private function generatePeople() {
		var posX:Int = 0;
		var posY:Int = 0;
		switch(Std.random(4)) {
			case 0:
				posX = Std.random(HXP.width);
				posY = -64;
				HXP.scene.add(new Person(posX, posY));
			case 1:
				posX = HXP.width + 32;
				posY = Std.random(HXP.height);
				HXP.scene.add(new Person(posX, posY));
			case 2:
				posX = Std.random(HXP.height);
				posY = HXP.height + 64;
				HXP.scene.add(new Person(posX, posY));
			case 3:
				posX = -32;
				posY = Std.random(HXP.height);
				HXP.scene.add(new Person(posX, posY));
		}
	}

	public override function update() {
		super.update();
		if(Std.random(250) == 0) {
			generatePeople();
		}
	}

}
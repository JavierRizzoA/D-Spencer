package scenes;

import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;

class InstructionsScene extends Scene {
	public override function begin() {
		addGraphic(new Image("graphics/backgrounds/instructionsbg.png"));
		add(new entities.PlayButton(540, 400));
	}
}
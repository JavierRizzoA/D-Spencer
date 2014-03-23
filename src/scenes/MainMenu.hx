package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;

class MainMenu extends Scene {
	public var startButton:entities.StartButton;
	private var background:Image;

	public override function begin() {
		background = new Image("graphics/backgrounds/mainmenubg.png");
		addGraphic(background);

		add(new entities.StartButton(510, 210));
		add(new entities.CreditsButton(510, 310));
	}


}
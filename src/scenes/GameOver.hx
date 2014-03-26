package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

class GameOver extends Scene {

	private var score:Image;

	public function new(score:Int) {
		super();
		this.score = new Text(score + "", 250, 230, 0, 0, {color: 0x000000, size: 50});

	}

	public override function begin() {
		addGraphic(new Image("graphics/backgrounds/gameoverbg.png"));
		add(new entities.PlayAgainButton(400, 350));
		add(new entities.MainMenuButton(400, 410));
		addGraphic(score);

	}
}
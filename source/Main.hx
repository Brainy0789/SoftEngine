package;

import flixel.FlxGame;
import openfl.display.Sprite;
import soft.backend.EntryState;

import flixel.util.FlxTimer;
class Main extends Sprite
{
	public function new()
	{
		Paths.CUR_GAME = 'test';
		super();
		addChild(new FlxGame(0, 0, EntryState, 60, 60, false));
	}
}

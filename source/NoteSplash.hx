package;

import flixel.FlxG;
import flixel.FlxSprite;

class NoteSplash extends FlxSprite
{	
	public function new(x:Float = 0, y:Float = 0, ?note:Int = 0) {
		super(x, y);
	
		switch(PlayState.SONG.noteStyle)
		{
		case'BenNotes':
		frames = Paths.getSparrowAtlas('NoteSplashes/Benjamin_NOTE_Splashes', 'shared');
		animation.addByPrefix("note1-0", "note splash sparkle blue", 24, false);
		animation.addByPrefix("note2-0", "note splash sparkle green", 24, false);
		animation.addByPrefix("note0-0", "note splash sparkle purple", 24, false);
		animation.addByPrefix("note3-0", "note splash sparkle red", 24, false);

		animation.addByPrefix("note1-1", "note splash sparkle blue", 24, false);
		animation.addByPrefix("note2-1", "note splash sparkle green", 24, false);
		animation.addByPrefix("note0-1", "note splash sparkle purple", 24, false);
		animation.addByPrefix("note3-1", "note splash sparkle red", 24, false);
		setupNoteSplash(x, y, note);
	    
		case 'Taki':
		frames = Paths.getSparrowAtlas('NoteSplashes/noteSplashes-fever', 'shared');
		animation.addByPrefix("note1-0", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-0", "note impact 1 green", 24, false);
		animation.addByPrefix("note0-0", "note impact 1 purple", 24, false);
		animation.addByPrefix("note3-0", "note impact 1 red", 24, false);

		animation.addByPrefix("note1-1", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-1", "note impact 2 green", 24, false);
		animation.addByPrefix("note0-1", "note impact 2 purple", 24, false);
		animation.addByPrefix("note3-1", "note impact 2 red", 24, false);
		setupNoteSplash(x, y, note);

		case 'FunNotes':
		frames = Paths.getSparrowAtlas('NoteSplashes/noteSplashes-FunNotes', 'shared');
		animation.addByPrefix("note1-0", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-0", "note impact 1 green", 24, false);
		animation.addByPrefix("note0-0", "note impact 1 purple", 24, false);
		animation.addByPrefix("note3-0", "note impact 1 red", 24, false);

		animation.addByPrefix("note1-1", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-1", "note impact 2 green", 24, false);
		animation.addByPrefix("note0-1", "note impact 2 purple", 24, false);
		animation.addByPrefix("note3-1", "note impact 2 red", 24, false);
		setupNoteSplash(x, y, note);

		case 'Hololive':
			frames = Paths.getSparrowAtlas('NoteSplashes/noteSplashes-Hololive', 'shared');
			animation.addByPrefix("note1-0", "note impact 2 blue", 24, false);
			animation.addByPrefix("note2-0", "note impact 1 green", 24, false);
			animation.addByPrefix("note0-0", "note impact 1 purple", 24, false);
			animation.addByPrefix("note3-0", "note impact 1 red", 24, false);
	
			animation.addByPrefix("note1-1", "note impact 2 blue", 24, false);
			animation.addByPrefix("note2-1", "note impact 2 green", 24, false);
			animation.addByPrefix("note0-1", "note impact 2 purple", 24, false);
			animation.addByPrefix("note3-1", "note impact 2 red", 24, false);
			setupNoteSplash(x, y, note);

		case 'Entity'|'Doki'|'Tabi'|'Masses'|'Pico'|'Kapi'|'Retro'|'Ace'|'ElicrackNotes':
		frames = Paths.getSparrowAtlas('noteSplashes', 'shared');
		animation.addByPrefix("note1-0", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-0", "note impact 1 green", 24, false);
		animation.addByPrefix("note0-0", "note impact 1 purple", 24, false);
		animation.addByPrefix("note3-0", "note impact 1 red", 24, false);

		animation.addByPrefix("note1-1", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-1", "note impact 2 green", 24, false);
		animation.addByPrefix("note0-1", "note impact 2 purple", 24, false);
		animation.addByPrefix("note3-1", "note impact 2 red", 24, false);
		setupNoteSplash(x, y, note);

		default:
		frames = Paths.getSparrowAtlas('noteSplashes', 'shared');
		animation.addByPrefix("note1-0", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-0", "note impact 1 green", 24, false);
		animation.addByPrefix("note0-0", "note impact 1 purple", 24, false);
		animation.addByPrefix("note3-0", "note impact 1 red", 24, false);

		animation.addByPrefix("note1-1", "note impact 2 blue", 24, false);
		animation.addByPrefix("note2-1", "note impact 2 green", 24, false);
		animation.addByPrefix("note0-1", "note impact 2 purple", 24, false);
		animation.addByPrefix("note3-1", "note impact 2 red", 24, false);
		setupNoteSplash(x, y, note);

		}
}

public function setupNoteSplash(x:Float, y:Float, ?note:Int = 0) {
	setPosition(x, y);
		alpha = 0.6;
		animation.play('note' + note + '-' + FlxG.random.int(0, 1), true);
		animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
		updateHitbox();
		offset.set(Std.int(0.3 * width), Std.int(0.3 * height));
	}
	override public function update(elapsed)
	{
		if (animation.curAnim.finished)
			kill();
		super.update(elapsed);
	}
}

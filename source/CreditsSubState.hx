package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG.keys;

#if windows
import Discord.DiscordClient;
#end

class CreditsSubState extends MusicBeatState
{
	var curSelected:Int = 2;
	
	var bg:FlxSprite;
	var unselected:FlxSprite;
	var selection:FlxSprite;
	var credits:FlxSprite;
	var shit:FlxSprite;
	
	var menuItems:FlxTypedGroup<FlxSprite>;
	
	var personShit:Array<String> = ['0', '1', '2', '3', '4', '5', '6', '7', '8'];

	override function create()
	{
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);


		unselected = new FlxSprite(-600, -90);
		add(unselected);
		unselected.loadGraphic(Paths.image('creditsAssets/Unselected'));
		unselected.y += 70;
		unselected.alpha = 0;

		credits = new FlxSprite(-1300, -90);
		add(credits);
		credits.loadGraphic(Paths.image('creditsAssets/CREDITS'));

		selection = new FlxSprite(-600, -90);
		selection.frames = Paths.getSparrowAtlas('creditsAssets/Select');
		selection.animation.addByPrefix('0','Twoop',1,true);
		selection.animation.addByPrefix('1','BrightFyre',1,true);
		selection.animation.addByPrefix('2','JellyFish',1,true);
		selection.animation.addByPrefix('3','GenoX',1,true);
		selection.animation.addByPrefix('4','Smokey',1,true);
		selection.animation.addByPrefix('5','NoLime',1,true);
		selection.animation.addByPrefix('6','Pincer',1,true);
		selection.animation.addByPrefix('7','Moisty',1,true);
		selection.animation.addByPrefix('8','Tama',1,true);
		selection.antialiasing = true;
		add(selection);
		selection.animation.play('2');
		selection.y += 70;
		selection.alpha = 0;

		FlxTween.tween(selection,{y: selection.y - 70, alpha: 1},0.7,{ease:FlxEase.smoothStepOut});

		FlxTween.linearMotion(credits, -1300, -90, -600, -90, 1, true, {type: FlxTweenType.ONESHOT, ease: FlxEase.expoInOut});
		
		FlxTween.tween(unselected,{y: unselected.y - 70, alpha: 1},0.7,{ease:FlxEase.smoothStepOut});

		changeSelection();

		super.create();
	}

	var movedBack:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (controls.ACCEPT)
		{
			switch (curSelected)
			{
				case 0:
					FlxG.openURL("https://www.youtube.com/channel/UCnh1jgwPvtyEvq21wYoB8Jw");
				case 1:
					FlxG.openURL("https://www.youtube.com/channel/UChSwpa_FyJ-kNq9HLVABTEQ");
				case 2:
					FlxG.openURL("https://discord.gg/PnEmcrrfZQ");
				case 3:
					FlxG.openURL("https://www.youtube.com/c/Blantados21");
				case 4:
					FlxG.openURL("https://twitter.com/Smokey_5_");
				case 5:
					FlxG.openURL("https://gamejolt.com/games/Fnf_Code_b/682613");
				case 6:
					FlxG.openURL("https://www.youtube.com/channel/UC5bJODxQncuoKCtGDL5xlXA");
				case 7:
					FlxG.openURL('https://www.roblox.com/games/4623386862/Piggy-TAG-GAMEMODE#!/game-instances');
				case 8:
					trace("no encontre el link ._.");
			}
		}
		if (controls.LEFT_P)
		{
			changeSelection(-1);
		}
		if (controls.RIGHT_P)
		{
			changeSelection(1);
		}
		if (controls.BACK && !movedBack)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new MainMenuState());
		}
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = 8;
		if (curSelected > 8)
			curSelected = 0;

		selection.animation.play(personShit[curSelected]);
	}
}
		
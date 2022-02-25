package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['challengue', 'freeplay', 'credits', 'awards', 'donate', 'options'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	public static var firstStart:Bool = true;

	public static var nightly:String = "";

	public static var kadeEngineVer:String = "1.5.4" + nightly;
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;

	var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('Menu Default'));

	var benjamin:FlxSprite =new FlxSprite (650, 17).loadGraphic(Paths.image('BenjaminXD'));

	var bf:FlxSprite =new FlxSprite (600).loadGraphic(Paths.image('BFHey!!'));

	var gf:FlxSprite =new FlxSprite (600).loadGraphic(Paths.image('Gf Cheer'));

	var dad:FlxSprite =new FlxSprite (670, 25).loadGraphic(Paths.image('Dad Thicc'));

	var pico:FlxSprite =new FlxSprite (700).loadGraphic(Paths.image('Pico Punch'));

	public var curCol:FlxColor = 0xFFFFFFFF;
	public var mainCol:FlxColor = 0xFFE78B07;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.color = curCol;
		bg.antialiasing = true;
		add(bg);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('Menu Default'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFFFFFFF;
		add(magenta);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(80, (i * 140));
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
			if (firstStart)
				FlxTween.tween(menuItem,{y: 20 + (i * 140)},1 + (i * 0.125) ,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						finishedFunnyMove = true; 
						changeItem();
					}});
			else
				menuItem.y = 20 + (i * 140);
		}

		firstStart = false;

		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, gameVer +  (Main.watermarks ? " FNF - " + kadeEngineVer + " Kade Engine" : ""), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		changeBGColor();

		changeCharacter();

		super.create();
	}

	public function changeCharacter():Void{

		switch (optionShit[curSelected])
			{
				case 'challengue':
					benjamin.scrollFactor.x = 0;
					benjamin.scrollFactor.y = 0;
					benjamin.updateHitbox();
					benjamin.setGraphicSize(Std.int(bg.width * 0));
					benjamin.antialiasing = true;
					add(benjamin);
					remove(bf);
					remove(dad);
				case 'freeplay':
					bf.scrollFactor.x = 0;
					bf.scrollFactor.y = 0;
					bf.updateHitbox();
					bf.setGraphicSize(Std.int(bg.width * 0));
					bf.antialiasing = true;
					add(bf);
					remove(benjamin);
					remove(gf);
				case 'credits':
					gf.scrollFactor.x = 0;
					gf.scrollFactor.y = 0;
					gf.updateHitbox();
					gf.setGraphicSize(Std.int(bg.width * 0));
					gf.antialiasing = true;
					add(gf);
					remove(bf);
					remove(pico);
				case 'donate':
					pico.scrollFactor.x = 0;
					pico.scrollFactor.y = 0;
					pico.updateHitbox();
					pico.setGraphicSize(Std.int(bg.width * 0));
					pico.antialiasing = true;
					add(pico);
					remove(gf);
					remove(dad);
				case 'options':
					dad.scrollFactor.x = 0;
					dad.scrollFactor.y = 0;
					dad.updateHitbox();
					dad.setGraphicSize(Std.int(bg.width * 0));
					dad.antialiasing = true;
					add(dad);
					remove(pico);
					remove(benjamin);
		}
	}

	public function changeBGColor():Void
		{
			switch (optionShit[curSelected])
			{
				case 'challengue':
					mainCol = 0xFFffff00;
				case 'freeplay':
					mainCol = 0xFF50a5eb;
				case 'credits':
					mainCol = 0xFFa5004d;
				case 'donate':
					mainCol = 0xFF55e858;
				case 'options':
					mainCol = 0xFFc48ee3;
		}
		FlxTween.color(bg, 0.5, curCol, mainCol);
}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		curCol = bg.color;

		if (!selectedSomethin)
		{
			var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

			if (gamepad != null)
			{
				if (gamepad.justPressed.DPAD_UP)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(-1);
					changeBGColor();
					changeCharacter();
				}
				if (gamepad.justPressed.DPAD_DOWN)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(1);
					changeBGColor();
					changeCharacter();
				}
			}

			if (FlxG.keys.justPressed.UP)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
				changeBGColor();
				changeCharacter();
			}

			if (FlxG.keys.justPressed.DOWN)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
				changeBGColor();
				changeCharacter();
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					fancyOpenURL("https://ninja-muffin24.itch.io/funkin");
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					
					if (FlxG.save.data.flashing)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 1.3, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						if (FlxG.save.data.flashing)
							{
								FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
								{
									goToState();
								});
							}
					else
						{
							{
								new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									goToState();
								});
							}
						}
					});
				}
			}
		}

		super.update(elapsed);
	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		switch (daChoice)
		{
			case 'challengue':
				FlxG.switchState(new StoryMenuState());
				trace("Story Menu Selected");
			case 'freeplay':
				FlxG.switchState(new FreeplayState());

				trace("Freeplay Menu Selected");
			case 'credits':
				FlxG.switchState(new CreditsSubState());
			case 'awards':
				FlxG.switchState(new AwardsMenuState());
			case 'options':
				FlxG.switchState(new OptionsMenu());
		}
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
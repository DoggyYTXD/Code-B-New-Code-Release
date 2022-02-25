package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;
	public var iconColor:String = "any color - ex. FF82d4f5";


	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				iconColor = 'FFa5004d';
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-christmas':
				iconColor = 'FFa5004d';
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-car':
				iconColor = 'FFa5004d';
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-pixel':
				iconColor = 'FFa5004d';
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				iconColor = 'FFaf66ce';
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'spooky':
				iconColor = 'FFd07b00';
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

                loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'mom':
				iconColor = 'FFd5548c';
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

                loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mom-car':
				iconColor = 'FFd5548c';
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
			case 'monster':
				iconColor = 'FFcdd65d';
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'monster-christmas':
				iconColor = 'FFcdd65d';
				tex = Paths.getSparrowAtlas('characters/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -40, -94);
				playAnim('idle');

			case 'pico':
				iconColor = 'FFb7d855';
				tex = Paths.getSparrowAtlas('characters/Pico_Assets');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf':
				iconColor = 'FF31b0d1';
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-christmas':
				iconColor = 'FF31b0d1';
				var tex = Paths.getSparrowAtlas('characters/bfChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				iconColor = 'FF31b0d1';
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				iconColor = 'FF77cbf4';
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				iconColor = 'FF77cbf4';
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				iconColor = 'FFffaa6f';
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				iconColor = 'FFffaa6f';
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				iconColor = 'FFfa3a6b';
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				iconColor = 'FFba539e';
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);

				playAnim('idle');

				case 'bfbenjamin':
					iconColor = 'FFe7e80e';
					var tex = Paths.getSparrowAtlas('characters/Benjamin', 'shared');
					frames = tex;
	
					trace(tex.frames.length);
	
					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
					animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
					animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
					animation.addByPrefix('hey', 'BF HEY', 24, false);
	
					animation.addByPrefix('scared', 'BF idle shaking', 24);
	
					loadOffsetFile(curCharacter);
	
					playAnim('idle');
	
					flipX = true;
				case 'bfruv':
					iconColor = 'FF978aa6';
					var tex = Paths.getSparrowAtlas('characters/ruv_sheet', 'shared');
					frames = tex;
		
					trace(tex.frames.length);
		
					animation.addByPrefix('idle', 'RuvIdle', 24, false);
					animation.addByPrefix('singUP', 'RuvUp', 24, false);
					animation.addByPrefix('singLEFT', 'RuvRight', 24, false);
					animation.addByPrefix('singRIGHT', 'RuvLeft', 24, false);
					animation.addByPrefix('singDOWN', 'RuvDown', 24, false);
					animation.addByPrefix('hey', 'RuvUp', 24, false);
					animation.addByPrefix('singUPmiss', 'RuvIdle', 24, false);
					animation.addByPrefix('singLEFTmiss', 'RuvIdle', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'RuvIdle', 24, false);
					animation.addByPrefix('singDOWNmiss', 'RuvIdle', 24, false);
					animation.addByPrefix('scared', 'RuvIdle', 24, false);

					loadOffsetFile(curCharacter);
		
					playAnim('idle');

				case 'abbyMad':
					iconColor = 'FFd6a053';
					var tex = Paths.getSparrowAtlas('characters/AbbyMADposes', 'shared');
					frames = tex;
			
					trace(tex.frames.length);
			
				    animation.addByPrefix('idle', 'AbbyMadIDLE', 24, false);
					animation.addByPrefix('singUP', 'AbbyMadUP', 24, false);
				    animation.addByPrefix('singLEFT', 'AbbyMadRIGHT', 24, false);
					animation.addByPrefix('singRIGHT', 'AbbyMadLEFT', 24, false);
					animation.addByPrefix('singDOWN', 'AbbyMadDOWN', 24, false);
	
					loadOffsetFile(curCharacter);
			
					playAnim('idle');

				case 'bfpico':
					iconColor = 'FFb7d855';
					var tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss', 'shared');
					frames = tex;
				
					trace(tex.frames.length);
				
					animation.addByPrefix('idle', 'Pico Idle Dance0', 24, false);
					animation.addByPrefix('singUP', 'pico Up note0', 24, false);
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
					animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);
					animation.addByPrefix('hey', 'pico Up note0', 24, false);
					animation.addByPrefix('scared', 'Pico Idle Dance0', 24, false);
				
					loadOffsetFile(curCharacter);

					playAnim('idle');
				
					flipX = true;

				case 'KapiAngry':
					iconColor = 'FF76719e';
					var tex = Paths.getSparrowAtlas('characters/KAPI_ANGRY', 'shared');
					frames = tex;
					
					trace(tex.frames.length);
					
					animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				    animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				    animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				    animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				    animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				    addOffset('idle');
				    addOffset("singUP", -6, 50);
				    addOffset("singRIGHT", 0, 27);
				    addOffset("singLEFT", -10, 10);
				    addOffset("singDOWN", 0, -30);

				    playAnim('idle');

				case 'bface':
					iconColor = 'FFbae2ff';
					var tex = Paths.getSparrowAtlas('characters/ace', 'shared');
					frames = tex;
						
					trace(tex.frames.length);
						
					animation.addByPrefix('idle', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singUP', 'Dad Sing note UP0', 24, false);
					animation.addByPrefix('singRIGHT', 'dad sing note right0', 24, false);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
					animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
					animation.addByPrefix('singUPmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('hey', 'Dad Sing note UP0', 24, false);
	
					loadOffsetFile(curCharacter);
	
					playAnim('idle');

				case 'bftabi':
					iconColor = 'FFffbb81';
					var tex = Paths.getSparrowAtlas('characters/TABI', 'shared');
					frames = tex;
							
				    trace(tex.frames.length);
							
					animation.addByPrefix('idle', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
					animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24, false);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
					animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT0', 24, false);
					animation.addByPrefix('singUPmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Dad idle dance0', 24, false);
					animation.addByPrefix('hey', 'Dad Sing Note UP0', 24, false);
		
                    loadOffsetFile(curCharacter);
		
					playAnim('idle');

				case 'bfmonikareal':
					iconColor = 'FF8cd365';
					var tex = Paths.getSparrowAtlas('characters/Doki_MonikaNonPixel_Assets', 'shared');
					frames = tex;
								
					trace(tex.frames.length);
								
					animation.addByPrefix('idle', 'Idle0', 24, false);
					animation.addByPrefix('singUP', 'Sing Up0', 24, false);
					animation.addByPrefix('singRIGHT', 'Sing Left0', 24, false);
					animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);
					animation.addByPrefix('singLEFT', 'Sing Right0', 24, false);
					animation.addByPrefix('singUPmiss', 'Idle0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Idle0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'Idle0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Idle0', 24, false);
					animation.addByPrefix('hey', 'Sing Up0', 24, false);
			
					loadOffsetFile(curCharacter);
			
					playAnim('idle');

				case 'bftac':
					iconColor = 'FFffd84a';
				    var tex = Paths.getSparrowAtlas('characters/Tac', 'shared');
					frames = tex;
									
					trace(tex.frames.length);
									
					animation.addByPrefix('idle', 'TacIdle0', 24, false);
					animation.addByPrefix('singUP', 'TacUp0', 24, false);
					animation.addByPrefix('singRIGHT', 'TacLeft0', 24, false);
					animation.addByPrefix('singDOWN', 'TacDown0', 24, false);
					animation.addByPrefix('singLEFT', 'TacRight0', 24, false);
					animation.addByPrefix('singUPmiss', 'TacIdle0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'TacIdle0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'TacIdle0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'TacIdle0', 24, false);
					animation.addByPrefix('hey', 'TacUp0', 24, false);
					animation.addByPrefix('scared', 'TacIdle0', 24, false);
				
					loadOffsetFile(curCharacter);
				
					playAnim('idle');

				case 'bftaki':
					var tex = Paths.getSparrowAtlas('characters/Taki_Assets', 'shared');
					frames = tex;
										
					trace(tex.frames.length);
										
					animation.addByPrefix('idle', 'monster idle0', 24, false);
					animation.addByPrefix('singUP', 'monster up note0', 24, false);
					animation.addByPrefix('singRIGHT', 'Monster left note0', 24, false);
					animation.addByPrefix('singDOWN', 'monster down0', 24, false);
					animation.addByPrefix('singLEFT', 'Monster Right note0', 24, false);
					animation.addByPrefix('singUPmiss', 'monster idle0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'monster idle0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'monster idle0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'monster idle0', 24, false);
					animation.addByPrefix('hey', 'monster up note0', 24, false);
					
					loadOffsetFile(curCharacter);
					
					playAnim('idle');

				case 'bflucian':
					iconColor = 'FFff9cbe';
					var tex = Paths.getSparrowAtlas('characters/Lucian', 'shared');
					frames = tex;
										
					trace(tex.frames.length);
											
					animation.addByPrefix('idle', 'LucianIdle0', 24, false);
					animation.addByPrefix('singUP', 'LucianUp0', 24, false);
					animation.addByPrefix('singRIGHT', 'LucianLeft0', 24, false);
					animation.addByPrefix('singDOWN', 'LucianDown0', 24, false);
					animation.addByPrefix('singLEFT', 'LucianRight0', 24, false);
					animation.addByPrefix('singUPmiss', 'LucianIdle0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'LucianIdle0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'LucianIdle0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'LucianIdle0', 24, false);
					animation.addByPrefix('hey', 'LucianUp0', 24, false);
						
					loadOffsetFile(curCharacter);
						
					playAnim('idle');

				case 'bfcarol':
					iconColor = 'FF616192';
					var tex = Paths.getSparrowAtlas('characters/carol', 'shared');
					frames = tex;
											
					trace(tex.frames.length);
												
					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singUPmiss', 'BF idle dance', 24, false);
					animation.addByPrefix('singLEFTmiss', 'BF idle dance', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'BF idle dance', 24, false);
					animation.addByPrefix('singDOWNmiss', 'BF idle dance', 24, false);
					animation.addByPrefix('hey', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('scared', 'BF idle dance', 24, false);
							
					loadOffsetFile(curCharacter);
							
					playAnim('idle');

					flipX = true;

				case 'HDSenpaiAngry':
					iconColor = 'FFf8a56c';
				    tex = Paths.getSparrowAtlas('characters/2VPLUS_angrysenpai', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Angry Idle', 24);
					animation.addByPrefix('singUP', 'Angry Up pose', 24);
					animation.addByPrefix('singRIGHT', 'Angry Right pose', 24);
					animation.addByPrefix('singDOWN', 'Angry Down Pose', 24);
					animation.addByPrefix('singLEFT', 'Angry Left pose', 24);
		
					loadOffsetFile(curCharacter);
		
					playAnim('idle');

				case 'WashiAngry':
					iconColor = 'FF733b12';
					tex = Paths.getSparrowAtlas('characters/WashingtonAngry', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('hey', 'BF HEY!!0', 24, false);
			
					loadOffsetFile(curCharacter);
			
					playAnim('idle');

					flipX = true;
				case 'tankman':
					iconColor = 'FF000000';
					tex = Paths.getSparrowAtlas('characters/Tankman', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Tankman Idle Dance instance', 24, false);
					animation.addByPrefix('singUP', 'Tankman UP note instance ', 24, false);
					animation.addByPrefix('singRIGHT', 'Tankman Note Left instance', 24, false);
					animation.addByPrefix('singDOWN', 'Tankman DOWN note instance', 24, false);
					animation.addByPrefix('singLEFT', 'Tankman Right Note instance ', 24, false);
					animation.addByPrefix('ugh', 'TANKMAN UGH instance', 24, false);
				
					loadOffsetFile(curCharacter);
				
					playAnim('idle');
					
				    flipX = true;
					
				case 'retro':
					iconColor = 'FF17d8e4';
					tex = Paths.getSparrowAtlas('characters/RetroSpecter', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Idle', 24, false);
					animation.addByPrefix('singUP', 'Sing Up', 24, false);
					animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
					animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
					animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
					
					loadOffsetFile(curCharacter);
					
					playAnim('idle');

				case 'whittyMad':
					iconColor = 'FFce002c';
					tex = Paths.getSparrowAtlas('characters/WhittyCrazy', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Whitty idle dance', 24, false);
					animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24, false);
					animation.addByPrefix('singRIGHT', 'whitty sing note right', 24, false);
					animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24, false);
					animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24, false);
						
					loadOffsetFile(curCharacter);
						
					playAnim('idle');
				case 'sarvDark':
					iconColor = 'FFec8bbd';
					tex = Paths.getSparrowAtlas('characters/sarvente_sheet', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'SarvDarkIdle', 24, false);
					animation.addByPrefix('singUP', 'SarvDarkUp', 24, false);
					animation.addByPrefix('singRIGHT', 'SarvDarkRight', 24, false);
					animation.addByPrefix('singDOWN', 'SarvDarkDown', 24, false);
					animation.addByPrefix('singLEFT', 'SarvDarkLeft', 24, false);
							
					loadOffsetFile(curCharacter);
							
					playAnim('idle');
				case 'Selever':
					iconColor = 'FF972651';
					tex = Paths.getSparrowAtlas('characters/Selever', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'SelIdle', 24, false);
					animation.addByPrefix('singUP', 'SelUp', 24, false);
					animation.addByPrefix('singRIGHT', 'SelRight', 24, false);
					animation.addByPrefix('singDOWN', 'SelDown', 24, false);
					animation.addByPrefix('singLEFT', 'SelLeft', 24, false);
								
				    loadOffsetFile(curCharacter);
								
					playAnim('idle');
				case 'GFHypno':
					iconColor = 'FFa5004d';
					tex = Paths.getSparrowAtlas('characters/HypnoGirlfriend', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'gf_idle_not_hypno_2s instance', 24, false);
					animation.addByPrefix('singUP', 'gf_up instance', 24, false);
					animation.addByPrefix('singRIGHT', 'gf_left_alt instance', 24, false);
					animation.addByPrefix('singDOWN', 'gf_down instance', 24, false);
					animation.addByPrefix('singLEFT', 'gf_right_better instance', 24, false);
									
					loadOffsetFile(curCharacter);
									
					playAnim('idle');
				    flipX = true;
				case 'AgotiAngry':
					iconColor = 'FFb91d23';
					tex = Paths.getSparrowAtlas('characters/AGOTI-MAD', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Angry_Agoti_Idle', 24, false);
					animation.addByPrefix('singUP', 'Angry_Agoti_Up', 24, false);
					animation.addByPrefix('singRIGHT', 'Angry_Agoti_Right', 24, false);
					animation.addByPrefix('singDOWN', 'Angry_Agoti_Down', 24, false);
					animation.addByPrefix('singLEFT', 'Angry_Agoti_Left', 24, false);
									
					loadOffsetFile(curCharacter);
									
					playAnim('idle');

				case 'Elicrack':
					iconColor = 'FF3333cc';
					tex = Paths.getSparrowAtlas('characters/ElicrackYT', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('hey', 'BF HEY!!0', 24, false);
				
					loadOffsetFile(curCharacter);
				
					playAnim('idle');
	
					flipX = true;
				case 'bfbotan':
					iconColor = 'FFb9c1dc';
					var tex = Paths.getSparrowAtlas('characters/Button', 'shared');
					frames = tex;
					
					trace(tex.frames.length);
					
					animation.addByPrefix('idle', 'Pico Idle Dance0', 24, false);
					animation.addByPrefix('singUP', 'pico Up note0', 24, false);
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
					animation.addByPrefix('singUPmiss', 'pico Up note miss0', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss0', 24, false);
					animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS0', 24, false);
					animation.addByPrefix('hey', 'botan PEACE!0', 24, false);
					animation.addByPrefix('scared', 'botan thunder0', 24, false);

					loadOffsetFile(curCharacter);
					
					playAnim('idle');
					
					flipX = true;
	
				case 'bfbotanGameOver':
				    iconColor = 'FFb9c1dc';
					var tex = Paths.getSparrowAtlas('characters/Button', 'shared');
					frames = tex;
					
					trace(tex.frames.length);

					animation.addByPrefix('firstDeath', "botan GameOver START0", 24, false);
					animation.addByPrefix('deathLoop', "botan GameOver LOOP", 24, true);
					animation.addByPrefix('deathConfirm', "botan GameOver RETRYCONFIRM0", 24, false);

					loadOffsetFile(curCharacter);

					playAnim('idle');
					
					flipX = true;

				case 'Whitty':
					iconColor = 'FF1d1e35';
					tex = Paths.getSparrowAtlas('characters/WhittySprites', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Idle', 24, false);
					animation.addByPrefix('singUP', 'Sing Up', 24, false);
					animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
					animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
					animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
		
					loadOffsetFile(curCharacter);
		
					playAnim('idle');

				case 'piconjo':
					iconColor = 'FF461678';
					tex = Paths.getSparrowAtlas('characters/Piconjo_Assets', 'shared');
					frames = tex;
				    animation.addByPrefix('idle', 'monster idle', 24, false);
				    animation.addByPrefix('singUP', 'monster up note', 24, false);
				    animation.addByPrefix('singDOWN', 'monster down', 24, false);
				    animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				    animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				    loadOffsetFile(curCharacter);

				    playAnim('idle');

					case 'bfagoti':
						iconColor = 'FFb91d23';
						var tex = Paths.getSparrowAtlas('characters/AGOTI', 'shared');
						frames = tex;
												
						trace(tex.frames.length);
													
						animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
						animation.addByPrefix('singUP', 'Agoti_Up0', 24, false);
						animation.addByPrefix('singLEFT', 'Agoti_Right0', 24, false);
						animation.addByPrefix('singRIGHT', 'Agoti_Left0', 24, false);
						animation.addByPrefix('singDOWN', 'Agoti_Down0', 24, false);
						animation.addByPrefix('singUPmiss', 'Agoti_Idle', 24, false);
						animation.addByPrefix('singLEFTmiss', 'Agoti_Idle', 24, false);
						animation.addByPrefix('singRIGHTmiss', 'Agoti_Idle', 24, false);
						animation.addByPrefix('singDOWNmiss', 'Agoti_Idle', 24, false);
						animation.addByPrefix('hey', 'Agoti_Up0', 24, false);
						animation.addByPrefix('scared', 'Agoti_Idle', 24, false);
								
                        loadOffsetFile(curCharacter);
								
						playAnim('idle');

				case 'Tabi':
					iconColor = 'FFffbb81';
					var tex = Paths.getSparrowAtlas('characters/TABI', 'shared');
					frames = tex;
							
				    trace(tex.frames.length);
							
					animation.addByPrefix('idle', 'Dad idle dance0', 24, false);
					animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
					animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24, false);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
					animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT0', 24, false);
		
					loadOffsetFile(curCharacter);

					playAnim('idle');
					
					case 'bfsenpaiAngry':
						iconColor = 'FFf8a56c';
						tex = Paths.getSparrowAtlas('characters/2VPLUS_angrysenpai', 'shared');
						frames = tex;
						animation.addByPrefix('idle', 'Angry Idle0', 24, false);
						animation.addByPrefix('singUP', 'Angry Up pose0', 24, false);
						animation.addByPrefix('singRIGHT', 'Angry Left pose0', 24, false);
						animation.addByPrefix('singDOWN', 'Angry Down Pose0', 24, false);
						animation.addByPrefix('singLEFT', 'Angry Right pose0', 24, false);
						animation.addByPrefix('singUPmiss', 'Angry Idle0', 24, false);
					    animation.addByPrefix('singRIGHTmiss', 'Angry Idle0', 24, false);
					    animation.addByPrefix('singDOWNmiss', 'Angry Idle0', 24, false);
					    animation.addByPrefix('singLEFTmiss', 'Angry Idle0', 24, false);
					    animation.addByPrefix('hey', 'Angry Up pose0', 24, false);
						animation.addByPrefix('scared', 'Angry Idle0', 24, false);

                        loadOffsetFile(curCharacter);
					
						playAnim('idle');
					
						case 'bfnene':
							iconColor = 'FFe81d8f';
							var tex = Paths.getSparrowAtlas('characters/Nene', 'shared');
							frames = tex;
						
							trace(tex.frames.length);
						
							animation.addByPrefix('idle', 'NeneIdle0', 24, false);
							animation.addByPrefix('singUP', 'NeneIdleUp0', 24, false);
							animation.addByPrefix('singLEFT', 'NeneLeft0', 24, false);
							animation.addByPrefix('singRIGHT', 'NeneRightIdle0', 24, false);
							animation.addByPrefix('singDOWN', 'NeneIdleDown0', 24, false);
							animation.addByPrefix('hey', 'NeneIdleHEY!0', 24, false);
							animation.addByPrefix('singUPmiss', 'NeneIdle', 24, false);
							animation.addByPrefix('singLEFTmiss', 'NeneIdle', 24, false);
							animation.addByPrefix('singRIGHTmiss', 'NeneIdle', 24, false);
							animation.addByPrefix('singDOWNmiss', 'NeneIdle', 24, false);
						
							loadOffsetFile(curCharacter);
						
							playAnim('idle');

							flipX = true;

							case 'Ruv':
								iconColor = 'FF978aa6';
								var tex = Paths.getSparrowAtlas('characters/ruv_sheet', 'shared');
								frames = tex;
										
								trace(tex.frames.length);
										
								animation.addByPrefix('idle', 'RuvIdle', 24, false);
								animation.addByPrefix('singUP', 'RuvUp', 24, false);
								animation.addByPrefix('singRIGHT', 'RuvRight', 24, false);
								animation.addByPrefix('singDOWN', 'RuvDown', 24, false);
								animation.addByPrefix('singLEFT', 'RuvLeft', 24, false);
					
								loadOffsetFile(curCharacter);
					
								playAnim('idle');
							case 'bfselever':
								iconColor = 'FF972651';
								var tex = Paths.getSparrowAtlas('characters/Selever', 'shared');
								frames = tex;
						
								trace(tex.frames.length);
						
								animation.addByPrefix('idle', 'SelIdle', 24, false);
								animation.addByPrefix('singUP', 'SelUp', 24, false);
								animation.addByPrefix('singLEFT', 'SelRight', 24, false);
								animation.addByPrefix('singRIGHT', 'SelLeft', 24, false);
								animation.addByPrefix('singDOWN', 'SelDown', 24, false);
								animation.addByPrefix('hey', 'SelHey', 24, false);
								animation.addByPrefix('singUPmiss', 'SelIdle', 24, false);
								animation.addByPrefix('singLEFTmiss', 'SelIdle', 24, false);
								animation.addByPrefix('singRIGHTmiss', 'SelIdle', 24, false);
								animation.addByPrefix('singDOWNmiss', 'SelIdle', 24, false);
								animation.addByPrefix('scared', 'SelIdle', 24, false);
				
                                loadOffsetFile(curCharacter);
						
								playAnim('idle');

				case 'bfdoggy':
				    iconColor = 'FF660033';
				    var tex = Paths.getSparrowAtlas('characters/Doggy', 'shared');
				    frames = tex;

				    trace(tex.frames.length);

				    animation.addByPrefix('idle', 'BF idle dance', 24, false);
				    animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				    animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				    animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				    animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				    animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				    animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				    animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				    animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				    animation.addByPrefix('hey', 'BF HEY', 24, false);

				    animation.addByPrefix('firstDeath', "BF dies", 24, false);
				    animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				    animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				    animation.addByPrefix('scared', 'BF idle shaking', 24);

                    loadOffsetFile(curCharacter);

				    playAnim('idle');

				    flipX = true;

					case 'Benjamin':
						iconColor = 'FFe7e80e';
						var tex = Paths.getSparrowAtlas('characters/Benjamin', 'shared');
						frames = tex;
		
						trace(tex.frames.length);
		
						animation.addByPrefix('idle', 'BF idle dance', 24, false);
						animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
						animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
						animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
						animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
						animation.addByPrefix('hey', 'BF HEY', 24, false);
		
						loadOffsetFile(curCharacter);
		
						playAnim('idle');
		
						flipX = true;
						case 'gfbunny':
							// GIRLFRIEND CODE
							iconColor = 'FFa5004d';
							tex = Paths.getSparrowAtlas('characters/Bunny');
							frames = tex;
							animation.addByPrefix('cheer', 'GF Cheer', 24, false);
							animation.addByPrefix('singLEFT', 'GF left note', 24, false);
							animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
							animation.addByPrefix('singUP', 'GF Up Note', 24, false);
							animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
							animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
							animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
							animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
							animation.addByPrefix('scared', 'GF FEAR', 24);
			
							addOffset('cheer', 0, 150);
							addOffset('sad', -2, 148);
							addOffset('danceLeft', 0, 141);
							addOffset('danceRight', 0, 141);
			
							addOffset("singUP", 0, 4);
							addOffset("singRIGHT", 0, -20);
							addOffset("singLEFT", 0, -19);
							addOffset("singDOWN", 0, -20);
			
							addOffset('scared', -2, -17);
			
							playAnim('danceRight');
			case 'bfmateo':
				iconColor = 'FFfe6600';
				var tex = Paths.getSparrowAtlas('characters/Mateo', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
				case 'MrBeast':
						iconColor = 'FF008cd2';
						var tex = Paths.getSparrowAtlas('characters/beast_assets', 'shared');
						frames = tex;
		
						trace(tex.frames.length);
		
						animation.addByPrefix('idle', 'idle', 24, false);
						animation.addByPrefix('singUP', 'up', 24, false);
						animation.addByPrefix('singLEFT', 'left', 24, false);
						animation.addByPrefix('singRIGHT', 'right', 24, false);
						animation.addByPrefix('singDOWN', 'down', 24, false);
		
						loadOffsetFile(curCharacter);
		
						playAnim('idle');
			    case 'bfeli':
					iconColor = 'FF3333cc';
					tex = Paths.getSparrowAtlas('characters/ElicrackYT', 'shared');
				    frames = tex;

				    trace(tex.frames.length);

				    animation.addByPrefix('idle', 'BF idle dance', 24, false);
				    animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				    animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				    animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				    animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				    animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				    animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				    animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				    animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				    animation.addByPrefix('hey', 'BF HEY', 24, false);

				    animation.addByPrefix('firstDeath', "BF dies", 24, false);
				    animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				    animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				    animation.addByPrefix('scared', 'BF idle shaking', 24);

					loadOffsetFile(curCharacter);

				    playAnim('idle');

				    flipX = true;
					
				    case 'bfspooky':
						iconColor = 'FFd07b00';
						tex = Paths.getSparrowAtlas('characters/bfspookyKids');
						frames = tex;
						animation.addByPrefix('idle', 'spooky dance idle', 24, false);
						animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
						animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
						animation.addByPrefix('singLEFT', 'spooky sing right', 24, false);
						animation.addByPrefix('singRIGHT', 'note sing left', 24, false);
						animation.addByPrefix('hey', 'spooky kids YEAH!!', 24, false);
						animation.addByPrefix('singUPmiss', 'spooky dance idle', 24, false);
						animation.addByPrefix('singDOWNmiss', 'spooky dance idle', 24, false);
						animation.addByPrefix('singLEFTmiss', 'spooky dance idle', 24, false);
						animation.addByPrefix('singRIGHTmiss', 'spooky dance idle', 24, false);
						animation.addByPrefix('scared', 'spooky dance idle', 24, false);

                        loadOffsetFile(curCharacter);
		
						playAnim('idle');

				case 'sarv':
					iconColor = 'FFec8bbd';
					tex = Paths.getSparrowAtlas('characters/sarvente_sheet', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'SarventeIdle', 24, false);
					animation.addByPrefix('singUP', 'SarventeUp', 24, false);
					animation.addByPrefix('singRIGHT', 'SarventeRight', 24, false);
					animation.addByPrefix('singDOWN', 'SarventeDown', 24, false);
					animation.addByPrefix('singLEFT', 'SarventeLeft', 24, false);
							
					loadOffsetFile(curCharacter);
							
					playAnim('idle');
					case 'garcello':
						iconColor = 'FF8E40A5';
						tex = Paths.getSparrowAtlas('characters/garcello_assets', 'shared');
						frames = tex;
						animation.addByPrefix('idle', 'garcello idle dance', 24, false);
						animation.addByPrefix('singUP', 'garcello Sing Note UP', 24, false);
						animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24, false);
						animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24, false);
						animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24, false);
		
						loadOffsetFile(curCharacter);
		
						playAnim('idle');

							case 'bfannie':
								iconColor = 'FFff1e44';
								var tex = Paths.getSparrowAtlas('characters/annie', 'shared');
								frames = tex;
				
								trace(tex.frames.length);
				
								animation.addByPrefix('idle', 'BF idle dance', 24, false);
								animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
								animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
								animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
								animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
								animation.addByPrefix('singUPmiss', 'BF idle dance', 24, false);
								animation.addByPrefix('singLEFTmiss', 'BF idle dance', 24, false);
								animation.addByPrefix('singRIGHTmiss', 'BF idle dance', 24, false);
								animation.addByPrefix('singDOWNmiss', 'BF idle dance', 24, false);
								animation.addByPrefix('scared', 'BF idle dance', 24, false);
				
								loadOffsetFile(curCharacter);
				
								playAnim('idle');
				
								flipX = true;

								case 'Lucian':
									iconColor = 'FFff9cbe';
									var tex = Paths.getSparrowAtlas('characters/Lucian', 'shared');
									frames = tex;
														
									trace(tex.frames.length);
															
									animation.addByPrefix('idle', 'LucianIdle0', 24, false);
									animation.addByPrefix('singUP', 'LucianUp0', 24, false);
									animation.addByPrefix('singRIGHT', 'LucianRight0', 24, false);
									animation.addByPrefix('singDOWN', 'LucianDown0', 24, false);
									animation.addByPrefix('singLEFT', 'LucianLeft0', 24, false);
										
									loadOffsetFile(curCharacter);

									playAnim('idle');

									case 'Kapi':
										iconColor = 'FF76719e';
										var tex = Paths.getSparrowAtlas('characters/KAPI', 'shared');
										frames = tex;
										
										trace(tex.frames.length);
										
										animation.addByPrefix('idle', 'Dad idle dance', 24, false);
										animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
										animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
										animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
										animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);
					
										loadOffsetFile(curCharacter);
					
										playAnim('idle');
			case 'bfbenjaminDead':
				iconColor = 'FFe7e80e';
				frames = Paths.getSparrowAtlas('characters/BenjaminDead');
				animation.addByPrefix('idle', "BF dies", 24, false);
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
				loadOffsetFile(curCharacter);
	
				animation.play('firstDeath');
					
				flipX = true;
				case 'gf-tankman':
					frames = Paths.getSparrowAtlas('characters/gfTankmen');
					animation.addByIndices('sad', 'GF Crying at Gunpoint ', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
					animation.addByIndices('danceLeft', 'GF Dancing at Gunpoint', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
					animation.addByIndices('danceRight', 'GF Dancing at Gunpoint', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
					addOffset('sad', 78, 19);
					addOffset('danceLeft', 80, 31);
					addOffset('danceRight', 80, 31);
						
		
					playAnim('danceRight');	
					case 'bfkapi':
						iconColor = 'FF616192';
						var tex = Paths.getSparrowAtlas('characters/KapiPlayable', 'shared');
						frames = tex;
												
						trace(tex.frames.length);
													
						animation.addByPrefix('idle', 'BF idle dance', 24, false);
						animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
						animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
						animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
						animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
						animation.addByPrefix('singUPmiss', 'BF idle dance', 24, false);
						animation.addByPrefix('singLEFTmiss', 'BF idle dance', 24, false);
						animation.addByPrefix('singRIGHTmiss', 'BF idle dance', 24, false);
						animation.addByPrefix('singDOWNmiss', 'BF idle dance', 24, false);
						animation.addByPrefix('hey', 'BF NOTE UP0', 24, false);
								
                        loadOffsetFile(curCharacter);
								
						playAnim('idle');
	
						flipX = true;	
						case 'bfmarcos':
							iconColor = 'FF008f00';
							var tex = Paths.getSparrowAtlas('characters/MarcosBry', 'shared');
							frames = tex;
													
							trace(tex.frames.length);
														
							animation.addByPrefix('idle', 'BF idle dance', 24, false);
							animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
							animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
							animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
							animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
							animation.addByPrefix('singUPmiss', 'BF idle dance', 24, false);
							animation.addByPrefix('singLEFTmiss', 'BF idle dance', 24, false);
							animation.addByPrefix('singRIGHTmiss', 'BF idle dance', 24, false);
							animation.addByPrefix('singDOWNmiss', 'BF idle dance', 24, false);
							animation.addByPrefix('hey', 'BF NOTE UP0', 24, false);
							animation.addByPrefix('scared', 'BF idle shaking', 24);
									
							loadOffsetFile(curCharacter);
									
							playAnim('idle');
		
							flipX = true;

			case 'sonicfun':
				iconColor = 'FF7e57c2';
				tex = Paths.getSparrowAtlas('characters/SonicFunAssets');
				frames = tex;
				animation.addByPrefix('idle', 'SONICFUNIDLE instance', 24);
				animation.addByPrefix('singUP', 'SONICFUNUP instance', 24);
				animation.addByPrefix('singRIGHT', 'SONICFUNRIGHT instance', 24);
				animation.addByPrefix('singDOWN', 'SONICFUNDOWN instance', 24);
				animation.addByPrefix('singLEFT', 'SONICFUNLEFT instance', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			
		case 'Eduardo':
			iconColor = 'FF11712b';
			tex = Paths.getSparrowAtlas('characters/Eduardo');
		    frames = tex;
			animation.addByPrefix('idle', 'EduardoIdle', 24);
		    animation.addByPrefix('singUP', 'EduardoUp', 24);
			animation.addByPrefix('singRIGHT', 'EduardoRight', 24);
			animation.addByPrefix('singDOWN', 'EduardoDown', 24);
			animation.addByPrefix('singLEFT', 'EduardoLeft', 24);
	
			loadOffsetFile(curCharacter);
	
			playAnim('idle');				
		
		case 'Tord':
			iconColor = 'FFd9124c';
			tex = Paths.getSparrowAtlas('characters/Tord');
			frames = tex;
			animation.addByPrefix('idle', 'TordIdlePlayable', 24);
			animation.addByPrefix('singUP', 'TordIdleUp', 24);
			animation.addByPrefix('singRIGHT', 'TordIdleRight', 24);
			animation.addByPrefix('singDOWN', 'TordIdleDown', 24);
			animation.addByPrefix('singLEFT', 'TordIdleLeft', 24);
		
			loadOffsetFile(curCharacter);
		
			playAnim('idle');

		case 'Uberkid':
			iconColor = 'FF285fa8';
			tex = Paths.getSparrowAtlas('characters/UberKid');
			frames = tex;
			animation.addByPrefix('idle', 'UberKidIdle', 24);
			animation.addByPrefix('singUP', 'UberKidUp', 24);
			animation.addByPrefix('singRIGHT', 'UberKidRight', 24);
			animation.addByPrefix('singDOWN', 'UberKidDown', 24);
			animation.addByPrefix('singLEFT', 'UberKidsLeft', 24);
			
			loadOffsetFile(curCharacter);
			
			playAnim('idle');

		case 'Nene':
			iconColor = 'FFea77c3';
			tex = Paths.getSparrowAtlas('characters/Nene');
			frames = tex;
			animation.addByPrefix('idle', 'NeneIdle0', 24);
			animation.addByPrefix('singUP', 'NeneIdleUp', 24);
			animation.addByPrefix('singRIGHT', 'NeneLeft', 24);
			animation.addByPrefix('singDOWN', 'NeneIdleDown', 24);
			animation.addByPrefix('singLEFT', 'NeneRightIdle', 24);
				
			loadOffsetFile(curCharacter);
				
			playAnim('idle');

			flipX = true;
		
		case 'Agoti':
			iconColor = 'FFb91d23';
			tex = Paths.getSparrowAtlas('characters/AGOTI', 'shared');
			frames = tex;
										
			animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
			animation.addByPrefix('singUP', 'Agoti_Up0', 24, false);
			animation.addByPrefix('singLEFT', 'Agoti_Left0', 24, false);
			animation.addByPrefix('singRIGHT', 'Agoti_Right0', 24, false);
			animation.addByPrefix('singDOWN', 'Agoti_Down0', 24, false);
				
			loadOffsetFile(curCharacter);
				
			playAnim('idle');

		case 'Luis4':
			iconColor = 'FFef7106';
			tex = Paths.getSparrowAtlas('characters/testis_WOAA', 'shared');
			frames = tex;
											
			animation.addByPrefix('idle', 'whitty idle style change0', 24, false);
			animation.addByPrefix('singUP', 'whitty up style change0', 24, false);
			animation.addByPrefix('singLEFT', 'whitty left style change0', 24, false);
			animation.addByPrefix('singRIGHT', 'whitty right style change0', 24, false);
			animation.addByPrefix('singDOWN', 'whitty down style change0', 24, false);
					
			loadOffsetFile(curCharacter);
					
			playAnim('idle');
	
		case 'SenpaiHappy':
			iconColor = 'FFf8a56c';
			tex = Paths.getSparrowAtlas('characters/2VPLUS_senpai', 'shared');
			frames = tex;
												
			animation.addByPrefix('idle', 'Idle0', 24, false);
			animation.addByPrefix('singUP', 'Up pose0', 24, false);
			animation.addByPrefix('singLEFT', 'Left pose', 24, false);
			animation.addByPrefix('singRIGHT', 'Right pose', 24, false);
			animation.addByPrefix('singDOWN', 'Down pose', 24, false);
						
			loadOffsetFile(curCharacter);
						
			playAnim('idle');

		case 'Ron':
			iconColor = 'FFfece04';
			tex = Paths.getSparrowAtlas('characters/ron', 'shared');
			frames = tex;
												
			animation.addByPrefix('idle', 'Idle0', 24, false);
			animation.addByPrefix('singUP', 'Sing Up0', 24, false);
			animation.addByPrefix('singLEFT', 'Sing Left0', 24, false);
			animation.addByPrefix('singRIGHT', 'Sing Right0', 24, false);
			animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);
						
			loadOffsetFile(curCharacter);
						
			playAnim('idle');

		case 'bftankman':
			iconColor = 'FF000000';
			tex = Paths.getSparrowAtlas('characters/Tankman', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Tankman Idle Dance instance', 24, false);
			animation.addByPrefix('singUP', 'Tankman UP note instance ', 24, false);
			animation.addByPrefix('singRIGHT', 'Tankman Right Note instance', 24, false);
			animation.addByPrefix('singDOWN', 'Tankman DOWN note instance', 24, false);
			animation.addByPrefix('singLEFT', 'Tankman Note Left instance', 24, false);
			animation.addByPrefix('ugh', 'TANKMAN UGH instance', 24, false);
			
			loadOffsetFile(curCharacter);
			
			playAnim('idle');
				
			flipX = true;

		case 'bfhank':
			iconColor = 'FF1c1b37';
			tex = Paths.getSparrowAtlas('characters/Hank', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Hank Idle0', 24, false);
			animation.addByPrefix('singUP', 'Hank Up note0', 24, false);
			animation.addByPrefix('singRIGHT', 'Hank Left Note0', 24, false);
			animation.addByPrefix('singDOWN', 'Hank Down Note0', 24, false);
			animation.addByPrefix('singLEFT', 'Hank right note0', 24, false);
			animation.addByPrefix('hey', 'hanktaunt0', 24, false);
				
			loadOffsetFile(curCharacter);
				
			playAnim('idle');

		case 'bfupdike':
			iconColor = 'FFdfdfdf';
			tex = Paths.getSparrowAtlas('characters/updike_assets', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'updingdong idle0', 24, false);
			animation.addByPrefix('singUP', 'updingdong up note0', 24, false);
			animation.addByPrefix('singRIGHT', 'updingdong left note0', 24, false);
			animation.addByPrefix('singDOWN', 'updingdong down note0', 24, false);
			animation.addByPrefix('singLEFT', 'updingdong right note0', 24, false);
			animation.addByPrefix('hey', 'updingdong up note0', 24, false);
					
			loadOffsetFile(curCharacter);
					
			playAnim('idle');

		case 'bfunder':
			iconColor = 'FF00c3ff';
			tex = Paths.getSparrowAtlas('characters/penos', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'BF idle dance', 24, false);
			animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
			animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
			animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
			animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
			animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
			animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
			animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
			animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
			animation.addByPrefix('hey', 'BF HEY!!', 24, false);
						
			loadOffsetFile(curCharacter);
						
			playAnim('idle');

			flipX = true;
		
		case 'bfeddSide':
			iconColor = 'FF33ad33';
			tex = Paths.getSparrowAtlas('characters/EddSide', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'EddSideIdle0', 24, false);
			animation.addByPrefix('singUP', 'EddSideUp0', 24, false);
			animation.addByPrefix('singLEFT', 'EddSideLeft0', 24, false);
			animation.addByPrefix('singRIGHT', 'EddSideRight0', 24, false);
			animation.addByPrefix('singDOWN', 'EddSideDown0', 24, false);
			animation.addByPrefix('hey', 'EddSideUp0', 24, false);
							
			loadOffsetFile(curCharacter);
							
			playAnim('idle');

			flipX = true;

		case 'bftom':
			iconColor = 'FF003366';
			tex = Paths.getSparrowAtlas('characters/Tom_Assets', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Tom Idle instance 1', 24, false);
			animation.addByPrefix('singUP', 'Tom Up instance 1', 24, false);
			animation.addByPrefix('singRIGHT', 'Tom Left instance 1', 24, false);
			animation.addByPrefix('singDOWN', 'Tom Down instance 1', 24, false);
			animation.addByPrefix('singLEFT', 'Tom Right instance 1', 24, false);
			animation.addByPrefix('hey', 'Tom Up instance 1', 24, false);
						
			loadOffsetFile(curCharacter);
						
			playAnim('idle');
		
		case 'bfdarnell':
			iconColor = 'FF980099';
			tex = Paths.getSparrowAtlas('characters/Darnell', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'DarnellIdle0', 24, false);
			animation.addByPrefix('singUP', 'DarnellIdleUpPose0', 24, false);
			animation.addByPrefix('singRIGHT', 'DarnellIdleRight0', 24, false);
			animation.addByPrefix('singDOWN', 'DarnellIdleDown0', 24, false);
			animation.addByPrefix('singLEFT', 'DarnellIdleLeft0', 24, false);
			animation.addByPrefix('hey', 'DarnellIdleHEY!!0', 24, false);
							
			loadOffsetFile(curCharacter);
							
			playAnim('idle');

            flipX = true;

			case 'gf_JUICY':
				frames = Paths.getSparrowAtlas('characters/ovaries');
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
				loadOffsetFile(curCharacter);				
		
				playAnim('danceRight');	
			
			case 'gfunder2':
				frames = Paths.getSparrowAtlas('characters/ovaries_but_cooler');
				animation.addByIndices('sad', 'gf sad style change', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat style change', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat style change', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		
				loadOffsetFile(curCharacter);				
			
				playAnim('danceRight');	

	case 'bfpicoUnloaded':
		iconColor = 'FFb7d855';
		var tex = Paths.getSparrowAtlas('characters/Pico_Unloaded', 'shared');
		frames = tex;
				
		trace(tex.frames.length);
	
		animation.addByPrefix('idle', 'Pico Idle Dance0', 24, false);
		animation.addByPrefix('singUP', 'pico Up note0', 24, false);
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
	    animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
		animation.addByPrefix('singUPmiss', 'Pico Idle Dance0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'Pico Idle Dance0', 24, false);
	    animation.addByPrefix('singRIGHTmiss', 'Pico Idle Dance0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'Pico Idle Dance0', 24, false);
		animation.addByPrefix('hey', 'pico Up note0', 24, false);
		animation.addByPrefix('scared', 'Pico Idle Dance0', 24, false);
				
		loadOffsetFile(curCharacter);

		playAnim('idle');

		flipX = true;

		case 'bfabby':
			iconColor = 'FFd6a053';
			tex = Paths.getSparrowAtlas('characters/AbbyPOSES', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'AbbyIDLE0', 24, false);
			animation.addByPrefix('singUP', 'AbbyUP0', 24, false);
			animation.addByPrefix('singRIGHT', 'AbbyLEFT0', 24, false);
			animation.addByPrefix('singDOWN', 'AbbyDOWN0', 24, false);
			animation.addByPrefix('singLEFT', 'AbbyRIGHT0', 24, false);
							
			loadOffsetFile(curCharacter);
							
			playAnim('idle');
			
		}

		dance();

		if(animation.getByName('hey') == null && animation.getByName('singUP') != null){
        animation.add("hey",animation.getByName('singUP').frames,24,false);
        if(animOffsets['singUP'] != null){
        addOffset('hey', animOffsets['singUP'][0], animOffsets['singUP'][1]);
    }
}

    if(animation.getByName('scared') == null && animation.getByName('idle') != null){
    animation.add("scared",animation.getByName('idle').frames,24,false);
    if(animOffsets['idle'] != null){
      addOffset('scared', animOffsets['idle'][0], animOffsets['idle'][1]);
    }
}

if(animation.getByName('singUPmiss') == null && animation.getByName('idle') != null){
    animation.add("singUPmiss",animation.getByName('idle').frames,24,false);
    if(animOffsets['idle'] != null){
      addOffset('singUPmiss', animOffsets['idle'][0], animOffsets['idle'][1]);
    }
}

if(animation.getByName('singDOWNmiss') == null && animation.getByName('idle') != null){
    animation.add("singDOWNmiss",animation.getByName('idle').frames,24,false);
    if(animOffsets['idle'] != null){
      addOffset('singDOWNmiss', animOffsets['idle'][0], animOffsets['idle'][1]);
    }
}

if(animation.getByName('singRIGHTmiss') == null && animation.getByName('idle') != null){
    animation.add("singRIGHTmiss",animation.getByName('idle').frames,24,false);
    if(animOffsets['idle'] != null){
      addOffset('singRIGHTmiss', animOffsets['idle'][0], animOffsets['idle'][1]);
    }
}

if(animation.getByName('singLEFTmiss') == null && animation.getByName('idle') != null){
    animation.add("singLEFTmiss",animation.getByName('idle').frames,24,false);
    if(animOffsets['idle'] != null){
      addOffset('singLEFTmiss', animOffsets['idle'][0], animOffsets['idle'][1]);
    }
}

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	public function loadOffsetFile(character:String, library:String = 'shared')
		{
			var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('' + character + "Offsets", library));
	
			for (i in 0...offset.length)
			{
				var data:Array<String> = offset[i].split(' ');
				addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
			}
		}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					case 'gf-tankman':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
	
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}
					
					case 'gf_JUICY':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
		
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}
					case 'gfunder2':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
			
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}
				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

					case 'gfbunny':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
	
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
		{
			animOffsets[name] = [x, y];
		}
}

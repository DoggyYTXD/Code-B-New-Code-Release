package;

import flixel.addons.effects.FlxSkewedSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
#if polymod
import polymod.format.ParseRules.TargetSignatureElement;
#end
import PlayState;

using StringTools;

class Note extends FlxSprite
{
	public var strumTime:Float = 0;

	public var mustPress:Bool = false;
	public var noteData:Int = 0;
	public var canBeHit:Bool = false;
	public var tooLate:Bool = false;
	public var wasGoodHit:Bool = false;
	public var prevNote:Note;
	public var modifiedByLua:Bool = false;
	public var sustainLength:Float = 0;
	public var isSustainNote:Bool = false;

	public var noteScore:Float = 1;

	public static var swagWidth:Float = 160 * 0.7;
	public static var PURP_NOTE:Int = 0;
	public static var GREEN_NOTE:Int = 2;
	public static var BLUE_NOTE:Int = 1;
	public static var RED_NOTE:Int = 3;

	public var rating:String = "shit";
	public var estilo:String = "normal";
	public var flag:Bool = true;

	public function new(strumTime:Float, noteData:Int, ?prevNote:Note, ?sustainNote:Bool = false, ?inCharter:Bool = false, ?estiloJ1:Bool = true)
	{
		super();

		if (prevNote == null)
			prevNote = this;

		this.prevNote = prevNote;
		isSustainNote = sustainNote;

		x += 50;
		// MAKE SURE ITS DEFINITELY OFF SCREEN?
		y -= 2000;
		if (inCharter)
			this.strumTime = strumTime;
		else 
			this.strumTime = Math.round(strumTime);

		if (this.strumTime < 0 )
			this.strumTime = 0;

		this.noteData = noteData;

		var daStage:String = PlayState.curStage;

		//defaults if no noteStyle was found in chart
		var noteTypeCheck:String = 'normal';

		if (PlayState.SONG.noteStyle == null) {
			switch(PlayState.storyWeek) {case 6: noteTypeCheck = 'pixel';}
		} else {noteTypeCheck = PlayState.SONG.noteStyle;}

		this.estilo = noteTypeCheck;
		this.flag = estiloJ1;

		setGraphic(this.estilo);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (mustPress)
		{
			// ass
			if (isSustainNote)
			{
				if (strumTime > Conductor.songPosition - (Conductor.safeZoneOffset * 1.5)
					&& strumTime < Conductor.songPosition + (Conductor.safeZoneOffset * 0.5))
					canBeHit = true;
				else
					canBeHit = false;
			}
			else
			{
				if (strumTime > Conductor.songPosition - Conductor.safeZoneOffset
					&& strumTime < Conductor.songPosition + Conductor.safeZoneOffset)
					canBeHit = true;
				else
					canBeHit = false;
			}

			if (strumTime < Conductor.songPosition - Conductor.safeZoneOffset * Conductor.timeScale && !wasGoodHit)
				tooLate = true;
		}
		else
		{
			canBeHit = false;

			if (strumTime <= Conductor.songPosition)
				wasGoodHit = true;
		}

		if (tooLate)
		{
			if (alpha > 0.3)
				alpha = 0.3;
		}

		if(flag){
			if(PlayState.SONG.noteStyle != this.estilo){
				setGraphic(PlayState.SONG.noteStyle);
			}
		}else{
			if(PlayState.estilo2 != this.estilo){
				setGraphic(PlayState.estilo2);
			}
		}
	}

	function setGraphic(estilo:String){
		switch (estilo)
		{
			case 'pixel':
				this.antialiasing = false;
				loadGraphic(Paths.image('weeb/pixelUI/arrows-pixels','week6'), true, 17, 17);

				animation.add('greenScroll', [6]);
				animation.add('redScroll', [7]);
				animation.add('blueScroll', [5]);
				animation.add('purpleScroll', [4]);

				if (isSustainNote)
				{
					loadGraphic(Paths.image('weeb/pixelUI/arrowEnds','week6'), true, 7, 6);

					animation.add('purpleholdend', [4]);
					animation.add('greenholdend', [6]);
					animation.add('redholdend', [7]);
					animation.add('blueholdend', [5]);

					animation.add('purplehold', [0]);
					animation.add('greenhold', [2]);
					animation.add('redhold', [3]);
					animation.add('bluehold', [1]);
				}

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
			case 'BenNotes':
				frames = Paths.getSparrowAtlas('Notes/Benjamin_NOTE_assets');

				animation.addByPrefix('greenScroll', 'green0');
				animation.addByPrefix('redScroll', 'red0');
				animation.addByPrefix('blueScroll', 'blue0');
				animation.addByPrefix('purpleScroll', 'purple0');

				animation.addByPrefix('purpleholdend', 'pruple end hold');
				animation.addByPrefix('greenholdend', 'green hold end');
				animation.addByPrefix('redholdend', 'red hold end');
				animation.addByPrefix('blueholdend', 'blue hold end');

				animation.addByPrefix('purplehold', 'purple hold piece');
				animation.addByPrefix('greenhold', 'green hold piece');
				animation.addByPrefix('redhold', 'red hold piece');
				animation.addByPrefix('bluehold', 'blue hold piece');

				setGraphicSize(Std.int(width * 0.7));
				updateHitbox();
				antialiasing = true;
				case 'Doki':
					frames = Paths.getSparrowAtlas('Notes/Doki_Doki_NOTE_assets');
	
					animation.addByPrefix('greenScroll', 'green0');
					animation.addByPrefix('redScroll', 'red0');
					animation.addByPrefix('blueScroll', 'blue0');
					animation.addByPrefix('purpleScroll', 'purple0');
	
					animation.addByPrefix('purpleholdend', 'pruple end hold');
					animation.addByPrefix('greenholdend', 'green hold end');
					animation.addByPrefix('redholdend', 'red hold end');
					animation.addByPrefix('blueholdend', 'blue hold end');
	
					animation.addByPrefix('purplehold', 'purple hold piece');
					animation.addByPrefix('greenhold', 'green hold piece');
					animation.addByPrefix('redhold', 'red hold piece');
					animation.addByPrefix('bluehold', 'blue hold piece');
	
					setGraphicSize(Std.int(width * 0.7));
					updateHitbox();
					antialiasing = true;
					case 'Tabi':
						frames = Paths.getSparrowAtlas('Notes/EX_NOTE_assets');
		
						animation.addByPrefix('greenScroll', 'green0');
						animation.addByPrefix('redScroll', 'red0');
						animation.addByPrefix('blueScroll', 'blue0');
						animation.addByPrefix('purpleScroll', 'purple0');
		
						animation.addByPrefix('purpleholdend', 'pruple end hold');
						animation.addByPrefix('greenholdend', 'green hold end');
						animation.addByPrefix('redholdend', 'red hold end');
						animation.addByPrefix('blueholdend', 'blue hold end');
		
						animation.addByPrefix('purplehold', 'purple hold piece');
						animation.addByPrefix('greenhold', 'green hold piece');
						animation.addByPrefix('redhold', 'red hold piece');
						animation.addByPrefix('bluehold', 'blue hold piece');
		
						setGraphicSize(Std.int(width * 0.7));
						updateHitbox();
						antialiasing = true;
						case 'Masses':
						frames = Paths.getSparrowAtlas('Notes/Masses_NOTE_assets');
		
						animation.addByPrefix('greenScroll', 'green0');
						animation.addByPrefix('redScroll', 'red0');
						animation.addByPrefix('blueScroll', 'blue0');
						animation.addByPrefix('purpleScroll', 'purple0');
		
						animation.addByPrefix('purpleholdend', 'pruple end hold');
						animation.addByPrefix('greenholdend', 'green hold end');
						animation.addByPrefix('redholdend', 'red hold end');
						animation.addByPrefix('blueholdend', 'blue hold end');
		
						animation.addByPrefix('purplehold', 'purple hold piece');
						animation.addByPrefix('greenhold', 'green hold piece');
						animation.addByPrefix('redhold', 'red hold piece');
						animation.addByPrefix('bluehold', 'blue hold piece');
		
						setGraphicSize(Std.int(width * 0.7));
						updateHitbox();
						antialiasing = true;
						case 'Entity':
							frames = Paths.getSparrowAtlas('Notes/Entity_NOTE_assets');
			
							animation.addByPrefix('greenScroll', 'green0');
							animation.addByPrefix('redScroll', 'red0');
							animation.addByPrefix('blueScroll', 'blue0');
							animation.addByPrefix('purpleScroll', 'purple0');
			
							animation.addByPrefix('purpleholdend', 'pruple end hold');
							animation.addByPrefix('greenholdend', 'green hold end');
							animation.addByPrefix('redholdend', 'red hold end');
							animation.addByPrefix('blueholdend', 'blue hold end');
			
							animation.addByPrefix('purplehold', 'purple hold piece');
							animation.addByPrefix('greenhold', 'green hold piece');
							animation.addByPrefix('redhold', 'red hold piece');
							animation.addByPrefix('bluehold', 'blue hold piece');
			
							setGraphicSize(Std.int(width * 0.7));
							updateHitbox();
							antialiasing = true;
							case 'Washi':
								frames = Paths.getSparrowAtlas('Notes/Washi_NOTE_assets');
				
								animation.addByPrefix('greenScroll', 'green0');
								animation.addByPrefix('redScroll', 'red0');
								animation.addByPrefix('blueScroll', 'blue0');
								animation.addByPrefix('purpleScroll', 'purple0');
				
								animation.addByPrefix('purpleholdend', 'pruple end hold');
								animation.addByPrefix('greenholdend', 'green hold end');
								animation.addByPrefix('redholdend', 'red hold end');
								animation.addByPrefix('blueholdend', 'blue hold end');
				
								animation.addByPrefix('purplehold', 'purple hold piece');
								animation.addByPrefix('greenhold', 'green hold piece');
								animation.addByPrefix('redhold', 'red hold piece');
								animation.addByPrefix('bluehold', 'blue hold piece');
				
								setGraphicSize(Std.int(width * 0.7));
								updateHitbox();
								antialiasing = true;
								case 'Pico':
									frames = Paths.getSparrowAtlas('Notes/Pico_School_NOTE_assets');
					
									animation.addByPrefix('greenScroll', 'green0');
									animation.addByPrefix('redScroll', 'red0');
									animation.addByPrefix('blueScroll', 'blue0');
									animation.addByPrefix('purpleScroll', 'purple0');
					
									animation.addByPrefix('purpleholdend', 'pruple end hold');
									animation.addByPrefix('greenholdend', 'green hold end');
									animation.addByPrefix('redholdend', 'red hold end');
									animation.addByPrefix('blueholdend', 'blue hold end');
					
									animation.addByPrefix('purplehold', 'purple hold piece');
									animation.addByPrefix('greenhold', 'green hold piece');
									animation.addByPrefix('redhold', 'red hold piece');
									animation.addByPrefix('bluehold', 'blue hold piece');
					
									setGraphicSize(Std.int(width * 0.7));
									updateHitbox();
									antialiasing = true;
									case 'Kapi':
										frames = Paths.getSparrowAtlas('Notes/Arcade_NOTE_assets');
						
										animation.addByPrefix('greenScroll', 'green0');
										animation.addByPrefix('redScroll', 'red0');
										animation.addByPrefix('blueScroll', 'blue0');
										animation.addByPrefix('purpleScroll', 'purple0');
						
										animation.addByPrefix('purpleholdend', 'pruple end hold');
										animation.addByPrefix('greenholdend', 'green hold end');
										animation.addByPrefix('redholdend', 'red hold end');
										animation.addByPrefix('blueholdend', 'blue hold end');
						
										animation.addByPrefix('purplehold', 'purple hold piece');
										animation.addByPrefix('greenhold', 'green hold piece');
										animation.addByPrefix('redhold', 'red hold piece');
										animation.addByPrefix('bluehold', 'blue hold piece');
						
										setGraphicSize(Std.int(width * 0.7));
										updateHitbox();
										antialiasing = true;
										case 'Taki':
											frames = Paths.getSparrowAtlas('Notes/Taki_NOTE_assets');
							
											animation.addByPrefix('greenScroll', 'green0');
											animation.addByPrefix('redScroll', 'red0');
											animation.addByPrefix('blueScroll', 'blue0');
											animation.addByPrefix('purpleScroll', 'purple0');
							
											animation.addByPrefix('purpleholdend', 'pruple end hold');
											animation.addByPrefix('greenholdend', 'green hold end');
											animation.addByPrefix('redholdend', 'red hold end');
											animation.addByPrefix('blueholdend', 'blue hold end');
							
											animation.addByPrefix('purplehold', 'purple hold piece');
											animation.addByPrefix('greenhold', 'green hold piece');
											animation.addByPrefix('redhold', 'red hold piece');
											animation.addByPrefix('bluehold', 'blue hold piece');
							
											setGraphicSize(Std.int(width * 0.7));
											updateHitbox();
											antialiasing = true;
											case 'Retro':
											frames = Paths.getSparrowAtlas('Notes/NOTE_assets_Retro');
							
											animation.addByPrefix('greenScroll', 'green0');
											animation.addByPrefix('redScroll', 'red0');
											animation.addByPrefix('blueScroll', 'blue0');
											animation.addByPrefix('purpleScroll', 'purple0');
							
											animation.addByPrefix('purpleholdend', 'pruple end hold');
											animation.addByPrefix('greenholdend', 'green hold end');
											animation.addByPrefix('redholdend', 'red hold end');
											animation.addByPrefix('blueholdend', 'blue hold end');
							
											animation.addByPrefix('purplehold', 'purple hold piece');
											animation.addByPrefix('greenhold', 'green hold piece');
											animation.addByPrefix('redhold', 'red hold piece');
											animation.addByPrefix('bluehold', 'blue hold piece');
							
											setGraphicSize(Std.int(width * 0.7));
											updateHitbox();
											antialiasing = true;
											case 'Ace':
												frames = Paths.getSparrowAtlas('Notes/NOTE_assets_Ace');
								
												animation.addByPrefix('greenScroll', 'green0');
												animation.addByPrefix('redScroll', 'red0');
												animation.addByPrefix('blueScroll', 'blue0');
												animation.addByPrefix('purpleScroll', 'purple0');
								
												animation.addByPrefix('purpleholdend', 'pruple end hold');
												animation.addByPrefix('greenholdend', 'green hold end');
												animation.addByPrefix('redholdend', 'red hold end');
												animation.addByPrefix('blueholdend', 'blue hold end');
								
												animation.addByPrefix('purplehold', 'purple hold piece');
												animation.addByPrefix('greenhold', 'green hold piece');
												animation.addByPrefix('redhold', 'red hold piece');
												animation.addByPrefix('bluehold', 'blue hold piece');
								
												setGraphicSize(Std.int(width * 0.7));
												updateHitbox();
												antialiasing = true;
												case 'Hololive':
													frames = Paths.getSparrowAtlas('Notes/Hololive_NOTE_assets');
									
													animation.addByPrefix('greenScroll', 'green0');
													animation.addByPrefix('redScroll', 'red0');
													animation.addByPrefix('blueScroll', 'blue0');
													animation.addByPrefix('purpleScroll', 'purple0');
									
													animation.addByPrefix('purpleholdend', 'pruple end hold');
													animation.addByPrefix('greenholdend', 'green hold end');
													animation.addByPrefix('redholdend', 'red hold end');
													animation.addByPrefix('blueholdend', 'blue hold end');
									
													animation.addByPrefix('purplehold', 'purple hold piece');
													animation.addByPrefix('greenhold', 'green hold piece');
													animation.addByPrefix('redhold', 'red hold piece');
													animation.addByPrefix('bluehold', 'blue hold piece');
									
													setGraphicSize(Std.int(width * 0.7));
													updateHitbox();
													antialiasing = true;
													case 'ElicrackNotes':
														frames = Paths.getSparrowAtlas('Notes/Elicrack_NOTE_assets');
										
														animation.addByPrefix('greenScroll', 'green0');
														animation.addByPrefix('redScroll', 'red0');
														animation.addByPrefix('blueScroll', 'blue0');
														animation.addByPrefix('purpleScroll', 'purple0');
										
														animation.addByPrefix('purpleholdend', 'pruple end hold');
														animation.addByPrefix('greenholdend', 'green hold end');
														animation.addByPrefix('redholdend', 'red hold end');
														animation.addByPrefix('blueholdend', 'blue hold end');
										
														animation.addByPrefix('purplehold', 'purple hold piece');
														animation.addByPrefix('greenhold', 'green hold piece');
														animation.addByPrefix('redhold', 'red hold piece');
														animation.addByPrefix('bluehold', 'blue hold piece');
										
														setGraphicSize(Std.int(width * 0.7));
														updateHitbox();
														antialiasing = true;
														case 'DoggyNotes':
														frames = Paths.getSparrowAtlas('Notes/Doggy_NOTE_assets');
										
														animation.addByPrefix('greenScroll', 'green0');
														animation.addByPrefix('redScroll', 'red0');
														animation.addByPrefix('blueScroll', 'blue0');
														animation.addByPrefix('purpleScroll', 'purple0');
										
														animation.addByPrefix('purpleholdend', 'pruple end hold');
														animation.addByPrefix('greenholdend', 'green hold end');
														animation.addByPrefix('redholdend', 'red hold end');
														animation.addByPrefix('blueholdend', 'blue hold end');
										
														animation.addByPrefix('purplehold', 'purple hold piece');
														animation.addByPrefix('greenhold', 'green hold piece');
														animation.addByPrefix('redhold', 'red hold piece');
														animation.addByPrefix('bluehold', 'blue hold piece');
										
														setGraphicSize(Std.int(width * 0.7));
														updateHitbox();
														antialiasing = true;
														case 'FunNotes':
															frames = Paths.getSparrowAtlas('Notes/Majic_NOTE_assets');
											
															animation.addByPrefix('greenScroll', 'green0');
															animation.addByPrefix('redScroll', 'red0');
															animation.addByPrefix('blueScroll', 'blue0');
															animation.addByPrefix('purpleScroll', 'purple0');
											
															animation.addByPrefix('purpleholdend', 'pruple end hold');
															animation.addByPrefix('greenholdend', 'green hold end');
															animation.addByPrefix('redholdend', 'red hold end');
															animation.addByPrefix('blueholdend', 'blue hold end');
											
															animation.addByPrefix('purplehold', 'purple hold piece');
															animation.addByPrefix('greenhold', 'green hold piece');
															animation.addByPrefix('redhold', 'red hold piece');
															animation.addByPrefix('bluehold', 'blue hold piece');
											
															setGraphicSize(Std.int(width * 0.7));
															updateHitbox();
															antialiasing = true;
			default:
				frames = Paths.getSparrowAtlas('NOTE_assets');

				animation.addByPrefix('greenScroll', 'green0');
				animation.addByPrefix('redScroll', 'red0');
				animation.addByPrefix('blueScroll', 'blue0');
				animation.addByPrefix('purpleScroll', 'purple0');

				animation.addByPrefix('purpleholdend', 'pruple end hold');
				animation.addByPrefix('greenholdend', 'green hold end');
				animation.addByPrefix('redholdend', 'red hold end');
				animation.addByPrefix('blueholdend', 'blue hold end');

				animation.addByPrefix('purplehold', 'purple hold piece');
				animation.addByPrefix('greenhold', 'green hold piece');
				animation.addByPrefix('redhold', 'red hold piece');
				animation.addByPrefix('bluehold', 'blue hold piece');

				setGraphicSize(Std.int(width * 0.7));
				updateHitbox();
				antialiasing = true;
		}

		switch (noteData)
		{
			case 0:
				x += swagWidth * 0;
				animation.play('purpleScroll');
			case 1:
				x += swagWidth * 1;
				animation.play('blueScroll');
			case 2:
				x += swagWidth * 2;
				animation.play('greenScroll');
			case 3:
				x += swagWidth * 3;
				animation.play('redScroll');
		}

		// trace(prevNote);

		// we make sure its downscroll and its a SUSTAIN NOTE (aka a trail, not a note)
		// and flip it so it doesn't look weird.
		// THIS DOESN'T FUCKING FLIP THE NOTE, CONTRIBUTERS DON'T JUST COMMENT THIS OUT JESUS
		if (FlxG.save.data.downscroll && isSustainNote) 
			flipY = true;

		if (isSustainNote && prevNote != null)
		{
			noteScore * 0.2;
			alpha = 0.6;

			x += width / 2;

			switch (noteData)
			{
				case 2:
					animation.play('greenholdend');
				case 3:
					animation.play('redholdend');
				case 1:
					animation.play('blueholdend');
				case 0:
					animation.play('purpleholdend');
			}

			updateHitbox();

			x -= width / 2;

			if (PlayState.curStage.startsWith('school'))
				x += 30;

			if (prevNote.isSustainNote)
			{
				switch (prevNote.noteData)
				{
					case 0:
						prevNote.animation.play('purplehold');
					case 1:
						prevNote.animation.play('bluehold');
					case 2:
						prevNote.animation.play('greenhold');
					case 3:
						prevNote.animation.play('redhold');
				}


				if(FlxG.save.data.scrollSpeed != 1)
					prevNote.scale.y *= Conductor.stepCrochet / 100 * 1.5 * FlxG.save.data.scrollSpeed;
				else
					prevNote.scale.y *= Conductor.stepCrochet / 100 * 1.5 * PlayState.SONG.speed;
				prevNote.updateHitbox();
				// prevNote.setGraphicSize();
			}
		}
		this.estilo = estilo;
	}//fin de la funcion setGraphic
}

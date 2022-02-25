package;

import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ["Hard", "Master"];

	public static function difficultyFromInt(difficulty:Int):String
	{
		return difficultyArray[difficulty];
	}

	public static function difficultyString():String
		{
			return difficultyArray[PlayState.storyDifficulty].toUpperCase();
		}

	public static function coolTextFile(path:String):Array<String>
		{
			var daList:Array<String> = Assets.getText(path).trim().split('\n');
	
			for (i in 0...daList.length)
			{
				daList[i] = daList[i].trim();
			}
	
			return daList;
		}
	
	inline public static function boundTo(value:Float, min:Float, max:Float):Float {
			return Math.max(min, Math.min(max, value));
		}
	
	public static function coolStringFile(path:String):Array<String>
		{
			var daList:Array<String> = path.trim().split('\n');
	
			for (i in 0...daList.length)
			{
				daList[i] = daList[i].trim();
			}
	
			return daList;
		}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}

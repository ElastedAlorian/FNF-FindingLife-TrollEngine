package;

import flixel.FlxG;

class Highscore
{
	#if (haxe >= "4.0.0")
	public static var songScores:Map<String, Int> = new Map();
	#else
	public static var songScores:Map<String, Int> = new Map<String, Int>();
	#end


	public static function saveScore(song:String, score:Int = 0, ?diff:Int = 0):Void
	{
		var daSong:String = formatSong(song, diff);


		#if newgrounds
		NGio.postScore(score, song);
		#end


		if (songScores.exists(daSong))
		{
			if (songScores.get(daSong) < score)
				setScore(daSong, score);
		}
		else
			setScore(daSong, score);
	}

	public static function saveWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0):Void
	{

		#if newgrounds
		NGio.postScore(score, "Week " + week);
		#end


		var daWeek:String = formatSong('week' + week, diff);

		if (songScores.exists(daWeek))
		{
			if (songScores.get(daWeek) < score)
				setScore(daWeek, score);
		}
		else
			setScore(daWeek, score);
	}

	/**
	 * YOU SHOULD FORMAT SONG WITH formatSong() BEFORE TOSSING IN SONG VARIABLE
	 */
	static function setScore(song:String, score:Int):Void
	{
		// Reminder that I don't need to format this song, it should come formatted!
		songScores.set(song, score);
		FlxG.save.data.songScores = songScores;
		FlxG.save.flush();
	}

	public static function formatSong(song:String, diff:Int):String
	{
		var daSong:String = song;

		if (diff == 0)
			daSong += '-easy';
		else if (diff == 2)
			daSong += '-hard';

		return daSong;
		trace("formatSong: " + daSong);
	}

	public static function getScore(song:String, diff:Int):Int
	{
		if (!songScores.exists(formatSong(song, diff)))
			setScore(formatSong(song, diff), 0);

		trace("formatSong " + formatSong(song, diff));
		return songScores.get(formatSong(song, diff));
	}

	public static function getWeekScore(week:Int, diff:Int):Int
	{
		if (!songScores.exists(formatSong('week' + week, diff)))
			setScore(formatSong('week' + week, diff), 0);

		trace("week score: " + formatSong('week' + week, diff));
		return songScores.get(formatSong('week' + week, diff));
	}

	// Potentially from legacy FNF below.

	/*public static function getScore(song:String, diff:Int):Array<Int>
	{
		if (!songScores.exists(formatSong(song, diff)))
			setScore(formatSong(song, diff), 0, 0);
		var O:Dynamic = songScores.get(formatSong(song, diff));
		if(Std.isOfType(O, Array))
			return O;
		else {
			setScore(formatSong(song, diff), O, 0);
			return [O, 0];
		}
	}

	public static function getWeekScore(week:Int, diff:Int):Array<Int>
	{
		if (!songScores.exists(formatSong('week' + week, diff)))
			setScore(formatSong('week' + week, diff), 0, 0);

		var O:Dynamic = songScores.get(formatSong('week' + week, diff));
		if(Std.isOfType(O, Array))
			return O;
		else {
			setScore(formatSong('week' + week, diff), O, 0);
			return [O, 0];
		}
	}*/

	public static function load():Void
	{
		if (FlxG.save.data.songScores != null)
		{
			songScores = FlxG.save.data.songScores;
		}
	}
}

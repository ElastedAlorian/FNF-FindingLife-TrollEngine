package;

import flixel.FlxG;
import flixel.FlxSprite;
using StringTools; // Thank you, Haxe Discord. https://canary.discord.com/channels/162395145352904705/162395145352904705/1571241776767828068

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	//var modifier:String;
	public var onetwothreefour:String = "icons/icon-face";
	public var isPixel:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		if (char  == "bf-pixel" || char == "spirit" || char == "senpai" || char == "pico-pixel"){
		// It should be checking to see if the character is the values instead of the whole string, whoops!
			isPixel = true;
			// Doing ->  if ( onetwothreefour.contains("pixel") ... <- lead me with "Bool sould be Int" for *some* reason.
					// I think it was since I was doing | instead of ||, oh my days...
		}

		onetwothreefour = Paths.image("icons/icon-"+char);

			loadGraphic(onetwothreefour, true, isPixel ? 32 : 150, isPixel ? 32 : 150);
				antialiasing != isPixel; // If it's a pixel icon, then it is the inverse of that, so no anti-aliasing.
				if (isPixel == true){ scale.x = 6; scale.y = 6; } // Move scaling to one line to take up less space.

		//antialiasing = true;
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);

		scrollFactor.set();
	}
	public function changeIcon(char:String, isPlayer:Bool = false){

		if (char  == "bf-pixel" || char == "spirit" || char == "senpai" || char == "pico-pixel"){
			isPixel = true;
		}

		onetwothreefour = Paths.image("icons/icon-"+char);

			loadGraphic(onetwothreefour, true, isPixel ? 32 : 150, isPixel ? 32 : 150);
				antialiasing != isPixel;
				if (isPixel == true){ scale.x = 6; scale.y = 6; }

		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}

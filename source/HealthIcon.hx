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

		onetwothreefour = Paths.image("icons/icon-"+char);
		/*if ( onetwothreefour.contains("pixel") | onetwothreefour.contains("senpai") | onetwothreefour.contains("spirit") ){
				//if (char.indexOf("pixel" | "senpai" | "spirit") = null){
				isPixel = true;
		}*/
		if (onetwothreefour == "bf-pixel" || onetwothreefour == "spirit" || onetwothreefour == "senpai" || onetwothreefour == "pico-pixel"){
			isPixel = true; // Doing this if statement since StringTools wasn't working for me.
			// Doing ->  if ( onetwothreefour.contains("pixel") ... <- lead me with "Bool sould be Int" for *some* reason.
					// I think it was since I was doing | instead of ||, oh my days...
		}
		loadGraphic(onetwothreefour, true, isPixel ? 32 : 150, isPixel ? 32 : 150);
		antialiasing != isPixel;
		if (isPixel == true){
			scale.x = 6;
			scale.y = 6;
		}

		antialiasing = true;
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}
	public function changeIcon(char:String, isPlayer:Bool = false){

//	var isPixel:Bool = false;

		if (onetwothreefour == "bf-pixel" || onetwothreefour == "spirit" || onetwothreefour == "senpai" || onetwothreefour == "pico-pixel"){
			isPixel = true; // Doing this if statement since StringTools wasn't working for me.
			// Doing ->  if ( onetwothreefour.contains("pixel") ... <- lead me with "Bool sould be Int" for *some* reason.
		}

		loadGraphic(onetwothreefour, true, isPixel ? 32 : 150, isPixel ? 32 : 150);
		antialiasing != isPixel;
		if (isPixel == true){
			scale.x = 6;
			scale.y = 6;
		}
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

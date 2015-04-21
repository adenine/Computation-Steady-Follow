package;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

/*
 *  COMPUTATION - Steady Follow Example
 *  
 *  SUMMARY: Draw a rectangle which follows the mouse around at a steady rate.
 *
 *  DESCRIPTION: Creating a simple shape that follows the mouse around reveals 
 *  many details about programming motion and the relationship of visual intent 
 *  and code. People usually begin by dividing the distance, but that will cause
 *  the object to move and slow down as it approaches it's goal. You can instead
 *  use some Trigonomtry to calculate a stead path.
 * 
 *  Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php 
 */

class Main extends Sprite {
	
	var posX:Float;
	var posY:Float;
	var moveX:Float;
	var moveY:Float;


	public function new () {
		
		super ();
		
    initialize ();
    construct ();
    
    resize (stage.stageWidth, stage.stageHeight);
    this.addEventListener (Event.RESIZE, stage_onResize);
    this.addEventListener (Event.ENTER_FRAME, update);


//   if (c < speed) {
//     posX = mouseX;
//     posY = mouseY;
//   } else {
//     float rads = atan2(b,a);
//     posX += cos(rads) * speed;
//     posY += sin(rads) * speed;
//   }

//   rectMode(CENTER); // this sets the reference point to the center of the rectangle
//   rect(posX, posY, 10, 10);
//   line(mouseX, mouseY, posX, posY);
//   ellipse(posX, mouseY, 5, 5);
//   ellipse(mouseX, posY, 5, 5);
		
		
	}
	
  private function construct ():Void {

  }
	
  private function initialize ():Void {

  }

  private function resize (newWidth:Int, newHeight:Int):Void {

  }

  private function stage_onResize (event:Event):Void {
    
    resize (stage.stageWidth, stage.stageHeight);
    
  }

  private function update (event:Event):Void {
    //trace("we are now running");

    //var a:Float =  event.target.stage.mouseX - posX;
    //var b:Float =  event.target.stage.mouseY - posY;

    //var c:Float = Math.sqrt((a*a)+(b*b));
    draw();
  }

  private function draw () {
    this.graphics.clear();
    this.graphics.beginFill(0x339933);
    this.graphics.drawEllipse(10,10,100,100);
    this.graphics.endFill();

  }
}





// void setup() {
//    background(122); 
//    size(800,400);
//    smooth();
//    posX = width/2; //set a start position for the tiny rectangle
//    posY = height/2;
// }

// void draw() {
//   background(122);
//   stroke(255);
//   noFill();
  
  // FIRST WAY MOST PEOPLE TRY THIS...
  // // Look at the distance between the mouse and the current position and divide it
  // moveX = (mouseX - posX) / delay;
  // moveY = (mouseY - posY) / delay;
  
  // // move along that segment
  // posX = posX + moveX;
  // posY = posY + moveY;
  // // BUT THIS WON'T BE A STEADY RATE! SO WE NEED SOME TRIG...
    
  // Great reference - http://processing.org/learning/trig/
  // Pythagorean Theorem - http://en.wikipedia.org/wiki/Pythagorean_theorem
  //   |\
  //   | \             Then you can use this theorem to find out what the
  // 3 |  \ c          third side is.
  //   |   \           3*3 + 4*4 = 9 + 16 = 25 = 5*5, so c=5
  //   |____\
  //      4
  // pow(a,2) + pow(b,2) = sqrt(c)  

//   float a = mouseX - posX;
//   float b = mouseY - posY;
//   float c = sqrt((a*a)+(b*b));

//   if (c < speed) {
//     posX = mouseX;
//     posY = mouseY;
//   } else {
//     float rads = atan2(b,a);
//     posX += cos(rads) * speed;
//     posY += sin(rads) * speed;
//   }

//   rectMode(CENTER); // this sets the reference point to the center of the rectangle
//   rect(posX, posY, 10, 10);
//   line(mouseX, mouseY, posX, posY);
//   ellipse(posX, mouseY, 5, 5);
//   ellipse(mouseX, posY, 5, 5);
// }

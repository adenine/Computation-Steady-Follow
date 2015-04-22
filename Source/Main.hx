package;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Shape;

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
  var delay:Float;

	public function new () {
		
		super ();
		setup ();

    delay = 2;
    
    this.addEventListener( flash.events.MouseEvent.MOUSE_MOVE, onmousemove );
    this.addEventListener (Event.ENTER_FRAME, draw);
		
	}
	
  // App functions
	
  private function setup ():Void {
    posX = 100; //set a start position for the tiny rectangle
    posY = 100;
  }

  private function draw (e:Event):Void {
    this.graphics.clear();

    //trace(openfl.display.Stage.posX);

    var myShape:Shape = new Shape();
    myShape.graphics.beginFill(0x339933);
    myShape.graphics.drawEllipse(posX,posY,10,10);
    myShape.graphics.endFill();
    this.addChild(myShape);
  }

  // Event Handling
  function onmousemove(e:MouseEvent) {
      //system.pos.setTo(e.stageX, e.stageY);
      trace(e.stageX);

      moveX = (e.stageX - posX) / delay;
      moveY = (e.stageY - posY) / delay;
      
      // move along that segment
      posX = posX + moveX;
      posY = posY + moveY;
      //trace("Updated position ");
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

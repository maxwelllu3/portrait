PImage source;  

void setup() {

  // create the canvas
  // WIDTH,HEIGHT
  size(550, 550); 

  // make the backgound white
  background(255);

  // load image from the folder
  source = loadImage("maxwell.JPG");
  source.loadPixels();

  // loop from first pixel to final pixel, image width * height - 1 ex. 550*550=302500,-1=302499
  for (int position = 0; position <= 302499; position += 1) {

    // get brightness of current pixel
    float b = brightness(source.pixels[position]);

    // change brightness value (range of 0 to 255) into a diameter of range 1 to 10 
    float diameter = map(b, 255, 0, 1, 10);

    // get the pixel's current position using integer arithmetic, see: http://russellgordon.ca/lcs/ics3u/integer_arithmetic.jpg
    int x = position % width; 
    int y = position / width; 


    if ((x > 0) && (y > 0) && (y % 9 == 0) && (x % 9 == 0)) {
      // draw an ellipse at position of current pixel
      ellipse(x, y, diameter, diameter);
    }
  }
}

void draw() {

  // stop the loop
  noLoop();
}

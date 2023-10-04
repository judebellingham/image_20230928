/* Program Notes
 - Finish Nightmode: medium and difficult
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage picBackground;
Boolean nightmode=false; //Note: clock can turn on automatically
Boolean brighnessControl=false; //Note: ARROWS
int brightnessNumber=255; //Range:1-255
//
void setup() {
  fullScreen(); //displayWidth, displayHeight
  size( 500, 100 ); //Landscape
  // Copy Display Orientation
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("../images used/eid.jpg");
  //
  //DIVs
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  tint(255, 128); //Grey Scale: 1/2 tint (i.e 128/256+1/2)
  tint( 64, 64, 40); //Grey Scale: 1/2 tint (i.e 128/256+1/2)
  image(picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
} //End setup
//
void draw() {
  background(128); //built in BUG, 1 pixel
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  //if ( [BRIGHTNESS , see keyPressed] ) tint(255, 128); //Gray Scale: 1/2 tint (i.e 128/256+1/2)
  if ( brightnessControl==true ) tint (255, brightnessNumber) //Gray Scale 1/2 tint 
  //if ( nightmode==true ) tint( 64, 64, 40); //Grey Scale: 1/2 tint (i.e 128/256+1/2) (i.e 128/256+1/2)
  if ( nightmode==true ) {
    tint ( 64, 64, 40 ) ;
    println(nightmode);
  } else {
    noTint(); //see Processing DOC ( 255, 255, 255 );
    image(picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  }
} //End draw
//
void keyPressed() {
  //Brightness
  //
  if (key =='n' || key=='N' ) {
    if ( nightmode==true ) { //Nightmode, basic control is Boolean
      nightmode = false;
    } else {
      nightmode = true;
    }
  }
  //Brightness: ARROWS activate brightnessControl, never off
  //NOTE: Nightmode does not turn off
  if ( key==CODED && keyCode==UP || keyCode==DOWN ) { //Brightness keybind
   brightnessControl = true;
   if ( key==CODED && keyCode==UP ) brightnessNumber++ ;
   if ( key==CODED && keyCode==DOWN ) ;
    //CONTINUE HERE with brightness toggles
  }
} //End keyPressed
//
void mousePressed() {
}// End mousePressed
//
// End MAIN Program

/* Program Notes
 - Finish Nightmode: medium and difficult
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float eidImageXrect, eidImageYrect, eidImagewidthRect, eidImageHeightRect, eidImagewidth, eidImageHeight;
float paradiseXrect, paradiseYrect, paradiseWidthRect, paradiseHeightRect, paradiseWidth, paradiseHeight;
PImage picBackground, eidForeground, paradisePortrait;
Boolean nightmode=false; //Note: clock will automatically turn on
Boolean brightnessControl=false; //Note: ARROWS
int brightnessNumber=150; //Range:1-255
//
void setup() {
  //fullScreen(); //displayWidth, displayHeight
  size( 900, 500 ); //Landscape
  // Copy Display Orientation
  appWidth = width;
  appHeight = height;
  //
  //Population
  //DI rect() Variable Population
  //Original Aspect Ratios of Images to Change
  //Compare the side lenghts to see which is bigger
  //"Compress" the biggest side into the rect()
  //Multiply the Image's Aspect Ratio to the smaller side
  //nightmode=false;
  int hourNightmode = hour(); //24-hour clock
  println(hourNightmode);
  if ( hourNightmode>17 ) {
    nightmode=true;
  } else if ( hourNightmode<05 ) {
    nightmode=true;
  } else {
    nightmode=false;
  }
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  eidImageXrect = appWidth*1/14;
  eidImageYrect = appHeight*1/8;
  eidImagewidthRect = appWidth*1/7; // 2/14
  eidImageHeightRect = appHeight*2.2574;
  paradiseXrect = eidImageXrect;
  paradiseYrect = appHeight*5/8;
  paradiseWidthRect = eidImagewidth;
  paradiseHeightRect = eidImageHeightRect;
  //Aspect Ratio Calculations
  //Determine Aspect Ratio
  //Compare dimension to get larger dimension
  //Calcuate smaller dimension
  //Rewrite variable based on rect() vars
  //Aspect Ratio Change
  eidImageXrectWidth = 255; //hardcode of image file
  eidImageHeight = 255; //from Image File
  paradiseWidth = 312; // from Image File
  paradiseHeight = 161; //from Image File
  float aspectRatio = 0.0; //Local Variable
  //float rectDimensionMemory = 0.0; //Assigned ZERO b/c IF'
  if ( eidImageWidth >= eidImageHeight ) { //EIDIMAGE Image if landscape
    //Comparison Verification
    aspectRatio = eidImageHeight / eidImageWidth; // smaller/large=0 if int, use casting
    println( "eidIMage is landscpae" );
    aspectRatio = eidImageHeight / eidImageWidth; // smaller/large=0 if int,use casting
    //memory of smaler side
    eidImageWidth = eidImageHeight;
    eidImageHeight = aspectRatio * eidImageWidth;
    if ( eidImageHeight > eidImageHeightRect ) { //ERROR Catch is eidImageHeight > eidImageHeightRect
      println("ERROR: Aspect Calculation Too Big!", "\tCalculated Image Height:", paradiseHeight, paradiseHeightRect);
    }
  } else { //eidImage if Portrait }
    //Comparison Verification
    println("eidIMage is portrait");
    //Repeat Aspect Ratio
    //Comparison Verification
    aspectRatio = eidImageHeight / eidImageWidth; // smaller/large=0 if int,use casting
    //memory of smaller side
    eidImageHeight = eidImageHeightRect;
    eidImageWidth = aspectRatio * eidImageHeight;
    if ( eidImageHeight > eidImageHeightRect ) { //ERROR Catch is eidImageHeight > eidImageHeightRect
      println("ERROR: Aspect Calculation Too Big");
    }
  }//End IF;
  if ( paradiseWidth >= paradiseHeight ) { //paradise Image if Landscape
    //Comparison Verification
    println("paradise is Landscape");
    //Repeat Aspect Ratio
    aspectRatio = paradiseHeight / paradiseWidth; // smaller/large=0 if int, use casting
    //memory of smaller side
    paradiseWidth = paradiseWidthRect;
    paradiseHeight = aspectRatio * paradiseWidth;
    if ( paradiseHeight > paradiseHeightRect ) { //ERROR Catch is bikeHeight > bikeHeightRect
      println("ERROR: Aspect Calcualtion Too Big");
    }
  } else { //paradise Image if Portrait
    //Comparison Verification
    println("paradise is Portrait");
    //Repeat Aspect Ratio
    aspectRatio = paradiseWidth / paradiseHeight; // smaller/large=0 if int, use casting
    //memory of smaller side
    paradiseHeight = paradiseHeightRect;
    paradiseWidth = aspectRatio * paradiseHeight;
    if ( paradiseWidth > paradiseWidthRect ) { //ERROR Catch is paradiseHeightRect > paradiseHeight
      println("ERROR: Aspect Calcualtion Too Big");
    }
  } //End IF
  //Error Check of Smaller Dimension
  //
  //concentration of pathways;
  String up = "..";
  String open = "/";
  String imagesPath = up + open;
  String portraitImage = "imagesUsed/portrait/";
  String imagesUsed = "imagesUsed";
  String eid = imagesUsed;
  String eidImage = "eidimage.jpg";
  String paradiseImage = "paradise.jpg";
  picBackground = loadImage( imagesPath + imagesUsed + "/eid.jpg");
  eidForeground = loadImage ( imagesPath + imagesUsed + eidImage  );
  paradisePortrait = loadImage( imagesPath + imagesUsed + paradiseImage );
  //
  //DIVs
  //rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //rect(eidImageX, eidImageY, eidImagewidth, eidImageHeight); //eidimage
  //rect (paradiseX, paradise,Y paradisewidth, paradiseHeight);
  //
}//End setup
//
void draw() {
  //background(255); //built in BUG, 1 pixel
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  println(brightnessControl, nightmode, brightnessNumber);
  if ( brightnessControl==true )
  {
    //Gray Scale: 1/2 tint (i.e 128/256=1/2)
    if ( brightnessNumber<1 ) {
      brightnessNumber=1;
    } else if ( brightnessNumber>255 )
      brightnessNumber=255;
    else {
      //Empty ELSE
    }
    tint (255, brightnessNumber);
    //println(brightnessNumber);
  }
  //if ( nightmode==true ) tint ( 64, 64, 40 ); //Gray Scale: 1/2 tint (i.e 128/256=1/2)
  if ( nightmode==true ) {
    //tint ( 64, 64, 40 );
    //println(nightmode);
  } else {
    //noTint(); //See Processing DOC
    //println(nightmode);
  }
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  image( eidForeground, eidImageXrect, eidImageYrect, eidImagewidth, eidImageHeight ); //eid image
  image( paradisePortrait, paradiseXrect, paradiseYrect, paradiseWidth, paradiseHeight ); //paradise image
} //End draw
//
void keyPressed() {
  if ( key=='n' || key=='N' ) { //Nightmode, basic control is Boolean
    if ( nightmode==true ) {
      nightmode = false;
    } else {
      nightmode = true;
    }
  }
  //Brightness: ARROWS activate brightnessControl, never off
  //NOTE: Nightmode does turn off
  if ( key==CODED && keyCode==UP || keyCode==DOWN ) { //Brightness keybind
    brightnessControl = true;
    if ( key==CODED && keyCode==UP ) brightnessNumber++ ;
    if ( key==CODED && keyCode==DOWN ) brightnessNumber-- ;
    //CONTINUE HERE with brightness toggles
  }
  //
  println(brightnessNumber);
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End MAIN Program

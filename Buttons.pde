void displayButton(){
  fill(255, 150); // TODOmake transparent
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  ellipse(0.5*width, height*(3/4), width*(1/6), width*(1/6));
 
PVector circleLocation = new PVector (0.5*width- mouseX, height*(3/4)- mouseY);

 circleLocation.limit(width*(1/6));
  fill(220);
  ellipse(circleLocation.x, circleLocation.y, width*(1/12), width*(1/12));
}

PVector direction(){
  PVector temp = new PVector (0.5*width- mouseX, height*(3/4)- mouseY);
=======
=======
>>>>>>> Stashed changes
ellipse(width/2,height*3/4,width/3,width/3);
 
PVector circleLocation = new PVector (width/2- mouseX, height*3/4- mouseY);
 circleLocation.limit(width/6);
 circleLocation = PVector.mult(circleLocation,-1);
  fill(220);
  ellipse(circleLocation.x + width/2 , circleLocation.y + height*3/4, width/6, width/6);

float  x = width*5/7;
float y = height*1/14;
float xsize = width/15;
float ysize = width/15;

//mute
<<<<<<< Updated upstream
 fill(270,270)
rect(x,y, xsize, );
if(mouseX >x && x<x+xsize){
if(mouseY >y && x<y+ysize){
 mute();
   }
 }
=======
// fill(270,270);
//rect(x,y, xsize, ysize);
//if(mouseX >x && x<x+xsize){
//if(mouseY >y && x<y+ysize){
// mute();
//   }
// }
>>>>>>> Stashed changes
  
  x =width*6/7;
  y= height*1/14;
  xsize = width/15;
  ysize = width/15;

//pause
<<<<<<< Updated upstream
  fill(270,270)
=======
  fill(270,270);
>>>>>>> Stashed changes
rect(width*6/7,height*1/14, width/15, width/15);
if(mouseX >x&& x<x+xsize){
if(mouseY >y&& x<y+ysize){
  pause();
   }
 }

 x =width*1/7;
  y= height*1/14;
  xsize = width/15;
  ysize = width/15;

//restart
<<<<<<< Updated upstream
  fill(270,270)
=======
  fill(270,270);
>>>>>>> Stashed changes
rect(width*1/7,height*1/14, width/15, width/15);
if(mouseX >x&& x<x+xsize){
if(mouseY >y&& x<y+ysize){
  restart();
    }
  }
}

PVector direction(){
  PVector temp = new PVector (width/2- mouseX, height*3/4- mouseY);
 temp = PVector.mult(temp,-1);
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
return temp.normalize();
}

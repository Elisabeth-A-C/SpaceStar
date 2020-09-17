void displayButton(){
  fill(255, 150); // TODOmake transparent
  ellipse(0.5*width, height*(3/4), width*(1/6), width*(1/6));
 
PVector circleLocation = new PVector (0.5*width- mouseX, height*(3/4)- mouseY);

 circleLocation.limit(width*(1/6));
  fill(220);
  ellipse(circleLocation.x, circleLocation.y, width*(1/12), width*(1/12));
}

PVector direction(){
  PVector temp = new PVector (0.5*width- mouseX, height*(3/4)- mouseY);
return temp.normalize();
}

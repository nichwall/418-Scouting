import controlP5.*;
ControlP5 cp5;

int windowHeight = 600;
int windowWidth = 800;

ListBox teamSelection;

int[][] teamSelectData;

void setup() {
  //String[] teamNames =
  cp5 = new ControlP5(this); 
  
  teamSelection = cp5.addListBox("Teams").setPosition(200,10);
  teamSelectData = new int[10][5];
  for (int i=0; i<10; i++) {
    teamSelection.addItem(""+i,i).setColorBackground(150);
    teamSelectData[i][0] = i;
    teamSelectData[i][1] = 25;
    teamSelectData[i][2] = 150;
    teamSelectData[i][3] = 255;
    teamSelectData[i][4] = 0;
  }
  
  size(windowWidth, windowHeight);
  background(0);
}

void draw() {
  if (keyPressed && key=='1') {
    teamSelection.getItem("A: 1").setColorBackground(color(255,0,0));
  }
  generateAxis();
  int[][] pts1 = {{1,1},{2,2},{3,1},{5,4}};
  int[] col = {100,45,255};
  grapher(pts1,col);
  int[][] pts2 = {{1,6},{2,5},{3,4}};
  int[] col2 = {255,255,0};
  grapher(pts2,col2);
}

void generateAxis() {
  stroke(255);
  strokeWeight(3);
  line(100,100,100,windowHeight-100);
  line(100,windowHeight-100,windowWidth-100,windowHeight-100);
}

void grapher(int[][] points, int[] col) {
  stroke(col[0],col[1],col[2]);
  strokeWeight(2);
  for (int i=0; i<points.length; i++) {
    int x1 = 100+points[i][0]*80;
    int y1 = windowHeight - (100+points[i][1]*50);
    ellipse(x1,y1,5,5);
    if (i<points.length-1) {
      int x2 = 100+points[i+1][0]*80;
      int y2 = windowHeight - (100+points[i+1][1]*50);
      line(x1,y1,x2,y2);
    }
  }
}

// controlEvent monitors clicks on the gui
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
  }
}

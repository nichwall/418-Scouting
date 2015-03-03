import controlP5.*;
ControlP5 cp5;

int windowHeight = 600;
int windowWidth = 800;

ListBox teamSelection;

int[][] teamSelectData;

void setup() {
  //String[] teamNames =
  cp5 = new ControlP5(this); 
  
  teamSelection = cp5.addListBox("Teams").setPosition(10,10);
  teamSelectData = new int[10][5];
  for (int i=0; i<10; i++) {
    teamSelection.addItem(""+i,i).setColorBackground(150);
    teamSelectData[i][0] = i;
    teamSelectData[i][1] = 25;
    teamSelectData[i][2] = 150;
    teamSelectData[i][3] = 255;
    teamSelectData[i][4] = 0;
  }
  teamSelectData[5][1]=255;
  teamSelectData[5][2]=0;
  teamSelectData[5][3]=255;
  
  size(windowWidth, windowHeight);
  background(0);
}

void draw() {
  if (keyPressed && key=='1') {
    teamSelection.getItem("1").setColorBackground(color(255,0,0));
  }
  generateAxis();
  int[][] pts1 = {{1,1},{2,2},{3,1},{5,4}};
  int[] col = {100,45,255};
  lineGraph(pts1,col);
  int[][] pts2 = {{1,6},{2,5},{3,4}};
  int[] col2 = {255,255,0};
  lineGraph(pts2,col2);
}

void generateAxis() {
  stroke(255);
  strokeWeight(3);
  line(150,100,150,windowHeight-100);
  line(150,windowHeight-100,windowWidth-100,windowHeight-100);
}

void lineGraph(int[][] points, int[] col) {
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

// Toggle team selections
void toggleTeamSelected(int teamNumber) {
  int i = teamNumber;
  if (teamSelectData[i][4]==0) {
    teamSelectData[i][4] = 1;
    teamSelection.getItem(teamSelectData[i][0]).setColorBackground(color(teamSelectData[i][1],teamSelectData[i][2],teamSelectData[i][3]));
  } else {
    teamSelectData[i][4] = 0;
    teamSelection.getItem(teamSelectData[i][0]).setColorBackground(150);
  }
}

// controlEvent monitors clicks on the gui
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
    String var = "Teams [ListBox]";
    if (theEvent.getGroup().toString().equals(var)) {
      System.out.println("Yay!");
      toggleTeamSelected((int)theEvent.getGroup().getValue());
    }
  }
}

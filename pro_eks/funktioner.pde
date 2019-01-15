
void popUpKob(){
    fill(155,0,0,120);
    rect(100,100,500,500);
    for(int i = 0; i < 9; i++){
      line(100,500/10*(i+1)+100,600,500/10*(i+1)+100); 
    }
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Smed" ,175,150);
}
void popSmed(){
    fill(255,0,0);
    rect(100,100,500,500);
    textAlign(CENTER); 
    textSize(50);
    fill(0);
    text("køb en smed:",350,200);
    fill(0,255,0);
    rect(200,250,300,150);
    fill(0);
    text("6000 Kr.",350,350);
}

void kob(int sted,int x,int y){
  if(bygning[sted] == 0 && kobPop == false){
     kobPop = true;
    } 
}
void kobF(int sted,int x,int y){
  if(x <= 500 && x >= 200 && y <= 400 && y >= 250 && popSmed == true){
      bygning[sted - 1] = 1;
      popSmed = false;
      println("lolo");
    }
}

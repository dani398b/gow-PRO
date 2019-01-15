
void popUpKob(){
    image(wood,100,100);
    for(int i = 0; i < 9; i++){
      line(100,500/10*(i+1)+100,600,500/10*(i+1)+100); 
    }
    fill(0);
    textSize(50);
    textAlign(CORNER);
    text("Smed" ,105,150);
    text("hjem 1" ,105,200);
    text("hjem 2" ,105,250);
    text("hjem 3" ,105,300);
    text("Smed" ,105,350);
    text("Smed" ,105,400);
    text("Smed" ,105,450);
    text("Smed" ,105,500);
    text("Smed" ,105,550);
    text("Smed" ,105,600);
}
void popUp(int kob){

    fill(255,0,0);
    rect(100,100,500,500);
    textAlign(CENTER); 
    textSize(50);
    fill(0);
    if(mus1 == 0){
    text("køb en smed:",350,200);
    } else if(mus1 < 5 && mus1 > 1){
    text("køb et hjem " + (mus1 - 1) + ":",350,200);
    }
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

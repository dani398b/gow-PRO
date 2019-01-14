class bygninger{
  int sted;
  smed Smed;
  bygninger(){
    Smed = new smed();
  }
  
  void click(int x, int y){
    fill(255,0,0);
    sted = ((y/70)*10)+(x/70+1);
    text(sted,x,y);
    Smed.click(sted,x,y);
  }
}

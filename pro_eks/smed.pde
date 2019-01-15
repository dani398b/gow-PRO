class smed {


  void click(int sted) {
   
  }
  void display() {
    for(int i = 0; i < bygning.length; i++){
      if(bygning[i] == 1){
        image(smed, ((i)%10)*70, round(i)*70);
      }
    }
    
  }
}

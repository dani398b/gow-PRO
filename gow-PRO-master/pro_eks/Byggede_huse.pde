void upgrade() {
  image(wood1, 100, 100);
  for (int i = 0; i < 5; i++) {
    image(lilleKnap, 125, 50 + ((i+1)*70));
  }
    image(knap, 200, 475);
    textAlign(CENTER);
    textSize(40);
    text("Beboer",350,535);
}

void beboer(){
   image(grid, 100,100);
}

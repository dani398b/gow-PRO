int _nummer;
//opsætter classen mennesker der laver ens mennesker
class mennesker {
  //classens variabler
  float alder;
  float styrke;
  float iq;
  int sygdom;
  int farve;
  int kon;
  int familie;
  int hus;
  boolean visStat = false;
  boolean Vis = false;
  int nummer;
  int[] foraeldre = new int [2];
  int bilde;
  
  //classens ene setup denne er for de menesker man starter med der er random
  mennesker() {
    //giver classens variabler en værdig 
    hus = 0;
    alder = random(99);
    styrke = random(10);
    iq = random(50, 160);
    sygdom = round(random(100));
    farve = round(random(1,3));
    kon = round(random(1, 2));
    familie = int(random(9999));
    nummer = _nummer;
    _nummer++;

    //bergner bilde til personen udfra der værdigere 
    int faktor = 0;

    if(alder < 10){
      faktor = 3;
    }else if(iq < 90 && styrke < 5){
      faktor = 9;
    } else if(iq > styrke * 15){
      faktor = 0; 
    } else if(styrke * 15 > iq){
      faktor = 6; 
    }
    if(kon == 2){
      faktor = faktor + 12; 
    }
    bilde = faktor + (3 - farve);    
  }
  
  //den anden setup funktion der er for de mennesker der bliver laver af brugeren
  mennesker(mennesker other, mennesker other1) {
    alder = 0;
    //giver classen variablere en værdig udfra forældrene
    if (other.styrke <= other1.styrke) {
      styrke = random(other.styrke - 1, other1.styrke + 1);
    } else {
      styrke = random(other1.styrke - 1, other.styrke + 1);
    }
    if (other.iq <= other1.iq) {
      iq = random(other.iq - 10, other1.iq + 10);
    } else {
      iq = random(other1.iq - 10, other.iq + 10);
    }
    if (other.sygdom <= other1.sygdom) {
      sygdom = round(random(other.sygdom - 5, other1.sygdom + 5));
    } else {
      sygdom = round(random(other1.sygdom - 5, other.sygdom + 5));
    }  
    farve = round((other.farve + other1.farve)/2);
    kon = round(random(1, 2));
    foraeldre[0] = other.familie;
    foraeldre[1] = other1.familie;
    nummer = _nummer;
    _nummer++;
    
    //begrenge billdet
    int faktor = 0;

    if(alder < 10){
      faktor = 3;
    }else if(iq < 90 && styrke < 5){
      faktor = 9;
    } else if(iq > styrke * 15){
      faktor = 0; 
    } else if(styrke * 15 > iq){
      faktor = 6; 
    }
    if(kon == 2){
      faktor = faktor + 12; 
    }
    bilde = faktor + farve;
  }
  
  //til ar vise bilde når man ser personens stats
  void visBilde() {
    if (visStat == true) {
          image(man[bilde], 400, 150,150,150);
    }
  }
  
  //visser personens stats
  void display() {
      textSize(20);
      fill(255);
      text("Alder: " + alder, 150, 160);
      text("Styrke: " + styrke, 150, 185);
      text("Iq: " + iq, 150, 210);
      text("Sygdom: " + sygdom, 150, 235);
      text("Farve: " + farve, 150, 260);
      text("Køn: " + kon, 150, 285);
      text("Familie: " + familie, 150, 310);
      text("Forældre: " + foraeldre[0] +","+foraeldre[1], 150, 335);

  }
  
  //blevbrugt til at se personens familie
    void fam(){
      if(foraeldre[0] != 0){
    text(foraeldre[0] + "," +foraeldre[1],100,500);
  }
}
}

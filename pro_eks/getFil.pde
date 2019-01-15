class getFil {
  PrintWriter output;
  String[] linje;

  int laes(String fil) {
      
  String[] linjer = loadStrings(fil);
  return linjer;
  }

  void skriv(String fil, String tekst) {
    String[] liste = {6,0,0,0};
    saveStrings(fil, liste);
  }
}

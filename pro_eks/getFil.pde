class getFil {
  PrintWriter output;
  String[] linje;

  String laes(String fil, int linje) {
      
  String[] linjer = loadStrings(fil);
  return linjer[linje];
  }

  void skriv(String fil, String tekst) {
    String[] liste = {"6","0","0","0"};
    saveStrings(fil, liste);
  }
}

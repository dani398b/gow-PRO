class getFil {
  PrintWriter output;
  String[] linje;

  void laes(String fil, int linje) {
      
  String[] linjer = loadStrings(fil);
  println("there are " + linjer.length + " lines");
  for (int i = 0 ; i < linjer.length; i++) {
    println(linjer[i]);
  }
  println(linjer[linje]);
  }

  void skriv(String fil, String[] tekst) {
    saveStrings(fil, tekst);
  }
}

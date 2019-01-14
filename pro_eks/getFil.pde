class getFil {
  PrintWriter output;
  String line;

  String laes(String fil) {

    BufferedReader reader = createReader(fil);
    try {
      line = reader.readLine();
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    
    println("Læste: " + file + " : Resultat: " + line);
    return line;
  }

  void skriv(String fil, String text) {
    output = createWriter(fil); 
    output.print(number);
    output.flush();
    output.close();
    
    println("Skrev: " + text);
  }
}


void save() {
  //vælger hvor der skal gemmes
  output = createWriter("lololololol.txt");

  //gemmer alle bygningerne
  for (int i = 0; i < bygning.length; i++) {
    output.print(bygning[i] +",");
  }
  //gemmer pengene
  output.print(penge);

  //Lukker filen
  output.close();

  //vælger hvor menneskerne skal gemmes
  output = createWriter("positions.txt");

  //gemmer alle værdierne for menneskerne
  for (mennesker b : Mennesker) {
    output.print(b.alder +",");
    output.print(b.styrke+",");
    output.print(b.iq+",");
    output.print(b.sygdom+",");
    output.print(b.farve+",");
    output.print(b.familie+",");
    output.print(b.hus+",");
    output.print(b.bilde+",");
  }
  //lukker filen
  output.close();
}

void read() {
  //vælger hvad der skal loades
  BufferedReader reader = createReader("lololololol.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      //vælgere hvor filen skal deles op
      String[] pieces = split(line, ",");
      int q = 0;
      //Loader alle bygningerene
      for (int i = 0; i < bygning.length; i++) {
        bygning[i] = int(pieces[q]);
        q++;
      }
      //Loader alle penge
      penge = float(pieces[q]);
    }
    //Lukker filen igen
    reader.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
  //samme gentages for menneskerne
  BufferedReader read = createReader("positions.txt");
  String lines = null;
  try {
    while ((lines = read.readLine()) != null) {
      String[] pieces = split(lines, ",");
      int i = 0;
      for (mennesker b : Mennesker ) {
        b.alder = int(pieces[i]);
        i++;
        b.styrke = int(pieces[i]);
        i++;
        b.iq = int(pieces[i]);
        i++;
        b.sygdom = int(pieces[i]);
        i++;
        b.farve = int(pieces[i]);
        i++;
        b.familie = int(pieces[i]);
        i++;
        b.hus = int(pieces[i]);
        i++;
        b.bilde = int(pieces[i]);
        i++;
      }
    }
    read.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

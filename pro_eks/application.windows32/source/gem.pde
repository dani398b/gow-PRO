
void save() {
  output = createWriter("lololololol.txt");
  for (int i = 0; i < bygning.length; i++) {
    output.print(bygning[i] +",");
  }
  output.print(penge);
  output.close();

  output = createWriter("positions.txt"); 
  for (mennesker b : Mennesker) {
    output.print(b.alder +",");
    output.print(b.styrke+",");
    output.print(b.iq+",");
    output.print(b.sygdom+",");
    output.print(b.farve+",");
    output.print(b.familie+",");
    output.print(b.hus+",");
    // output.print(",,");
  }
  for (mennesker b : Mennesker) {
    output.print(b.alder +",");
    output.print(b.styrke+",");
    output.print(b.iq+",");
    output.print(b.sygdom+",");
    output.print(b.farve+",");
    output.print(b.familie+",");
    output.print(b.hus+",");
    // output.print(",,");
  }


  output.close();
}

void read() {
      BufferedReader reader = createReader("lololololol.txt");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, ",");
        int q = 0;

        for (int i = 0; i < bygning.length; i++) {
          bygning[i] = int(pieces[q]);
          q++;
        }
        penge = float(pieces[q]);
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }

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
      }
      i = 0;
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
      }
    }
    read.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

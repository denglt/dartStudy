import 'dart:convert';
import 'dart:io';

File f = File("/Users/denglt/mysh/fun/sshPort.sh");

main(List<String> args) {
  //read();
  stream();
}

void read() {
  f.readAsString().then((context) => print(context));
  print("===============");
  f.readAsLines().then((lines) => lines.forEach(print));
}

void stream() async {
  Stream<List<int>> inputStream = f.openRead();
  print(inputStream.runtimeType);
  inputStream.transform(utf8.decoder).listen(print);
  /*
  var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());
  print(lines.runtimeType);
  await for (var line in lines) {
    print(line);
  } 
  */
}

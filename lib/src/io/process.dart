import 'dart:io';

main(List<String> args) async {
  print(Platform.script.toFilePath());

  var result = await Process.run("ls", ["-l"]);
  print(result);
  print(result.stdout);
}

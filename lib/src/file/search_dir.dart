import 'dart:io';

void main(List<String> arguments) {
  // ...
  String searchPath = "/Users/denglt/mywork/code/hs-yun";
  FileSystemEntity.isDirectory(searchPath).then((isDir) {
    if (isDir) {
      final startingDir = Directory(searchPath);
      startingDir.list(recursive: false, followLinks: true).listen((entity) {
        if (entity is File) {
          // searchFile(entity, searchTerms);
          print(entity);
        }else{
          print(entity);
        }
      });
    } else {
      //searchFile(File(searchPath), searchTerms);
      print("is dir");
    }
  });
  print("begin search file");
}

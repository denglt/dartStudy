import 'dart:io';

main(List<String> args) async {
  print("begin search file");
  String searchPath = "/Users/denglt/mywork/code/hs-yun";
  if (await FileSystemEntity.isDirectory(searchPath)) {
    final startingDir = Directory(searchPath);
    await for (var entity
        in startingDir.list(recursive: false, followLinks: true)) {
      if (entity is File) {
        // searchFile(entity, searchTerms);
        print(entity);
      } else {
        print(entity);
      }
    }
  } else {
    print("is not dir");
  }
}

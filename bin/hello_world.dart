/**
 使用如下命令安装命令行： 
   pub global activate --source path ~/onGithub/dart/hello_world
 */
import 'package:dartStudy/hello_world.dart' as hello;
import 'package:dartStudy/src/calculate.dart' as hello2;
import 'package:markdown/markdown.dart' as markdown;

main(List<String> arguments) async {
  // await helloworld.loadLibrary();
  print('Hello world: ${hello.calculate()}!');
  print('Hello world: ${hello2.calculate()}');
  print(markdown.markdownToHtml('Hello *Markdown*'));
  print(markdown.markdownToHtml('Hello *Markdown*'));
}

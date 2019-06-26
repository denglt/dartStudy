import 'dart:async';

void hello() async {
  print('something exciting is going to happen here...');
}

main(List<String> args) async{
  var f = hello();
  print("all done!");
  await f;
}
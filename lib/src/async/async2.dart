import 'dart:io';

lookUpVersion() async {
  print("lookUpVersion");
  Duration duration = const Duration(seconds: 5);
  // sleep(oneSecond);
  print(DateTime.now());
  await new Future.delayed(duration);
  print(DateTime.now());
  print("delayed");
  return '1.0.0';
}

main(List<String> args)  {
  var f = lookUpVersion();
  print(f.runtimeType);
  print("do ....");
  sleep(Duration(seconds: 3));
  print(DateTime.now());
  //var s = await f;
  //print(s);
  print("do 2....");
  print("do 2....");
  print("do 2....");
  print("do 2....");
  print("do 2....");
  print("do 2....");
}

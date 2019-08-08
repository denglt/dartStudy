import 'dart:async';


main(List<String> args) {
  StreamController<int> controller =  StreamController<int>.broadcast();  
  controller.stream.listen(print);
  controller.stream.listen((t) => print('2 => $t'));
  controller.sink.add(100);
}
import 'dart:async';
import 'dart:io';
import 'dart:isolate';

main(List<String> args) async {
  compute(100);
  /** 
  var f = computeIsolate(100); // 这个多线程了，且在sleep前执行
  f = computeIsolate(100);
  f = computeIsolate(100);
  */
  var f = computeIsolate2(100); // 这个多线程了，但是在sleep后执行（待main线程空闲）
  f = computeIsolate2(100);
  f = computeIsolate2(100);
  var ff = asyncCompute(100);
  print("sleep -> ${DateTime.now()}");
  sleep(Duration(seconds: 5));
  print("sleep end -> ${DateTime.now()}");
  /*
  var i = await f;
  print(i.runtimeType);
  print(i);
  */
}

int compute(int max) {
  print("compute -> ${DateTime.now()}");
  int total = 0;
  for (int i = 1; i <= max; i++) {
    total += i;
  }

  print("finish -> ${total} ${DateTime.now()}");
  return total;
}

int computeSlowly(int max) {
  print("compute slowly -> ${DateTime.now()}");
  int total = 0;
  for (int i = 1; i <= max; i++) {
    total += i;
    sleep(Duration(milliseconds: 20));
  }
  print("finish slowly -> ${total} ${DateTime.now()}");
  return total;
}

Future<int> asyncCompute(int max) {
  print("begin async compute");
  return Future(() => compute(max));
}

Future<dynamic> computeIsolate(int max) async {
  final response = new ReceivePort();
  await Isolate.spawn(_isolate, [response.sendPort, max]);
  return response.first;
}

void _isolate(list) {
  var sendPort = list[0] as SendPort;
  int n = list[1] as int;
  sendPort.send(computeSlowly(n));
}

Future<dynamic> computeIsolate2(int max) async {
  final response = new ReceivePort();
  final answer = new ReceivePort();
  await Isolate.spawn(_isolate2, response.sendPort);
  var sendPort = await response.first as SendPort;
  sendPort.send([max, answer.sendPort]);
  return answer.first;
}

void _isolate2(SendPort sendPort) {
  final port = new ReceivePort();
  sendPort.send(port.sendPort);
  port.listen((message) {
    int n = message[0] as int;
    var sendPort = message[1] as SendPort;
    sendPort.send(computeSlowly(n));
  });
}

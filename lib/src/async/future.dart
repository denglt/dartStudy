import 'dart:async';

import 'dart:cli';

main(List<String> args) async {
  var f = new Future(() => print("denglt"));
  var ff = maxCompute(100);
  print("1");
  print("2");
  print("3");
  print("4");
  await ff;
  print("5");
  //print(await ff);
  print(ff);
}

int compute(int max) {
  print("compute");
  int total = 0;
  for (int i = 1; i <= max; i++) {
    total += i;
  }
  print("finish -> ${total}");
  return total;
}

Future<int> asyncCompute(int max) {
  print("begin async compute");
  return Future(() => compute(max));
}

Future<int> maxCompute(int max) async {
  var f = await asyncCompute(max);
  print(f);
  return await asyncCompute(f);
}

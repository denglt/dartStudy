import 'dart:async';


main(List<String> args) async {
  var f = new Future(() => print("denglt"));
  var ff = maxCompute(100);
  print("1");
  print("2");
  print("3");
  print("4");
//  await ff;
  print("5");
  //print(await ff);
  ff.then((t){
     print('--------->' + t.toString());
  });
  print(ff);
  print('-------end--------------');
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

Future<int> asyncCompute(int max) async{
  print("begin async compute");
  return Future(() => compute(max));
}

Future<int> maxCompute(int max) async {
  var f = await asyncCompute(max);
  print(f);
  return await asyncCompute(f);
}

import 'dart:async';

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

main(List<String> args) async {
  var iter = naturalsTo(10);
  for (var i in iter){
    print(i);
  }

  var asyncNatural = asynchronousNaturalsTo(10);
  await asyncNatural.forEach( (t) => print(t));  

  for (var item in naturalsDownFrom(10)) {
    print(item);
  }

  print("finish");

}

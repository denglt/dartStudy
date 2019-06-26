import 'package:meta/meta.dart';

main() {
  enableFlags(bold: false, hidden: true);
  enableFlags(hidden: true, bold: false);
  enableFlags(hidden: true);
  doStuff();

  var list = [1, 2, 3, 1];
  // Pass printElement as a parameter.
  list.forEach(printElement);
  // Anonymous functions
  // the function contains only one statement ,you can shorten it using arrow notation
  list.forEach((f) => print(f));
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
    print('${list.indexOf(item)}: -> $item');
  });

  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);

  funParam("study", denglt);
  funParam2("study", denglt);
  print(funParam.runtimeType);
  print(funParam is Function);

  test('denglt', 0, bFlag: false);
  test2('denglt', 0);
  test3('denglt', 0);
  bind('address', 0, backlog: 0);
}

// Optional named parameters
void enableFlags({bool bold = true, @required bool hidden}) {
  print(bold);
  print(hidden);
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say('Bob', 'Howdy', 'denglt') == 'Bob says Howdy with a denglt');
}

// Optional positional parameters
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void test(name, int i, {bool bFlag = true}) {}
void test2(name, int i, {bool bFlag}) {}
void test3(ame, int i, [bool bFlag = true]) {
  print("test3 $bFlag");
}

bind(address, int port,
        {int backlog: 0, bool v6Only: false, bool shared: false}) =>
    print(1);

void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  // list.add(4); is error
  print('list:  $list');
  print('gifts: $gifts');
}

void printElement(int element) {
  print(element);
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void funParam(String str, String deal(String v)) {
  String vv = deal(str);
  print(vv);
}

void funParam2(String str, Function deal) {
  String vv = deal(str);
  print(vv);
}

String deal2(String v) {
  return v + "  by deal2";
}

String denglt(String v) {
  return v + "  by denglt";
}

typedef Deal = String Function(String s);

typedef Compare<T> = int Function(T a, T b);

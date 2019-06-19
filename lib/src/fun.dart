import 'package:meta/meta.dart';
import 'package:meta/dart2js.dart';

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

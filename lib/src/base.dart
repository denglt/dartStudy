// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
  int linecount;
  print(linecount);
  String name = "denglt";
  // name = 100; is error
  print(name);
  dynamic name2 = "denglt";
  name2 = 100;
  print(name2);
  printInteger(name2);
  const bar = 10000;
  //bar = 10;
  int one = int.parse("111");

  var s = "hello world";
  s = "afdfas";
  print(s);
  s.isEmpty;
  var list = [1, 2, 3];
  print(list.length);
  list.add(4);
  printInteger(list.reduce((a, b) => a + b));
  printInteger(list.reduce(combine));
  print(list.length);
  var constantList = const [1, 2, 3];
  // constantList.add(4); is error

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}

int combine(int a, int b) {
  return a + b;
}
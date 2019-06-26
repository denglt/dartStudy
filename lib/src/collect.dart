Map globalMap;

main() {
  var names = <String>['Seth', 'Kathy', 'Lars'];
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };

  // Set
  print("===============set==========");
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  halogens.add("denglt");
  print(halogens.length);
  Iterator<String> iterator = halogens.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
    if (iterator.current == "bromine") {
      // halogens.remove(iterator.current);  is error
    }
  }
  for (var item in halogens) {
    print(item);
  }
  print(halogens);

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  // Map (json)
  print("===============Map==========");
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  gifts..putIfAbsent('name', () => "denglt")..putIfAbsent('name', () => "zyy");
  // gifts.forEach((k,v) => print(k + ":" +v));
  printMap(gifts);
  print(gifts);

  var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};
  printMap2(nobleGases);
  var gifts2 = Map(); // == new Map();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  globalMap = gifts;
  printGlobalMap();
  globalMap = nobleGases;
  printGlobalMap();
  globalMap = gifts2;
  printGlobalMap();

  // List
  print("===============List==========");
  var list = [1, 2, 3, 4];
  List<int> list2 = List();
  list2.addAll(list);
  print(list2);
  print(list[0]);
}

void printMap(Map<String, String> map) {
  map.forEach((k, v) => print(k + ":" + v));
}

void printMap2(Map<int, String> map) {
  map.forEach((k, v) => print(k.toString() + ":" + v));
}

void printMap3(Map map) {
  map.forEach((k, v) => print(k.toString() + ":" + v.toString()));
}

void printGlobalMap() {
  globalMap.forEach((k, v) => print(k.toString() + ":" + v.toString()));
}

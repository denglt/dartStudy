import 'dart:convert';

main(List<String> args) {
  // decode();
  //encode();
  Penson p = Penson(100, 'denglt', DateTime.now());
  print(json.encode(p));
  print(json.encode(p, toEncodable: (t) {
    Map map = Map();
    map["age"] = t.age;
    map["name"] = t.name;
    map["brithday"] = t.brithday.toString();
    return map;
  }));

  JsonEncoder j = JsonEncoder((t) {
    Map map = Map();
    map["age"] = t.age;
    map["name"] = t.name;
    //map["brithday"] = t.brithday.toString();
    return map;
  });
  print(j.convert(p));
}

void decode() {
  var jsonString = '''
      [
        {"score": 40},
        {"score": 80}
      ]
    ''';
  print(jsonString);
  var scores = json.decode(jsonString);
  assert(scores is List);
  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);
  print(scores.runtimeType);
  print(scores);
  for (var score in scores) {
    print(score.runtimeType);
    print(score);
  }
}

void encode() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];
  print(scores);
  var jsonString = jsonEncode(scores);
  print(jsonString);
}

class Penson {
  int age;
  String name;
  DateTime brithday;
  Penson(this.age, this.name, this.brithday);

  Map toJson() {
    Map map = Map();
    map["age"] = age;
    map["name"] = name;
    map["brithday"] = brithday.toString();
    return map;
  }
}


class Customer extends JsonObject
{
  int Id;
  String Name;
  String Addr;
}
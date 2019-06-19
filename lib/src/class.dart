import 'dart:math';

main(List<String> args) {
  var p = Point(2, 2);
  print(p.x);
  print(p);
  print(p.pointDesc);
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  var c = const ImmutablePoint(2, 2);

  assert(identical(a, b)); // They are the same instance!
  assert(a == b);
  // assert(b == c); is not true

  // Lots of const keywords here.
  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
  };
  print(pointAndLine['point'].runtimeType);
  print(Employee({}, 1));
}

//Constant constructors
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}
// 每个类都隐式定义一个接口，该接口包含该类的所有实例成员及其实现的任何接口。
class Point {
  num x, y; // initially null.
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  // Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }
  Point.origin2()
      : x = 0,
        y = 0 {
    print('origin2');
  }

  Point.fromJson(Map<String, num> json)
      : x = json['x'],
        y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  // Redirecting constructors
  Point.alongXAxis(num x) : this(x, 0);

  // Factory constructors
  factory Point.of(int x ,int y){
    Point p = Point(0, 0);
    return p;
  }
  

  // instace methods
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  //String get pointDesc => "($x,$y)";
  String get pointDesc{
    return "($x,$y)";
  }
  set pointDesc(String v ) {

  }
}

class Person {
  String firstName;
  Person(int a) {
    print('Person');
  }

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }

  Employee(Map data, int a) : super(a) {
    print('in Employee');
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

//Abstract classes

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class DemoClass{
  num _a ;
  DemoClass(int a){
    this._a = a;
  }
  DemoClass.of(int a): _a = a {
     print(_a);
  }

  factory DemoClass.of2(int a){
    return DemoClass(a);
  }

}
const noInline = const _NoInline();
class _NoInline {
  const _NoInline();
}
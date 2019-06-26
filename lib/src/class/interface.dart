// 每个类都隐式定义一个接口，该接口包含该类的所有实例成员及其实现的任何接口。

// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final String _name;
  // Not in the interface, since this is a constructor.
  Person(this._name);
  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Impostor implements Person {
  String _name;

  @override
  String greet(String who) {
    //print(super._name);
    return 'Hello, $who. I am $_name.';
  }
}

class PersonEx extends Person{

  PersonEx(String name):super(name){
    print("能访问_name -> $_name");
  }
  
  @override
  String greet(String who) {
    return super.greet(who) + " in PersonEx";
  }
} 

String greetBob(Person person) => person.greet('Bob');

main(List<String> args) {
  Person p = Person("denglt");
  Impostor impostor = Impostor();
  print(greetBob(p));
  print(greetBob(impostor));

  print(greetBob(PersonEx("denglt")));

}
import 'package:dartStudy/src/async/async.dart';

class Base {}

class Animal extends Base {
  void chase(Animal a) {
    print(a);
  }

  Animal get parent => null;
}

class HoneyBadger extends Animal {
  @override
  void chase(Base a) {
    // 这儿很与java是不一样的
    print('HoneyBadger chase');
    super.chase(a);
  }

  Animal get parent => null;
}

class Mouse extends Animal {}

class Cat extends Animal {}

class Lion extends Cat {}

class MaineCoon extends Cat {}

main(List<String> args) {
  Mouse m = Mouse();
  HoneyBadger honeyBadger = HoneyBadger();
  //honeyBadger.chase("denglt"); is error
  honeyBadger.chase(honeyBadger);
  honeyBadger.chase(m);
  // honeyBadger.chase(Base()); is error

  List<Animal> animals = [HoneyBadger(), Mouse()];
  print(animals);

  List<Cat> myCats = List<MaineCoon>();
  // List<Cat> myCats2 = List<Animal>() ;  static analysis:success ,but runtime is error
  print(myCats);
  //print(myCats2);
}

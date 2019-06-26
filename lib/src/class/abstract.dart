abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.

  void hello(){
     print("do");
  }

}

class A implements Doer {
  @override
  void doSomething() {}

  @override
  void hello(){

  }
}

class B extends Doer {
  @override
  void doSomething() {}
}

main(List<String> args) {
  print(A() is Doer);
  print(B() is Doer);
}

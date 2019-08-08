class A {
  String a;
  A() {
    a = "A";
    print("A");
  }
}

mixin B {
  String b;
}

class MyB with B{

}
mixin C {
  String c;
}

class Z extends A with B, C {
  C() {
    print("C");
  }

  String getStr() {
    return "($a,$b,$c)";
  }
}

class D {
  String d;
  D() {
    d = "D";
    print("D");
  }
}

// DD 依赖 D  给 D增加新功能
mixin DD on D {  
  void printD() {
    print(d);
  }
}

class Y extends D with DD {}

main(List<String> args) {
 // B(); error
  Z z = Z();
  // z.a = "A";
  z.b = "B";
  z.c = "C";
  print(z.getStr());

  assert(z is A);
  assert(z is B);
  assert(z is C);
//  assert(z is DD);

  Y y = Y();
  assert(y is D);
  assert(y is DD);
  y.printD();

  // DD();
}

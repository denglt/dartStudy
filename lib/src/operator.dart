class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown. For details, see note below.
  // ···

  @override
  noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
    return super.noSuchMethod(invocation);
  }
}

main(List<String> args) {
  final v = Vector(2, 3);
  final w = Vector(2, 2);
  v + w;
  print(v.hashCode);
  // assert(v + w == Vector(4, 5));
  // assert(v - w == Vector(0, 1));
}

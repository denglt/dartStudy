main(List<String> args) async {
  var counterStream =
      Stream.periodic(Duration(seconds: 1), (x) => " -> $x").take(15);
  await counterStream.forEach(print);

  var counterStream2 = Stream.fromIterable([1, 2, 3]);
  await counterStream2.forEach(print);
    
}

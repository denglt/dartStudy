main(List<String> args) async {
  /*
  var counterStream =
      Stream.periodic(Duration(seconds: 1), (x) => " -> $x").take(15);
  await counterStream.forEach(print);
 // counterStream.listen((t) => print('listen -> $t'));
 */
 

  var counterStream2 = Stream.fromIterable([1, 2, 3]);
 //await counterStream2.forEach(print);
 // Stream.castFrom<int,String>(counterStream2).listen(print);
//counterStream2.cast<String>().listen(print);
  // counterStream2.any(test)
 // counterStream2.map(convert)

}

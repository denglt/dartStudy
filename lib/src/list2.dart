main(List<String> args) {
  List<String> list = ['denglt'];
  List<Object> list2 = [1,2];
  print(list.runtimeType);
  print(list2.runtimeType);
  print(list2);
  list2.add(100);
  list2 = list;
  print(list.runtimeType);
  print(list2.runtimeType);

    List<Object> list3 = [1,2];
    // list = list3; is error


}

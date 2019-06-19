main(List<String> args) {
  try {
    // ···
    throw 'is error';
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
    print(e.runtimeType);
    print(s.runtimeType);
   // rethrow;
  }finally{
    print("finally!");
  }
}

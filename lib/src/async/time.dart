import 'dart:async';

main(List<String> args) {
  int totalCount = 20;
  int iCount = 0;
  Timer(Duration(seconds: 1), () => print("timer"));
  Timer.periodic(Duration(seconds: 1), (timer) {
    print("timer");
    if (++iCount > totalCount) {
      timer.cancel();
    }
  });
  print("end of main");
}

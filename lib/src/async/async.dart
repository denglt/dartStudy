import 'dart:async';

main2(List<String> args) async {
  printDailyNewsDigest2();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

main(List<String> args) async {
  var f = printDailyNewsDigest();
  print(f.runtimeType);
  printWinningLotteryNumbers();
  printWeatherForecast();
  await f;
  printBaseballScore();
}

Future<String> printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  print(news);
  return news;
}

printDailyNewsDigest2() {
  final future = gatherNewsReports();
  future.then((news) => print(news));
}

void printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

void printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

void printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}

const news = '<gathered news goes here>';

Duration oneSecond = const Duration(seconds: 1);

final newsStream = new Stream.periodic(oneSecond, (_) => news);

Future gatherNewsReports() => newsStream.first;

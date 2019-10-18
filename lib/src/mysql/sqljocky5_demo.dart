import 'package:sqljocky5/sqljocky.dart';

main() async {
  ConnectionSettings s = ConnectionSettings(
    user: "root",
    password: "denglt",
    host: "127.0.0.1",
    port: 3306,
    db: "med2",
  );
  MySqlConnection conn = await MySqlConnection.connect(s);
  StreamedResults streamedResults =
      await conn.execute('select * from hos_doctor limit 1');
  Results results = await streamedResults.deStream();
  results.fields.forEach((t) {
    //print(t.name);
    print(t);
  });
  results.forEach((row) {
    print('${row[0]} ${row.byName("NAME")}');
  });

  await conn.close();
  print('end !');
}

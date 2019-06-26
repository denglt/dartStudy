import 'dart:io';
import 'dart:convert';

main(List<String> args) async {
  var url = Uri.parse('http://localhost:8888/dart');
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  var data = await response.transform(utf8.decoder).toList();
  print('Response ${response.statusCode}: $data');
  httpClient.close();
}

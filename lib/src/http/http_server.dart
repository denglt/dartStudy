import 'dart:io';
import 'dart:isolate';

main(List<String> args) async {

  var requests = await HttpServer.bind('localhost', 8888,shared: true);
  
  await for (var request in requests) {
    iso_processRequest(request);
  }
}

void iso_processRequest(HttpRequest request) async {
  await Isolate.spawn(processRequest, request);
}

void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server in slow');
    sleep(Duration(seconds: 30));
  } else if (request.uri.path == '/test') {
    response
      ..headers.contentType = ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server in fast');
  } else {
    response.statusCode = HttpStatus.notFound;
  }
  response.close();
}

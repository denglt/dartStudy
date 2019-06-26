import 'dart:io';

main(List<String> args) {
  HttpServer.bind('localhost', 8888).then((server) {
    server.listen((request) => processRequest(request));
  });
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

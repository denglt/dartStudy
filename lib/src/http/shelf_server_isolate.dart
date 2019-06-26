// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:isolate';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

main() async {
  var isolates = 4; // 4 个线程
  for (int i = 1; i < isolates; i++) {
    await Isolate.spawn(_startServer, []);
  }
  _startServer();  // 防止main退出
}

void _startServer([args]) async {
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  var server = await io.serve(handler, 'localhost', 8080,shared: true);
  // Enable content compression
  server.autoCompress = true;
  print('Serving at http://${server.address.host}:${server.port}');
}

shelf.Response _echoRequest(shelf.Request request) {
  if (request.requestedUri.path == '/sleep') {
    sleep(Duration(seconds: 60));
  }
  return shelf.Response.ok('Request for "${request.url}"');
}

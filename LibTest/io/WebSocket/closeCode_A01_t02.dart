// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion int closeCode
 * The close code set when the WebSocket connection is closed. If there is no
 * close code available this property will be null.
 * @description Checks that the [closeCode] is null when connection is not
 * closed and is set to a specified int value if the WebSocket connection is
 * closed.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        websocket.close(WebSocketStatus.normalClosure);
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) async {
      Expect.isNull(client.closeCode);
      await server.close();
      client.close().then((_) {
        Expect.equals(WebSocketStatus.normalClosure, client.closeCode);
      });
    });
  });
}

// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion bool isDirectory
 *  final
 *  Is true if the event target was a directory.
 *
 *  Note that if the file has been deleted by the time the event has arrived,
 *  this will always be false on Windows. In particular, it will always be false
 *  for delete events.
 *
 * @description Checks that this property always returns false. Test directory
 * deleted async
 * @issue 30359
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory d = getTempDirectorySync(parent: sandbox);
  asyncStart();

  await testFileSystemEvent<FileSystemDeleteEvent>(sandbox,
      createEvent: () async {
        d.deleteSync();
      }, test: (FileSystemEvent? event) {
        Expect.isFalse(event?.isDirectory);
      });
  asyncEnd();
}

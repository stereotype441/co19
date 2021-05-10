// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion int elementSizeInBytes
 * Returns the number of bytes in the representation of each element in this
 * list.
 * @description Checks that elementSizeInBytes is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Int32x4List(2);
  Expect.throws(
          () { l.elementSizeInBytes = 32; }, (e) => e is NoSuchMethodError);
}

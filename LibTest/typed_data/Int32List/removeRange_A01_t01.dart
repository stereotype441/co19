// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion void removeRange(int start, int end)
 * Removes the elements in the range start inclusive to end exclusive.
 * ...
 * Throws an UnsupportedError if this is a fixed-length list. In that case the
 * list is not modified.
 * @description Checks that [UnsupportedError] is thrown since [Int32List] is a
 * fixed-length list.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int32List.fromList(list);
  var length = l.length;
  Expect.throws(() { l.removeRange(0, 1); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addAll(Iterable<E> iterable)
 * Appends all elements of the iterable to the end of this list.
 * Extends the length of the list by the number of elements in iterable.
 * @description Checks that method does not affect the previous content of the list
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  Expect.isTrue(a.length == 0);
  List b = ["1","2","3"];
  a.addAll(b);
  Expect.listEquals(["1", "2", "3"], a);

  a.addAll([null,0, false, "0"]);
  Expect.listEquals(["1", "2", "3", null, 0, false, "0"], a);
}

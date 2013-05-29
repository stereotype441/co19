/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * Throws [RangeError] if the [length] is negative.
 * @description Checks that the exception is thrown as expected.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  try {
    a.length = -1;
    Expect.fail("RangeError expected when setting ga.length to negative");
  } on RangeError catch(ok){}

  try {
    [].length = -1;
    Expect.fail("RangeError expected when setting ga.length to negative");
  } on RangeError catch(ok){}

  try {
    new List.from([]).length = -1;
    Expect.fail("RangeError expected when setting ga.length to negative");
  } on RangeError catch(ok){}
}

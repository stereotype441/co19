/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If this collection is empty, returns true.
 * @needsreview not documented
 * @description Checks that [f] is not called if list is empty
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

 //Checks that [every] does not call [predicate]
check(List a, bool predicate(var e)) {
  int actualCount = 0;
  a.every((var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(0, actualCount);
}

main() {
  bool allTrue(var e) {
    return true;
  }
  check([], allTrue);
  
  bool allFalse(var e) {
    return false;
  }
  check([], allFalse);
  
  bool lessThan3(var e) {
    return e < 3;
  }
  check([], lessThan3);
  check(const [], lessThan3);
  check(new List(), lessThan3);
  check(new List(0), lessThan3);
  check(new List.from([]), lessThan3);
}

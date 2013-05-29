/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool every(bool f(E element))
 * Returns true if every elements of this collection satisify the predicate f.
 * Returns false otherwise.
 * @description Checks that the predicate method is called for each element until the first false result.
 * @author vasya
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

 //Checks that [every] calls [predicate] a [count] number of times
check(List a, bool predicate(var e), int count) {
  int actualCount = 0;
  a.every((var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(count, actualCount);
}

main() {
  bool allTrue(var e) {
    return true;
  }
  check([1, 2, 3, 4, 5], allTrue, 5);
  
  bool allFalse(var e) {
    return false;
  }
  check([1, 2, 3, 4, 5], allFalse, 1);
  
  bool lessThan3(var e) {
    return e < 3;
  }
  check([1, 2, 3, 4, 5], lessThan3, 3);
  check(const [1, 2, 3, 4, 5], lessThan3, 3);
  check(new List.from([1, 2, 3, 4, 5]), lessThan3, 3);
  List l = new List();
  l.addAll([1, 2, 3, 4, 5]);
  check(l, lessThan3, 3);
}

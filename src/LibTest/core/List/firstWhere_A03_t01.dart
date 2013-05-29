/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E firstWhere(bool test(E value), {E orElse()})
 * By default, when orElse is null, a StateError is thrown.
 * @description Checks that a StateError is thrown when orElse is null and none matches.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(List a) {
  try {
    a.firstWhere((int value)=>false);
    Expect.fail("StateError expected when calling a.first");
  } on StateError catch(ok) {}
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1,2,3]);
}

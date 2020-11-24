/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not an error for the body of a late field to reference this.
 *
 * @description Check that it is not an error for the body of a late field to
 * reference this.
 * @author sgrekhov@unipro.ru
 */
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  num pi = 3.14;
  late num p1 = this.p2;
  late final p2 = this.pi;
  late num? p3 = this.p4;
  late final num? p4 = this.pi;
}

main() {
  Expect.equals(3.14, new C().p1);
  Expect.equals(3.14, new C().p2);
}

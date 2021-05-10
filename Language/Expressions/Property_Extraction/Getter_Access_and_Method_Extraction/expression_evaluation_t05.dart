// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows:
 * First, the expression e is evaluated to an object o.
 * @description Check that function expression e is evaluated to an object
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int get m => 1;
}

A getA() {
  return new A();
}

main() {
  var f = getA().m;
  Expect.equals(1, f);
}

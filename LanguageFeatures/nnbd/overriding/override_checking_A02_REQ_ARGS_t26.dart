/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class is a mixin with legacy class,
 * migrated abstract method with non-required non-nullable parameter can
 * override legacy method with named parameter (which is nullable) with default
 * value.
 * @author iarkh@unipro.ru
 */
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

abstract class A with LEGACY_REQUIRED_ARGS {
  void test_default({int i});
}

class B extends A {
  void test_default({int i = 1}) { Expect.equals(1, i); }
}

main() {
  B().test_default();
}

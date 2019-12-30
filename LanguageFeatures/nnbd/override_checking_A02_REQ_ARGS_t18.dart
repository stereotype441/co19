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
 * @description Check that if opted-in class implements legacy class, migrated
 * method with non-required nullable parameter can override legacy method
 * with named parameter without default value.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "override_checking_legacy_lib.dart";
import "../../Utils/expect.dart";

class A1 implements LEGACY_REQUIRED_ARGS {
  void test_default({required int? i}) {}
  void test_nondefault({int? i}) { Expect.equals(1, i); }
}

class A2 implements LEGACY_REQUIRED_ARGS {
  void test_default({required int? i}) {}
  void test_nondefault({int? i}) { Expect.isNull(i);}
}

main() {
  A1().test_nondefault(i: 1);
  A2().test_nondefault();
}

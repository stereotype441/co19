// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion If a class [C] in an opted-in library overrides a member, it is an
 * error if its signature is not a subtype of the types of all overriden members
 * from all direct super-interfaces (whether legacy or opted-in). This implies
 * that override checks for a member m may succeed due to a legacy member
 * signature for [m] in a direct super-interface, even in the case where an
 * indirect super-interface has a member signature for [m] where the override
 * would be a compile-time error.
 *
 * @description Check that compile error does not appear when legacy class
 * inherits a setter from two opted in classes with contradictory nullability
 * information and than this setter is inherited again in the opted in code.
 *
 * @Issue 40414,41529
 * @author iarkh@unipro.ru
 */
// Requirements=nnbd-weak

import "override_checking_A03_opted_out_lib.dart";

class A extends LEGACY_SETTER_2 {
  void set setInt     (int?      i) {}
  void set setObject  (Object?   o) {}
  void set setFunction(Function? f) {}
}

class B extends LEGACY_SETTER_2 {
  void set setInt     (int      i) {}
  void set setObject  (Object   o) {}
  void set setFunction(Function f) {}
}

main() {
  A();
  B();
}

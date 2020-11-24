/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Legacy if T0 is S0* then:
 * - T0 <: T1 iff S0 <: T1.
 * @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
 * T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1.
 * Assignment to local variable is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_legacy_fail_A03.dart and 
 * local_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

X t0Instance = new X();
Null t1Instance = null;

const t1Default = null;




class LocalVariableTest {
  LocalVariableTest() {
    Null t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  test() {
    Null t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    Null t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  Null t1 = t0Instance;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    Null t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

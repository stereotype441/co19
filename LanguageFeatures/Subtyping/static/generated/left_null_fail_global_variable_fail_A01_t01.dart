// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that if type T0 is Null and T1 is FutureOr<S> for some S,
/// and Null is not subtype of S then T0 is not subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be be assigned to the to global variable of type T1.
/// Assignment to global variable is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_null_fail_A01.dart and 
/// global_variable_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



import "dart:async";

Null t0Instance = null;
FutureOr<Object> t1Instance = new Object();

const t1Default = const Object();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  foo() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static test() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  t1Instance = t0Instance;
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

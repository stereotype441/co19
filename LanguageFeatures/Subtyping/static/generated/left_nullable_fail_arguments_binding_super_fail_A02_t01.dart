// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Nullable: if T0 is S0? then:
 * - T0 <: T1 iff S0 <: T1 and Null <: T1
 * @description Check that if type T0 is S0? and Null <: T1 but S0 is not
 * subtype T1 then T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members. Super constructor
 * required argument is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_nullable_fail_A02.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


class T1 {
  const T1();
}
class S0 {
  const S0();
}

S0? t0Instance = new S0();
T1? t1Instance = new T1();

const t1Default = const T1();




class ArgumentsBindingSuper1_t02 {
  T1? m = t1Default;

  ArgumentsBindingSuper1_t02(T1? value): m = value {}
  ArgumentsBindingSuper1_t02.named(T1? value, {T1? val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(T1? value, [T1? val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1? val) {}
  void superTestPositioned(T1? val, [T1? val2 = t1Default]) {}
  void superTestNamed(T1? val, {T1? val2 = t1Default}) {}
  T1? get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(T1? val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(S0? t0) : super(t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c1(S0? t0) : super.named(t0) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c2(T1? t1, S0? t2) : super.named(t1, val2: t2) {}
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c3(S0? t0) : super.positional(t0) {}
//                                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c4(T1? t1, S0? t2) : super.positional(t1, t2) {}
//                                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c5(S0? t1) : super.short(t1) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified

  ArgumentsBinding1_t02.valid() : super(t1Default) {}

  test() {
    superTest(t0Instance);
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTest(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTest(t0Instance);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t0Instance);
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t0Instance);
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t1Instance, t0Instance);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t1Instance, t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t1Instance, t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t0Instance);
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t1Instance, val2: t0Instance);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t1Instance, val2: t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t1Instance, val2: t0Instance);
//                                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superSetter = t0Instance;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superSetter = t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ArgumentsBinding1_t02.valid().superTest(t0Instance);
//                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance);
//                                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance);
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance);
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance;
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().test();
}

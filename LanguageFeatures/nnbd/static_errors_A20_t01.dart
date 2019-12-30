/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on a non-nullable receiver.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a non-nullable receiver.
 * @author sgrekhov@unipro.ru
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {
  test() {}
}

class C extends A {}

main() {
  A a = A();
  C c = C();
  a?.test();                              //# 01: static type warning
  a?..test();                             //# 02: static type warning
  a ?? c;                                 //# 03: static type warning
  a ??= c;                                //# 04: static type warning
  List<C> clist = [C(), C()];
  List<A> alist = [A(), C(), ...? clist]; //# 05: static type warning
}

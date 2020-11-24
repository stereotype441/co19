/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is NORM(Ti)
 *
 * @description Checks that NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is
 * NORM(Ti). Test void?
 *
 * @author sgrekhov@unipro.ru
 */
// Requirements=nnbd-strong
class A<X> {}
class B<X> implements A<C<X?>> {}

class C<X> {}

class Test extends B<void> implements A<C<void>> {}

main() {
  new Test();
}

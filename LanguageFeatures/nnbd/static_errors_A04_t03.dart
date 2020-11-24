/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable or static variable with a
 * non-nullable type has no initializer expression unless the variable is marked
 * with the `late` modifier.
 *
 * @description Check that it is an error if a top level variable or static
 * variable with a non-nullable type has no initializer expression unless the
 * variable is marked with the `late` modifier. Test function type
 * @author sgrekhov@unipro.ru
 */
// Requirements=nnbd-strong
typedef void Foo();

Foo f;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static Foo f1;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}

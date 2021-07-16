// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let k be a generative constructor. Then k may include at most one
/// superinitializer in its initializer list or a compile-time error occurs.
/// @description Checks that it is a a compile-time error if a generative
/// constructor includes two identical superinitializers in its initializer list.
/// @author sgrekhov@unipro.ru

class A {
  A();
  A.foo();
}
typedef AAlias = A;

class B extends AAlias {
  B() : super.foo(), super.foo();
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new B();
}

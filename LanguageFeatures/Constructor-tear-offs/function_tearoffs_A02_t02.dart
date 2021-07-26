// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion These grammar changes allows type parameters without following
/// parenthesized arguments in places where we previously did not allow them.
/// For example, this means that <typeArguments> becomes a selector by itself,
/// not just followed by arguments.
//
// It applies to instance methods as well as local, static and top-level
// function declarations. For instance methods, it applies to references of the
// form
//
// instanceMethod<int> (with implicit this),
// object.instanceMethod<int> (including this) and super.instanceMethod<int>.
///
/// @description Checks tear-off of generic instance method
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

class C {
  C() {
    var x = instanceMethod<String>;
    x(3.14);
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

    x<int>(42);
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  T instanceMethod<T>(T t) => t;
}

main() {
  new C();
}

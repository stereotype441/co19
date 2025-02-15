// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The superclass of a class C that has a with clause with
/// M1,...,Mk and an extends clause extends S is the application of mixin
/// Mk*...*M1 to S. If no with clause is specified then the extends clause of a
/// class C specifies its superclass.
/// @description Checks that a class can indeed specify a superclass using the
/// extends clause and an instance of this class is also an instance of that
/// superclass. Test type aliases
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class A {}

typedef AAlias = A;

class B extends AAlias {}

main() {
  Expect.isTrue(new B() is A);
  Expect.runtimeIsType<A>(B());
}

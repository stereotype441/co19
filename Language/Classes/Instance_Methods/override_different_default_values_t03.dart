// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no static warning if an instance method m1 overrides an
/// instance member m2, the signature of m2 explicitly specifies a default 
/// value for a formal parameter p and the signature of m1 specifies a different 
/// default value for p.
///
/// @description Checks that it is no static warning if overridden and overriding
/// methods have different default values for their optional parameter. Test type
/// aliases
/// @issue 27476
/// @author sgrekhov@unipro.ru

class A {
  foo([x = '']) {}
}

typedef AAlias = A;

class C extends AAlias {
  foo([x = 1]) {
  }
}

main() {
  new A().foo(2);
  new C().foo(1);
}

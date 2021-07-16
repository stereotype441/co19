// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static warning if an instance method m1 overrides an 
/// instance member m2 and m1 does not declare all the named parameters declared 
/// by m2.
/// @description Checks that a compile error is produced if m1 has fewer named
/// parameters than m2 (1 vs. 0) and neither have any required parameters. Test
/// type aliases
/// @author sgrekhov@unipro.ru

class A {
  f({var x}) {}
}
typedef AAlias = A;

class C extends AAlias {
  f() { }
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A().f(x: 1);
  new C().f();
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if M is not the name of the immediately
 * enclosing class or the name of an interface in the enclosing lexical scope.
 * @description Checks that it is fine if M is a name of an arbitrary class, since
 * all classes have an implied interface.
 * @author iefremov
 * @reviewer kaigorodov
 */

class Z{}

class C {
  C() {}
  factory Z() {}
}

main() {
  new C();
}

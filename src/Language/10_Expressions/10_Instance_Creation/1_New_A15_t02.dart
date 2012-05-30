/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given an instance creation expression of the form
 * new T(a1, .., an), it is a static warning if T is an
 * abstract class or an interface that does not have a default implementation class.
 * @description Checks that instantiation of class with an abstract method produces a static warning.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  abstract f();
}

main() {
  new C();
}

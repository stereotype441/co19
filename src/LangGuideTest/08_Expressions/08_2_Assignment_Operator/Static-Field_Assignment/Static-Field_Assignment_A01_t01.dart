/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static-field assignment is of the form C.identifier = rhs.
 * Where: 
 * C is a (qualified) name of a class. It is a resolution error if C is an interface, a function alias, or a type variable.
 * identifier is a simple identifier.
 * rhs is expression.
 * @description Check that static-field assignment is a valid expression
 * @author msyabro
 * @reviewer pagolubev
 */


class A {
  static var x;
}


main() {
  A.x = 1;
}

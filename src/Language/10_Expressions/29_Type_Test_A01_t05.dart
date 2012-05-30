/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression tests if an object is a member of a type.
 * typeTest:
 *  isOperator type
 * ;
 * isOperator:
 *   is '!'?
 * ;
 * @description Checks that it is a compile-time error if
 * using a statement that does not yield a value in the left part of the expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main () {
  try {
    if(1 < 2) {} is bool;
  } catch(var e) {}
}

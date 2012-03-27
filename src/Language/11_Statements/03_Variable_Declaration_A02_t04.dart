/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement var id; or var id = e; introduces
 * a new variable named id with static type Dynamic into the innermost enclosing scope.
 * @description Checks that a variable is introduced into the scope
 * after a variable declaration statement is evaluated. Using it (the variable)
 * in the statement produces a compile-time error.
 * @compile-error
 * @author msyabro
 */

main() {
  try {
    var i = i;
  } catch (var ok) {}
}


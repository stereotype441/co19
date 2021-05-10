// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile-time error if either a key or a value of an
 * entry in a constant map literal is not a compile-time constant.
 * @description Checks that it is a compile-time error if the key is some
 * object.
 * @compile-error
 * @author hlodvig
 */
class A{}

main() {
  var arr = const {new A(): 1};
}

// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion If f is marked sync*, then a fresh instance i implementing
 * the built-in class Iterable is associated with the invocation and
 * immediately returned.
 *    A Dart implementation will need to provide a specific implementation of
 *  Iterable that will be returned by sync* methods. A typical strategy would
 *  be to produce an instance of a subclass of class IterableBase defined in
 *  dart:core. The only method that needs to be added by the Dart
 *  implementation in that case is iterator.
 *
 * @description Check that a fresh instance of Iterable is returned to the
 * caller of sync generator.
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

Iterable test() sync* {
  yield 1;
}

main() {
  Set history = new Set.identity();
  for (var i = 0; i < 10; i++) {
    Iterable s = test();
    Expect.isFalse(history.contains(s));
    history.add(s);
  }
}

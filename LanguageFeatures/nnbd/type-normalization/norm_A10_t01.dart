/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   void* == void
 *
 * @description Checks that void* == void
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'opted_out_lib.dart';

main() {
  var v = getLegacyType<void>(42);
  void v1 = v;
  void v2 = "Lily was here";
  v = v2;
}

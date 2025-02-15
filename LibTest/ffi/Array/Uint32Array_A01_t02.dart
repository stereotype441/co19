// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint32Array extension Null safety
/// Bounds checking indexing methods on Arrays of Uint32.
///
/// @description Checks that this extension contains bounds checking indexing
/// methods on Arrays of Uint32
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct extends Struct {
  @Array(2)
  external Array<Uint32> a0;
  @Array.multi([2, 3])
  external Array<Array<Uint32>> a1;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array1 = pointer.ref.a0;
    Expect.throws(() {array1[3];});
    Expect.throws(() {array1[3] = 42;});

    final array2 = pointer.ref.a1;
    Expect.throws(() {array2[3][0];});
    Expect.throws(() {array2[3][0] = 42;});
    Expect.throws(() {array2[0][3];});
    Expect.throws(() {array2[0][3] = 42;});
  } finally {
    calloc.free(pointer);
  }
}

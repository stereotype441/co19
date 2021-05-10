// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion
 * const Array<T extends NativeType>.multi(List<int> dimensions)
 *  Const constructor to specify Array dimensions in Structs.
 *
 *  class MyStruct extends Struct {
 *  @Array.multi([2, 2, 2])
 *  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
 *
 * @Array.multi([2, 2, 2, 2, 2, 2, 2, 2])
 *  external Array<Array<Array<Array<Array<Array<Array<Array<Uint8>>>>>>>> eightDimensionalInlineArray;
 *  }
 *  Do not invoke in normal code.
 *
 * @description Checks multidimentional array created by Array.multi(). Check
 * zero array size
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "package:ffi/ffi.dart";

class MyStruct extends Struct {
  @Array.multi([0, 1])
  external Array<Array<Int8>> a0;

  @Array(0, 1, 0, 1)
  external Array<Array<Array<Array<Int8>>>> a1;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    pointer.ref.a0;
    pointer.ref.a1;
  } finally {
    calloc.free(pointer);
  }
}


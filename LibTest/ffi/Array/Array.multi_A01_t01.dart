// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// const Array<T extends NativeType>.multi(List<int> dimensions)
///  Const constructor to specify Array dimensions in Structs.
///
///  class MyStruct extends Struct {
///  @Array.multi([2, 2, 2])
///  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
///
/// @Array.multi([2, 2, 2, 2, 2, 2, 2, 2])
///  external Array<Array<Array<Array<Array<Array<Array<Array<Uint8>>>>>>>> eightDimensionalInlineArray;
///  }
///  Do not invoke in normal code.
///
/// @description Checks multidimentional array created by Array.multi()
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class MyStruct extends Struct {
  @Array.multi([1, 2, 3, 4, 5, 6])
  external Array<Array<Array<Array<Array<Array<Uint8>>>>>> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;

    for (int i1 = 0; i1 < 1; i1++) {
      for (int i2 = 0; i2 < 2; i2++) {
        for (int i3 = 0; i3 < 3; i3++) {
          for (int i4 = 0; i4 < 4; i4++) {
            for (int i5 = 0; i5 < 5; i5++) {
              for (int i6 = 0; i6 < 5; i6++) {
                Expect.equals(0, array[i1][i2][i3][i4][i5][i6]);
                array[i1][i2][i3][i4][i5][i6] = i1 + i2 + i3 + i4 + i5 + i6;
                Expect.equals(
                    i1 + i2 + i3 + i4 + i5 + i6, array[i1][i2][i3][i4][i5][i6]);
              }
            }
          }
        }
      }
    }
    Expect.throws(() {
      array[-1];
    });
    Expect.throws(() {
      array[1];
    });
    Expect.throws(() {
      array[0][-1];
    });
    Expect.throws(() {
      array[0][2];
    });
    Expect.throws(() {
      array[0][1][-1];
    });
    Expect.throws(() {
      array[0][1][3];
    });
    Expect.throws(() {
      array[0][0][0][-1];
    });
    Expect.throws(() {
      array[0][1][2][4];
    });
    Expect.throws(() {
      array[0][0][0][0][-1];
    });
    Expect.throws(() {
      array[0][1][2][3][5];
    });
    Expect.throws(() {
      array[0][0][0][0][0][-1];
    });
    Expect.throws(() {
      array[0][1][2][3][4][6];
    });
  } finally {
    calloc.free(pointer);
  }
}

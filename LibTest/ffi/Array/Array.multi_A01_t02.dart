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
/// @description Checks multidimentional array created by Array.multi(). Check
/// wrong array size
/// @author sgrekhov@unipro.ru
/// @issue 46085

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class MyStruct extends Struct {
  @Array.multi([])
//^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external Array<Int16> a0;

  @Array.multi([1])
//^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external Array<Array<Int16>> a1;
}

void main() {
  MyStruct? ms = null;
}

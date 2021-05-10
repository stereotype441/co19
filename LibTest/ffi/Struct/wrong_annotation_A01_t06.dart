// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion All field declarations in a Struct subclass declaration must
 * either have type int or float and be annotated with a NativeType representing
 * the native type, or must be of type Pointer.
 *
 * @description Checks that it is a compile error if double field is annotated
 * as NativeType
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";

class S1 extends Struct {
  @NativeType()
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

class S2 extends Struct {
  @NativeType()
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external int x;
//             ^
// [cfe] unspecified
}

void main() {
  S1? s1;
  S2? s2;
}

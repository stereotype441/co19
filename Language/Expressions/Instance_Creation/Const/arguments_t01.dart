// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a constant object expression of the form
/// const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) or the form
/// const T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k). It is a compile-time
/// error if ai, 1 < = i <= n + k, is not a compile-time constant expression.
/// @description Checks that it is a compile-time error if any positional
/// arguments of a constant object expression are not compile-time constants.
/// @author msyabro


class  T {
  const T(p1, p2, p3);
}

main() {
  Object o = Object();
  const T(1, o, 2);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if any of the following refutable patterns appear
/// in an irrefutable context:
/// - Logical-or
/// - Relational
/// - Null-check
/// - Constant
///
/// @description Checks that it is a compile-time error if logical-or pattern
/// appears in irrefutable context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var x1 || x1 = 42;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  final (int x2) || (int x2) = 42;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  var [x3, ...] || [x3, _] = [1, 2];
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": int x4} || {"key1": int x4} = {"key1": 1};
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  var (num x5, n: String x6) || (num x5, n: String x6) = (3.14, n: "pi");
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(:areaAsInt) || Square(:areaAsInt) = Square(2);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  var (x6 || x6) = 42;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  final ((int x7) || (int x7)) = 42;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

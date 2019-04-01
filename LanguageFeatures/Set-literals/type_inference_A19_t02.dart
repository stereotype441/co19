/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 * ...
 * If P is Map<Pk, Pv> then let S be the inferred type of e1 in context P:
 * ...
 * Otherwise it is an error.
 *
 @description Checks that otherwise it is an error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

main() {
  var s = [1, 2, 3];
  var m = {1:1, 2: 2};
  var x1 = <int, int>{...s, ...m};       //# 01: compile-time error
  var x2 = <int, int>{...?s, ...?m};     //# 02: compile-time error
}

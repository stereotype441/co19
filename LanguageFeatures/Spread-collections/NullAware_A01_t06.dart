/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To handle these gracefully, we support a [...?] "null-aware
 * spread" operator. In cases where the spread expression evaluates to [null],
 * that expands to an empty collection instead of throwing a runtime expression.
 *
 *  That turns the example to:
 *
 *   var command = [
 *   engineDartPath,
 *   '--target=flutter',
 *   ...?extraFrontEndOptions,
 *   mainPath
 *   ];
 * @description Checks that exception is thrown if spreadable element in the
 * [Map] is not null-aware and it's [null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

import "../../Utils/expect.dart";

Map getAMap(
    String engineDartPath, Map extraFrontEndOptions, String mainPath) {
  return({1: engineDartPath, 2: '--target=flutter', ...extraFrontEndOptions,
      3: mainPath});
}

main() {
  Map a;
  Expect.mapEquals(
      {1: "enginePath", 2: "--target=flutter", 0: "--option1", 3: "mainPath"},
      getAMap("enginePath", {0: "--option1"}, "mainPath"));

  Expect.throws(() => a = getAMap("enginePath", null, "mainPath"));
}

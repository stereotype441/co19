/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that null flags arguments can be used.
 * @author rodionov
 * @reviewer iefremov
 * @reviewer msyabro
 * @needsreview undocumented. Do we need this test?
 */

main() {
  RegExp re = new RegExp(r".", multiLine: null, ignoreCase: null);
  Expect.isFalse(re.firstMatch("a") == null);

  re = new RegExp(r".", multiLine: null, ignoreCase: null);
  Expect.isFalse(re.firstMatch("b\na") == null);

  re = new RegExp(r".", multiLine: null, ignoreCase: null);
  Expect.isFalse(re.firstMatch("A") == null);
}

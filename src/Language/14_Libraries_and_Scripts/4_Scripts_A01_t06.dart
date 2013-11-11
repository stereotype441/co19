#! scripts tag
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library whose exported namespace includes a
 * top-level function main().
 *
 * libraryDefinition:
 *   scriptTag? libraryName? libraryImport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-time error when an import directive
 * comes before the library name.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

import "4_Library1.dart";
library Parts_test_lib;
part "3_Part_0.dart";

main() {
}

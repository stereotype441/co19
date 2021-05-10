// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion If an unqualified identifier lexically resolves to an extension
 * method of the surrounding extension, then that identifier is not equivalent
 * to this.id, rather the invocation is equivalent to an explicit invocation of
 * that extension method on this (which we already know has a compatible type
 * for the extension): Ext<T1,…,Tn>(this).id, where Ext is the surrounding
 * extension and T1 through Tn are its type parameters, if any. The invocation
 * works whether or not the names of the extension or parameters are actually
 * accessible, it is not a syntactic rewrite.
 *
 * @description Check that extension member resolves to an extension method of
 * the surrounding extension
 * @author sgrekhov@unipro.ru
 */

import "../../Utils/expect.dart";

extension MyUnaryNumber on List<Object> {
  bool get isEven => length.isEven;
  bool get isOdd => !isEven;
  static bool isListEven(List<Object> list) => list.isEven;
}

main() {
  List<Object> list = [3, 1, 4, 1];
  Expect.isTrue(list.isEven);
  Expect.isFalse(list.isOdd);
  Expect.isTrue(MyUnaryNumber.isListEven(list));
}

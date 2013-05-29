/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * Returns an Iterable that iterators over the elements in the range start to end exclusive.
 * The result of this function is backed by this.
 * @description Checks lists with valid ranges.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List src, int start, int length) {
  Iterator dst = src.getRange(start, start+length).iterator;
  for(int i = 0; dst.moveNext; i++) {
    Expect.equals(src[i+start], dst.current);
    Expect.identical(src[i+start], dst.current);
  }
}

main() {
  List l = new List(100);
  for (var i = 0; i < l.length; i++){
    l[i] = i;
  }
  check(l, 0, 100);
  check(l, 0, 1);
  check(l, 99, 1);
  check(l, 90, 9);

  l = [];
  for (var i = 0; i < 100; i++){
    l.add(i);
  }
  check(l, 0, 100);
  check(l, 0, 1);
  check(l, 99, 1);
  check(l, 90, 9);

  l = new List.from([]);
  for (var i = 0; i < 100; i++){
    l.add(i);
  }
  check(l, 0, 100);
  check(l, 0, 1);
  check(l, 99, 1);
  check(l, 90, 9);
}

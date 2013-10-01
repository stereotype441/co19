/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new LinkedList()
 * Construct a new empty linked list.
 * @description Checks that created list is empty and resizable.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(LinkedList l) {
  Expect.equals(0, l.length);
  l.add(new MyLinkedListEntry(null));
  Expect.equals(1, l.length);
  l.clear();
  Expect.equals(0, l.length);
  l.add(new MyLinkedListEntry(1));
  Expect.equals(1, l.length);
  l.remove(l.last);
  Expect.equals(0, l.length);
}

main() {
  check(new LinkedList<String>());
  check(new LinkedList());
}

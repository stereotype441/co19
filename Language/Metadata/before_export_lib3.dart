// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=generic-metadata
library before_export_lib3;

@A<String>() export 'before_export_lib2.dart';

class A<T> {
  const A();
}

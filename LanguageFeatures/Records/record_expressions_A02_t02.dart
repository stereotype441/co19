// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record is created using a record expression. The grammar is:
///
/// literal      ::= record
///                | // Existing literal productions...
/// record       ::= 'const'? '(' recordField ( ',' recordField )* ','? ')'
/// recordField  ::= (identifier ':' )? expression
///
/// This is identical to the grammar for a function call argument list. There
/// are a couple of syntactic restrictions not captured by the grammar. It is a
/// compile-time error if a record has any of:
///
/// The same field name more than once.
///
/// Only one positional field and no trailing comma.
///
/// No fields and a trailing comma. The expression (,) isn't allowed.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $1: 'named') since the named field '$1' collides
/// with the getter for the first positional field.
///
/// @description Checks that it is no error if a record has no named fields and
/// only one positional field but with a trailing comma
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

(int,) foo1() => (1,);

(int,) foo2() => ((2),);

((int,),) foo3() => ((3,),);

dynamic bar(Record r) => r;

main() {
  var r1 = (1,);
  var r2 = ((2),); // The same as (2,)
  var r3 = ((3,),);

  Expect.equals(1, r1.$1);
  Expect.equals(2, r2.$1);
  Expect.equals(3, r3.$1.$1);

  Expect.equals(1, foo1().$1);
  Expect.equals(2, foo2().$1);
  Expect.equals((3,), foo3().$1);
  Expect.equals(("Hello",), bar(("Hello",)));
  Expect.equals(("Hello",), bar((("Hello"),)));
}

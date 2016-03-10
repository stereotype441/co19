/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for cssText of ':host()' rule.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new DocumentFragment.html(''' 
    <style id="style1">
    .foo:host(div, body.mytheme, p#myid, .bar:active, span:hover) > div { display: block; }
    :host { display: block; }
    :host(*) { display: block; }
    </style>
    <style id="style-invalid">
    :host(div div) { display: block }
    :host(div > div) { display: block }
    :host(div + div) { display: block }
    :host(div ~ div) { display: block }
    :host) { display: block }
    :host() { display: block; }
    :host(div::before) { display: block; }
    :host(.x::after) { display: block; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  StyleElement se1 = document.getElementById('style1');
  CssStyleSheet sh1 = se1.sheet;

  shouldBeLikeString(
      sh1.cssRules[0].cssText,
      ".foo:host(div,body.mytheme,p#myid,.bar:active,span:hover) > div { display: block; }");
  shouldBeLikeString(sh1.cssRules[1].cssText, ":host { display: block; }");
  shouldBeLikeString(sh1.cssRules[2].cssText, ":host(*) { display: block; }");

  StyleElement se2 = document.getElementById('style-invalid');
  CssStyleSheet sh2 = se2.sheet;
  shouldBe(sh2.cssRules.length, 0);
}

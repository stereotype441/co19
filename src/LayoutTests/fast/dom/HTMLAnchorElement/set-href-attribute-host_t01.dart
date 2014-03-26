/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setting the host attribute of the URL in HTMLAnchorElement.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var a = document.createElement('a');

  debug("Basic test");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:0";
  shouldBe(a.href, 'https://www.otherdomain.com:0/path/');

  debug("Set host without port");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com";
  shouldBe(a.href, 'https://www.otherdomain.com:8080/path/');

  // IE8 throws "The URL is invalid" exception.
  debug("Set host with '?' in it");
  a.href = "https://www.mydomain.com:8080/path/?key=value";
  a.host = "www.other?domain.com:8080";
  shouldBe(a.href, 'https://www.other/?domain.com:8080/path/?key=value');

  debug("Set default port for another protocol");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:80";
  shouldBe(a.href, 'https://www.otherdomain.com:80/path/');

  debug("Set default port");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:443";
  shouldBe(a.href, 'https://www.otherdomain.com/path/');

  debug("Set host with invalid port");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:invalid";
  shouldBe(a.href, 'https://www.otherdomain.com:0/path/');

  // Firefox 3.5.2 rejects a port that contains non-digits.
  debug("Set host with letters in port number");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:44a5";
  shouldBe(a.href, 'https://www.otherdomain.com:44/path/');

  // Firefox 3.5.2 ignores the leading space in the port, but errs on reparsing the port.
  debug("Leading space in port number");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com: 443";
  shouldBe(a.href, 'https://www.otherdomain.com:0/path/');

  // Firefox 3.5.2 removed the port, clearly against the spec .
  debug("Colon without port number");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.otherdomain.com:";
  shouldBe(a.href, 'https://www.otherdomain.com:0/path/');

  //debug("Set host to null");
  //a.href = "https://www.mydomain.com:8080/path/";
  //a.host = null;
  //shouldBe(a.href, 'https://null:8080/path/');

  // Both IE8 and Firefox 3.5.2 allow setting the host to empty string, which they shouldn't, per
  // http://dev.w3.org/html5/spec/infrastructure.html#url-decomposition-idl-attributes .
  // Since both do that in a buggy way, WebKit does not follow either one of them.
  debug("Set host to empty string");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "";
  shouldBe(a.href, 'https://www.mydomain.com:8080/path/');

  // Firefox 3.5.2 does not `set the host for file: .
  debug("Set host to URL with file: protocol");
  a.href = "file:///path/";
  a.host = "mydomain.com";
  shouldBe(a.href, 'file://mydomain.com/path/');

  // IE8 throws if the host contains '/'
  debug("Set host containing slashes in it");
  a.href = "https://www.mydomain.com:8080/path/";
  a.host = "www.other\dom/ain.com";
  shouldBe(a.href, 'https://www.otherdom%2Fain.com:8080/path/');

  // WebKit fails to strip the \r in the authority, and therefore treats the URL as invalid
  // and gets a different result than Firefox or Chrome; we should probably strip it
  debug("Set host to a malformed URL");
  a.href = "https:/\rww.my@domain.com:8080/path/";
  a.host = "www.other!domain.com:15";
  shouldBe(a.href, 'https:/\\rww.my@domain.com:8080/path/');

  // IE8 throws an "Object Error" exception.
  // Firefox 3.5.2 accepts this but throws an exception later
  // WebKit should just reject
  debug("Set host that starts with ':'");
  a.href = "https://domain.com:8080/path/";
  a.host = ":www.otherdomain.com:15";
  shouldBe(a.href, 'https://domain.com:8080/path/');

  // IE8 throws a security exception if the host contains '@'
  debug("Set host to URL containing username and ..");
  a.href = "https://rwwmy@domain.com:8080/pa..th/";
  a.host = "www.other!domain.com:25";
  shouldBe(a.href, 'https://rwwmy@www.other!domain.com:25/pa..th/');

  // Both IE8 and Firefox append the hosts, instead of rejecting, per
  // http://dev.w3.org/html5/spec/infrastructure.html#url-decomposition-idl-attributes .
  debug("Set host to a URL with tel: protocol");
  a.href = "tel:+1-816-555-1212";
  a.host = "+1-800-555-1212";
  shouldBe(a.href, 'tel:+1-816-555-1212');
}


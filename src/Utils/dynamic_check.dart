library dynamic_check;

isCheckedMode() {
  try {
    var i = 1;
    String s = i;
    return false;
  } catch(e) {
    return true;
  }
}

checkTypeError(f()) {
  if(isCheckedMode()) {
    try {
      f();
      Expect.fail("Type error expected in checking mode");
    } on TypeError catch(ok) {
    }
  } else {
    try {
      f();
    } on TypeError catch(bad) {
      Expect.fail("Unexpected type error in scripting mode: $bad");
    }
  }
}

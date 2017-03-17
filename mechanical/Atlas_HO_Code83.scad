LENGTH  = 228.6;
TIE     = 2.48;
BETWEEN = LENGTH / 37; // 3.7
// 19.8, 15.8

module tie() {
  color("saddlebrown")
  cube([28.5, TIE, 2.15], true);
}
module rail() {
  color("saddlebrown")
  cube([1, LENGTH + TIE - BETWEEN * 3, 2.15], true);

  color("goldenrod")
  translate([0, 0, 2.1])
  union() {
    cube([0.6, LENGTH, 2.05], true);
    translate([0, 0, 0.525])
    cube([0.95, LENGTH, 1], true);
    translate([0, 0, -0.8])
    cube([2, LENGTH, 0.45], true);
  }
}
module track() {
  translate([0, 0, 2.15/2]) {
    //tie();
    for (i = [1:18]) {
      translate([0, i*BETWEEN, 0])
      tie();
      translate([0, -i*BETWEEN, 0])
      tie();
    }

    translate([8.725, 0, 0]) {
      rail();
    }
    translate([-8.725, 0, 0]) {
      rail();
    }
  }
}
// Rev 1.1
module beacon() {
  color("darkslategray")
  translate([0, 0, 0.8 + 0.55])
  union() {
    cube([16, 9.6, 1.6], true);
    cube([24, 2.4, 1.6], true);
  }
}

track();
beacon();
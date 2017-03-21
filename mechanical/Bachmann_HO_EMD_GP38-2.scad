$fn = 36;

PCBwidth = 16;
PCBlength = 97;
PCBthickness = 0.8;

module screwHole() {
  cylinder(1, d = 2, center = true);
}

// Side tabs are 4mm long and 2.5mm wide
// Their cutouts are 4.5mm deep and 5.6mm wide
module sideTabs() {
  difference() {
    cube([18, 5.6, 1], true);
    cube([15, 2.5, 1.2], true);
    cube([7, 6, 1.2], true);
  }
}

module frontTabs() {
  difference() {
    cube([18, 5, 1], true);
    cube([4.8, 6, 1.2], true);
    translate([-5.2, 0, 0])
    cube([2.5, 6, 1.2], true);
    translate([5.2, 0, 0])
    cube([2.5, 6, 1.2], true);
  }
}

module PCB() {
  color("green")
  difference() {
    cube([PCBwidth, PCBlength, PCBthickness], true);
    translate([0, -PCBlength / 2, 0]) {
      translate([0, 7, 0])
      union() {
        cube([2, 1, 1], true);
        translate([0, -0.5, 0])
        cylinder(1, d = 2, center = true);
        translate([0, 0.5, 0])
        cylinder(1, d = 2, center = true);
      }
      translate([0, 12.8, 0])
      cylinder(1, d = 5, center = true);
      translate([0, 22.1, 0])
      sideTabs();
    }
    translate([0, PCBlength / 2, 0]) {
      translate([0, -24.8, 0])
      sideTabs();
      translate([0, -14.8, 0])
      sideTabs();
      translate([0, -9.8, 0])
      cylinder(1, d = 2, center = true);
      translate([0, -1.5, 0])
      frontTabs();
    }
  }
}

PCB();
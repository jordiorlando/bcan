TIE     = 2.4;
BETWEEN = 3.7;
// 19.8, 15.8

module tie() {
    color("saddlebrown")
    cube([28.5, TIE, 2.15], true);
}
module rail() {
    color("saddlebrown")
    cube([2, 209.8, 2.15], true);

    color("goldenrod")
    translate([0, 0, 2.1])
    cube([1.1, 228.6, 2.05], true);
}
module track() {
    translate([0, 0, 2.15/2]) {
        tie();
        for (i = [1:18]) {
            translate([0, i*(TIE+BETWEEN), 0])
            tie();
            translate([0, -i*(TIE+BETWEEN), 0])
            tie();
        }

        translate([8.9, 0, 0]) {
            rail();
        }
        translate([-8.9, 0, 0]) {
            rail();
        }
    }
}
module beacon() {
    color("green")
    translate([0, (TIE + BETWEEN)/2, 0.8 + 0.55])
    cube([28, 3.5, 1.6], true);
}

track();
beacon();
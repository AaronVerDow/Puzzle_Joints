use <puzzle_joints.scad>;

wood_x=80;
wood_y=60;
wood_z=10;

pad=0.1;
//explode=(sin($t*360)/2+0.5)*wood_z*3;
explode=0;

pad=0.1;
minimum=5;
step=15;
gap=1;

display_pad=0;

// PREVIEW
// RENDER scad
module test() {
    test_blank();
    translate([0,-wood_y,wood_z])
    mirror([0,0,1])
    test_tab();
}
module test_blank() {
    color("lime")
    translate([0,0,-explode])
    difference() {
        translate([-wood_x/2,0,0])
        cube([wood_x,wood_y,wood_z]);

        translate([0,0,-pad])
        linear_extrude(height=wood_z+pad*2)
        inner_puzzle_tail(wood_x,minimum+step,step,0,gap/2);

        translate([0,0,wood_z/2])
        linear_extrude(height=wood_z)
        inner_puzzle_tail(wood_x,minimum+step,step,step,gap/2);
    }
}

module test_tab() {
    color("magenta")
    translate([0,0,explode]) {
        translate([-wood_x/2,-wood_y/3,0])
        cube([wood_x,wood_y/3,wood_z]);

        linear_extrude(height=wood_z-display_pad)
        inner_puzzle_tail(wood_x,minimum+step,step,0,-gap/2);

        translate([0,0,wood_z/2])
        linear_extrude(height=wood_z/2-display_pad)
        inner_puzzle_tail(wood_x,minimum+step,step,step,-gap/2);
    }
}



include <../src/test.scad>;

explode=(sin($t*360)/2+0.5)*wood_z*2;

// PREVIEW
// RENDER scad
// RENDER gif
module demo() {
    test_blank();
    test_tab();
}

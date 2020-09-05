include <../src/test.scad>;

gap=(sin($t*360)/2+0.5)*35;

// PREVIEW
// RENDER scad
// RENDER gif
module demo() {
    test();
}

// PREVIEW
// RENDER scad
// RENDER gif
module mated() {
    test_tab();
    test_blank();
}

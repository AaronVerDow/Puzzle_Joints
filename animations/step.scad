include <../src/test.scad>;

step=(sin($t*360)/2+0.5)*30;

// PREVIEW
// RENDER scad
// RENDER gif
module demo() {
    test();
}

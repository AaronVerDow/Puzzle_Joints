include <../src/test.scad>;

minimum=(sin($t*360)/2+0.5)*20;

// PREVIEW
// RENDER scad
// RENDER gif
module demo() {
    test();
}

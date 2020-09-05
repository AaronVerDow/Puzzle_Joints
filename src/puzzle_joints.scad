function segment_radius(height, chord) = (height/2)+(chord*chord)/(8*height);
function segment_height(radius, chord) = radius*(1-cos(asin(chord/2/radius)));
function tab(width) = width/2;
puzzle_padding=0.1;
puzzle_fn=200;

module puzzle_pin(width, depth, inner_height, outer_height) {
    
}

module dirror_x(x=0) {
    children();
    mirror([1,0])
    children();
}

module inner_puzzle_tail(width,minimum=0,step=0,this_step=0,gap=0,stem_h=0,pad=puzzle_padding,fn=puzzle_fn) {
    tab=tab(width)-step/2;
    stem=width/3-step/2;
    $fn=puzzle_fn;

    min_angle = asin((minimum/2+stem/2)/(tab/2+minimum/2));

    adj = (stem/2+minimum/2)/tan(min_angle);


    difference() {
        union() {
            //translate([0,tab/2-segment_height(tab/2,stem)+stem_h]) {
            translate([0,adj+minimum/2]) {
                circle(d=tab+this_step+gap);
                //dirror_x() rotate([0,0,min_angle]) translate([0,-tab/2-minimum/2]) circle(d=minimum);
            }

            hull()
            dirror_x()
            translate([0,adj+minimum/2])
            rotate([0,0,180+min_angle])
            square([1,tab/2+minimum/2]);


            
            translate([0,minimum/4-pad/2])

            square([stem+minimum,minimum/2+pad],center=true);

            translate([-width/2-pad,-pad])
            square([width+pad*2,this_step/2+pad+gap/2]);


        }
        translate([0,adj+minimum/2])
        dirror_x() rotate([0,0,min_angle]) translate([0,-tab/2-minimum/2]) circle(d=minimum-this_step-gap);
    }
}

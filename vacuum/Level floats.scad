jar_inner_diameter     = 168;

float_width            = 30;
float_depth            = 25;
float_height           = 15;

magnet_width           = 6.5;
magnet_depth           = 3;

shaft_diameter         = 10;
shaft_inset            = 12;

standoff_width         = 1;
standoff_depth         = 0.75;

epsilon                = 0.1;
$fn = 120;


translate([0, -jar_inner_diameter/2 + float_depth/2 , 0])
    difference() {
        union() {
            cylinder(h=float_height, d=jar_inner_diameter);
            
            // +ve x stand-off
            translate([float_width/2 - standoff_width - 0*epsilon, 0, 0])
                cube(size = [standoff_width, jar_inner_diameter/2 - 0.5, float_height]);
            // -ve x stand-off
            translate([-float_width/2 + 0.00001*standoff_width - 0*epsilon, 0, 0])
                cube(size = [standoff_width, jar_inner_diameter/2 - 0.5, float_height]);

        }
        union() {
            // rear
            translate([-jar_inner_diameter/2, -jar_inner_diameter/2, -epsilon])
                cube(size = [jar_inner_diameter, jar_inner_diameter - float_depth, float_height+2*epsilon]);
            // +ve x
            translate([float_width/2, 0, -epsilon])
                cube(size = [jar_inner_diameter, jar_inner_diameter, float_height+2*epsilon]);
            // -ve x
            translate([-jar_inner_diameter-float_width/2, 0, -epsilon])
                cube(size = [jar_inner_diameter, jar_inner_diameter, float_height+2*epsilon]);

            // mounting hole
            translate([0, jar_inner_diameter/2 - shaft_inset, -epsilon])
                cylinder(h=float_height+2*epsilon, d=shaft_diameter);
            translate([0, jar_inner_diameter/2 - shaft_inset-1, -epsilon])
                cylinder(h=float_height+2*epsilon, d=shaft_diameter);
            // was -2 before but shifted it forward so the float has a bit more room between the pole and the jar
            translate([0, jar_inner_diameter/2 - shaft_inset+1, -epsilon]) 
                cylinder(h=float_height+2*epsilon, d=shaft_diameter);

            // magnet inset
            translate([-magnet_width/2, jar_inner_diameter/2 - magnet_depth, -epsilon])
                cube(size = [magnet_width, magnet_depth, float_height/2+2*epsilon]);
        }
    }
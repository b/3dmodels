resolution = 180;

/*
bore_diameter = 10;
bore_clearance = 0.1;
bore = bore_diameter + bore_clearance;
slack_bore = bore + bore_clearance;

nut_diameter = 18.9; // M6 - 11.05, M8 - 14.38, M10 18.9
nut_clearance = 0.2;
nut_length = 30;
nut = nut_diameter + nut_clearance;

base_height = 5;

ring_diameter = 35;

handle_diameter = 75;
part_spacing = 5;
*/

bore_diameter = 8;
bore_clearance = 0.1;
bore = bore_diameter + bore_clearance;
slack_bore = bore + bore_clearance;

nut_diameter = 14.38; // M6 - 11.05, M8 - 14.38, M10 18.9
nut_clearance = 0.2;
nut_length = 25;
nut = nut_diameter + nut_clearance;

base_height = 5;

ring_diameter = 25;

handle_diameter = 60;
part_spacing = 5;

difference() {
    union() {
        cylinder(h=(nut_length + 1), d=ring_diameter, center=false, $fn=resolution);
        cylinder(h=(base_height * 2), d1=(ring_diameter * 2), d2=ring_diameter, center=false, $fn=resolution);
        cylinder(h=base_height, d=handle_diameter, center=false, $fn=16);
    }
    
    translate([0, 0, 1]) {
        cylinder(h=nut_length, d=nut, center=false, $fn=6);
    }
    
    cylinder(h=1, d=bore, center=false, $fn=resolution);
}

translate([(handle_diameter / 2) + (ring_diameter / 2) + part_spacing, 0, 0]) {
    difference() {
        union() {
            cylinder(h=base_height, d=ring_diameter, center=false, $fn=resolution);
            translate([0, 0, (base_height - (ring_diameter / 2))]) {
                difference() {
                    translate([0, 0, (ring_diameter / 2)]) {
                        sphere(d=ring_diameter, $fn=resolution);
                    }
                    cylinder(h=(ring_diameter / 2), d=ring_diameter, $fn=resolution);
                }
            }
        }
        
        translate([0, 0, (base_height + (ring_diameter / 2) - 1)]) {
            cylinder(h=base_height, d=ring_diameter, $fn=resolution);
        }

        cylinder(h=(base_height + (ring_diameter / 2)), d=slack_bore, $fn=resolution);
    }
}

translate([(handle_diameter / 2) + (ring_diameter * 1.5) + (part_spacing * 2), 0, 0]) {
    difference() {
        union() {
            cylinder(h=base_height, d=ring_diameter, $fn=resolution);
            translate([0, 0, base_height]) {
                difference() {
                    cylinder(h=(ring_diameter / 2), d=ring_diameter, $fn=resolution);                
                    translate([0, 0, (ring_diameter / 2)]) {
                        sphere(d=ring_diameter, $fn=resolution);
                    }
                }
            }
        }
        
        translate([0, 0, (base_height + (ring_diameter / 2) - 4)]) {
            cylinder(h=base_height, d=ring_diameter, $fn=resolution);
        }
        
        cylinder(h=(base_height + (ring_diameter / 2)), d=slack_bore, $fn=resolution);
    }
}

translate([(handle_diameter / 2) + (ring_diameter * 2.5) + (part_spacing * 3), 0, 0]) {
    difference() {
        cylinder(h=base_height, d=ring_diameter, $fn=resolution);
        cylinder(h=(base_height + (ring_diameter / 2)), d=bore, $fn=resolution);
    }
}


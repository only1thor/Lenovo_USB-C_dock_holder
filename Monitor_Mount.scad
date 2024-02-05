
// Dock
dock_width=80.2 + 2*0.6; // add nozzle size for vasemode print
dock_height=30 + 2*0.6; // add nozzle size for vasemode print
dock_length=170;

// PSU
psu_width=65.3;
psu_height=30;
psu_length=144;
	
// PSU 220V cable
cable_width=23 + 2*0.6; // add nozzle size for vasemode print
cable_height=18 + 2*0.6; // add nozzle size for vasemode print
cable_length=180;

// dock and psu allignment z
z_allignment_psu=dock_length/2 - psu_length/2;

// PSU 220V cable allignment y
y_allignment_cable=psu_width/2-7-cable_width/2;

module dock_and_psu(){
	// Dock
	cube([dock_height,dock_width,dock_length],center=true);

	// PSU
	translate([dock_height/2 + psu_height/2,0,-z_allignment_psu])
		cube([psu_height,psu_width,psu_length],center=true);
}
difference() {
	dock_and_psu();
	// PSU 220V cable
	translate([dock_height/2 + psu_height/2,-y_allignment_cable,0])
	cube([cable_height,cable_width,cable_length],center=true);

	translate([20,0,60])
		cube(size=[90, 90, 60], center=true);
}
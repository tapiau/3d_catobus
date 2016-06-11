module torus(r1,r2)
{
    rotate_extrude(convexity = 10,$fn=40)
        translate([r1, 0, 0])
            circle(r = r2);
}

module cyl()
{
    $fn = 40;
    difference()
    {
        translate([0,0,39])
            cylinder(h=1,r=7);
        translate([0,0,39])
            torus(7,1);
    }
    translate([0,0,1])
    {
        cylinder(h=38,r=6);
        torus(5,1);
    }
    cylinder(h=1,r=5);
}


difference()
{
    import("cb0_fixed.stl");

            
    for(i=[0:14:60])
    {
        translate([i-37.5,0,5.4])
        {
            translate([0,-7,0])
                cyl();
            translate([0,7,0])
                cyl();
        }
    }
}

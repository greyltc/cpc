// equation for the edge
function cpc(x,theta) = pow(x,2)/(2*(1+sin(theta)));
//(x^2/R)/(1+(1-(1+(k))*(x/R)^2)^.5) // maybe that's better?

// define rotation resolution
dr = 25;//number of rotation steps

//define x vector
half_width = 6; // max x value
steps = 0.1; // x resolution

x_values = [0:steps:half_width];

theta = 50; // acceptance angle (in degrees, +/-)

// calculate the [x,y] pairs of the polygon we'll revolve
pts = [for (x=x_values) [x, cpc(x,theta)] ];
    
close_top = [0,pts[len(pts)-1][1]]; // point needed to close the top of the funnel

// form the solid by rotation
rotate_extrude($fn=dr) polygon( points=concat(pts,[close_top]) );

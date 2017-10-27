/* Another simple map using unfolding library
 * Sets display extent and displays a marker
 */

/* import necessary code libraries */
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.marker.*;

/* global variables */
UnfoldingMap map; 
Location twincities;  //create the location object twincities
SimplePointMarker mn = new SimplePointMarker(new Location(44.9739, -93.2277)); //create a point marker
SimplePointMarker stp = new SimplePointMarker(new Location(44.9836, -93.1850));
SimplePointMarker target = new SimplePointMarker(new Location(44.9776, -93.2841));

/* processing setup function */
void setup() {
    size(1280, 720, P2D);
    
    map = new UnfoldingMap(this, new Microsoft.AerialProvider());  
    MapUtils.createDefaultEventDispatcher(this, map);

    twincities = new Location(44.9760, -93.2030); //define twincities with coordinates
    map.zoomAndPanTo(13, twincities); //zooms to our location with a zoom level of 13
    
    map.addMarkers(mn, stp, target); //call the addMarkers method with our markers
    
    /* we can style our markers */
    mn.setColor(color(0, 0, 0, 100));
    mn.setStrokeColor(color(255, 200, 0));
    mn.setStrokeWeight(4);
    
    stp.setColor(color(255, 0, 0, 100));
    stp.setStrokeColor(color(255, 0, 0));
    stp.setStrokeWeight(4);
    
    target.setColor(color(0, 0, 255, 100));
    target.setStrokeColor(color(100, 255, 155));
    target.setStrokeWeight(4);
}

/* processing draw function */
void draw() {  
    map.draw(); //all we do here is call the "draw" method from our "map" object.  
    textSize(20);
    fill(255);
    text("UMN - Minneapolis Campus", mn.getScreenPosition(map).x, mn.getScreenPosition(map).y);
    text("UMN - St Paul Campus", stp.getScreenPosition(map).x, stp.getScreenPosition(map).y);
    text("Target Field", target.getScreenPosition(map).x, target.getScreenPosition(map).y);
}



/*
find other map providers: http://unfoldingmaps.org/javadoc/index.html?de/fhpotsdam/unfolding/providers/package-summary.html
*/
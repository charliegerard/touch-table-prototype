/* 
 * Blobscanner v. 0.2-a  
 * by Antonio Molinaro (c) 20/07/2013.
 * Method usage example:  
 * drawBlobContour(int blobnumber,int contourColor,float thickness)
 *
 * Draws the blob contour for the blob specified by
 * <code> blobnumber</code> parameter value.
 * <code>findBlobs()</code> or <code>imageFindBlobs(PImage)</code>
 * and <code>loadBlobsFeatures() </code> methods must be called
 * before to call this method.
 * @param  blobnumber The blob which contours are drawn
 * @param  contourColor The contour color. Here it can be passed color( r, g, b)
 * Processing method.
 * @param  thickness The contour thickness. This parameter is passed
 * to <code>strokeWeight</code> Processing method.
 * @see #loadBlobsFeatures()
 **/
import blobscanner.*; 

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
PImage blobs;
Detector bs;
PVector[] edgeCoordinates ;
int bn ; //current  blob number

Kinect kinect;

void setup(){
  size(1280, 520);
  bs = new Detector(this,0,0,1280,520,255);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableIR(true);
  //blobs = loadImage("blobs.jpg");
  frameRate(30);
}

void draw(){
  background(0);
  PImage img = kinect.getDepthImage();
  //println(THRESHOLD);
  img.filter(THRESHOLD);
  img.filter(INVERT);
  image(kinect.getVideoImage(), 0, 0);
  image(kinect.getDepthImage(), 640, 0);
  
  
  //blobs.filter(THRESHOLD);
  bs.imageFindBlobs(img);
  bs.loadBlobsFeatures();
  bs.drawContours(color(255, 0, 0), 2);
   /*
  //image(blobs,0,0);
 
  if(frameCount%30==0)//increments bn each second
  bn++; 
  //if bn is equal to the number of blobs in the image, then reset it
  if(bn==bs.getBlobsNumber())bn=0;
  
  //draws the blob contour for the blob specified by bn
  bs.drawBlobContour(0,color(255, 0, 0),2);
 */
 }
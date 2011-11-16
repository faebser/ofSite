<%inherit file="_templates/docs.mako" />
__ofImage__


ofImage has pixels and texture information. Pixels are stored in RAM, the computer memory, while the texture is stored in the graphics card memory for drawing it faster. It also has methods to load and save images as some other utilities like resize or change the number of channels.








___Example___


testApp.h
$$code(lang=c++)
class testApp{
    void setup();
    void draw();
    ofImage img;
}
$$/code

testApp.cpp
$$code(lang=c++)
void testApp::setup(){
    img.loadImage("image.png");
}

void testApp::draw(){
    img.draw(0,0);
}
$$/code







___Reference___

$$code(lang=c++)
None ofImage()
$$/code



$$code(lang=c++)
None ~ofImage()
$$/code



$$code(lang=c++)
void allocate(int w, int h, ofImageType type)
$$/code

> Allocates memory in RAM and texture for the image. type indicates if the image is grayscale, color or color with alpha
Usually you don't need to use this method but only loadImage to load an image from disk



$$code(lang=c++)
void clear()
$$/code

> Clears the allocated memory in RAM and texture for this image



$$code(lang=c++)
None ofImage(const ofImage &mom)
$$/code



$$code(lang=c++)
None operator=(const ofImage &mom)
$$/code



$$code(lang=c++)
void clone(const ofImage &mom)
$$/code



$$code(lang=c++)
void setUseTexture(bool bUse)
$$/code



$$code(lang=c++)
bool isUsingTexture()
$$/code



$$code(lang=c++)
None getTextureReference()
$$/code



$$code(lang=c++)
void bind()
$$/code



$$code(lang=c++)
void unbind()
$$/code



$$code(lang=c++)
bool loadImage(string fileName)
$$/code



$$code(lang=c++)
bool loadImage(const ofBuffer &buffer)
$$/code



$$code(lang=c++)
void saveImage(string fileName, ofImageQualityType compressionLevel=OF_IMAGE_QUALITY_BEST)
$$/code



$$code(lang=c++)
void saveImage(ofBuffer &buffer, ofImageQualityType compressionLevel=OF_IMAGE_QUALITY_BEST)
$$/code



$$code(lang=c++)
void setCompression(ofTexCompression compression)
$$/code



$$code(lang=c++)
unsigned char * getPixels()
$$/code



$$code(lang=c++)
None getPixelsRef()
$$/code



$$code(lang=c++)
None getColor(int x, int y) const 
$$/code



$$code(lang=c++)
void setColor(int x, int y, ofColor color)
$$/code



$$code(lang=c++)
void setFromPixels(unsigned char *pixels, int w, int h, ofImageType type, bool bOrderIsRGB=true)
$$/code



$$code(lang=c++)
void setImageType(ofImageType type)
$$/code



$$code(lang=c++)
void resize(int newWidth, int newHeight)
$$/code



$$code(lang=c++)
void grabScreen(int x, int y, int w, int h)
$$/code



$$code(lang=c++)
void crop(int x, int y, int w, int h)
$$/code



$$code(lang=c++)
void cropFrom(ofImage &otherImage, int x, int y, int w, int h)
$$/code



$$code(lang=c++)
void rotate90(int rotation)
$$/code



$$code(lang=c++)
void mirror(bool vertical, bool horizontal)
$$/code



$$code(lang=c++)
void update()
$$/code



$$code(lang=c++)
void setAnchorPercent(float xPct, float yPct)
$$/code



$$code(lang=c++)
void setAnchorPoint(float x, float y)
$$/code



$$code(lang=c++)
void resetAnchor()
$$/code



$$code(lang=c++)
void draw(const ofRectangle &r)
$$/code



$$code(lang=c++)
void draw(const ofPoint &p, float w, float h)
$$/code



$$code(lang=c++)
void draw(float x, float y, float w, float h)
$$/code



$$code(lang=c++)
void draw(float x, float y, float z, float w, float h)
$$/code



$$code(lang=c++)
void draw(const ofPoint &p)
$$/code



$$code(lang=c++)
void draw(float x, float y)
$$/code



$$code(lang=c++)
void draw(float x, float y, float z)
$$/code



$$code(lang=c++)
float getHeight()
$$/code



$$code(lang=c++)
float getWidth()
$$/code



$$code(lang=c++)
bool bAllocated()
$$/code



$$code(lang=c++)
void reloadTexture()
$$/code



$$code(lang=c++)
void changeTypeOfPixels(ofPixels &pix, ofImageType type)
$$/code



$$code(lang=c++)
void resizePixels(ofPixels &pix, int newWidth, int newHeight)
$$/code

$$code(lang=c++)
int width
$$/code



$$code(lang=c++)
int height
$$/code



$$code(lang=c++)
int bpp
$$/code



$$code(lang=c++)
int type
$$/code



$$code(lang=c++)
None pixels
$$/code



$$code(lang=c++)
bool bUseTexture
$$/code



$$code(lang=c++)
None tex
$$/code

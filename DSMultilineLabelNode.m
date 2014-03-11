//
//  DSMultilineLabelNode.m
//  DSMultilineLabelNode
//
//  Created by Chris Allwein on 2/12/14.
//  Copyright (c) 2014 Downright Simple. All rights reserved.
//
//  This software is licensed under an MIT-style license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "DSMultilineLabelNode.h"

@implementation DSMultilineLabelNode

#pragma mark init and convenience methods
- (instancetype) init
{
    self = [super init];
    
    if (self) {
        
        //Initialize the same values as a default SKLabelNode
        self.fontColor = [SKColor whiteColor];
        self.fontName = @"Helvetica";
        self.fontSize = 32.0;
        
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        self.verticalAlignmentMode = SKLabelVerticalAlignmentModeBaseline;
        
        //Paint our initial texture
        [self retexture];
    }
    
    return self;

}

//init method to support drop-in replacement for SKLabelNode
- (instancetype)initWithFontNamed:(NSString *)fontName
{
    self = [self init];
    
    if (self) {
        self.fontName = fontName;
    }
    
    return self;
}

//Convenience method to support drop-in replacement for SKLabelNode
+ (instancetype)labelNodeWithFontNamed:(NSString *)fontName
{
    DSMultilineLabelNode *node = [[DSMultilineLabelNode alloc] initWithFontNamed:fontName];
    
    return node;
}

#pragma mark setters for SKLabelNode properties
//For each of the setters, after we set the appropriate property, we call the
//retexture method to generate and apply our new texture to the node

-(void) setFontColor:(UIColor *)fontColor
{
    _fontColor = fontColor;
    [self retexture];
}

-(void) setFontName:(NSString *)fontName
{
    _fontName = fontName;
    [self retexture];
}

-(void) setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    [self retexture];
}

-(void) setHorizontalAlignmentMode:(SKLabelHorizontalAlignmentMode)horizontalAlignmentMode
{
    _horizontalAlignmentMode = horizontalAlignmentMode;
    [self retexture];
}

-(void) setText:(NSString *)text
{
    _text = text;
    [self retexture];
}

-(void) setVerticalAlignmentMode:(SKLabelVerticalAlignmentMode)verticalAlignmentMode
{
    _verticalAlignmentMode = verticalAlignmentMode;
    [self retexture];
}

-(void)setParagraphWidth:(CGFloat)paragraphWidth {
	
	_paragraphWidth = paragraphWidth;
	[self retexture];
	
}

//Generates and applies new textures based on the current property values
-(void) retexture
{
    DSImage *newTextImage = [self imageFromText:self.text];
    SKTexture *newTexture =[SKTexture textureWithImage:newTextImage];
    
    SKSpriteNode *selfNode = (SKSpriteNode*) self;
    selfNode.texture = newTexture;
    
    //Resetting the texture also reset the anchorPoint.  Let's recenter it.
    selfNode.anchorPoint = CGPointMake(0.5, 0.5);

}

-(DSImage *)imageFromText:(NSString *)text
{
    //First we define a paragrahp style, which has the support for doing the line breaks and text alignment that we require
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping; //To get multi-line
    paragraphStyle.alignment = [self mapSkLabelHorizontalAlignmentToNSTextAlignment:self.horizontalAlignmentMode];
    paragraphStyle.lineSpacing = 1;
    
    //Create the font using the values set by the user
    DSFont *font = [DSFont fontWithName:self.fontName size:self.fontSize];
    
    //Create our textAttributes dictionary that we'll use when drawing to the graphics context
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    
    //Font Name and size
    [textAttributes setObject:font forKey:NSFontAttributeName];
    
    //Line break mode and alignment
    [textAttributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];

    //Font Color
    [textAttributes setObject:self.fontColor forKey:NSForegroundColorAttributeName];
    
    
    //Calculate the size that the text will take up, given our options.  We use the full screen size for the bounds
	if (_paragraphWidth == 0) {
		_paragraphWidth = self.scene.size.width;
	}
	
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(_paragraphWidth, self.scene.size.height)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine
                                      attributes:textAttributes
                                         context:nil];
    
    //iOS7 uses fractional size values.  So we needed to ceil it to make sure we have enough room for display.
    textRect.size.height = ceil(textRect.size.height);
    textRect.size.width = ceil(textRect.size.width);
    
    //The size of the bounding rect is going to be the size of our new node, so set the size here.
    SKSpriteNode *selfNode = (SKSpriteNode*) self;
    selfNode.size = textRect.size;
    
    //Create the graphics context
    UIGraphicsBeginImageContextWithOptions(textRect.size,NO,0.0);
    
    //Actually draw the text into the context, using our defined attributed
    [text drawInRect:textRect withAttributes:textAttributes];
    
    //Create the image from the context
    DSImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //Close the context
    UIGraphicsEndImageContext();
    
    return image;
}

//Performs translation between the SKLabelHorizontalAlignmentMode supported by SKLabelNode and the NSTextAlignment required for string drawing
-(NSTextAlignment) mapSkLabelHorizontalAlignmentToNSTextAlignment:(SKLabelHorizontalAlignmentMode)alignment
{
    switch (alignment) {
        case SKLabelHorizontalAlignmentModeLeft:
            return NSTextAlignmentLeft;
            break;
            
        case SKLabelHorizontalAlignmentModeCenter:
            return NSTextAlignmentCenter;
            break;
            
        case SKLabelHorizontalAlignmentModeRight:
            return NSTextAlignmentRight;
            break;
            
        default:
            break;
    }
    
    return NSTextAlignmentLeft;
}



@end

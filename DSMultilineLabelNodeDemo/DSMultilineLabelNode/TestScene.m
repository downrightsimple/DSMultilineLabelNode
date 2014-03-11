//
//  TestScene.m
//  DSMultilineLabelNode
//
//  Created by Chris Allwein on 2/12/14.
//  Copyright (c) 2014 Downright Simple. All rights reserved.
//

#import "TestScene.h"
#import "DSMultilineLabelNode.h"

@interface TestScene() {
	
	DSMultilineLabelNode* node;
	
}

@end


@implementation TestScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
				
		self.backgroundColor = [SKColor blueColor];
		//	self.scaleMode = SKSceneScaleModeAspectFit;
		
		node = [DSMultilineLabelNode labelNodeWithFontNamed:@"Futura"];
		node.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
		node.paragraphWidth = 400;
		
		//uncomment any of these lines to see how they affect the paragraph style
//		node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
//		node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter; //default
//		node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;

		//setting the anchor point different depending on what paragraph style you choose may help with positioning
		//also note that setting the anchor point typically doesn't work on label nodes - this only works as it is actually an SKSpriteNode, galavanting as a label!
//		node.anchorPoint = CGPointMake(0.0, 1.0); //Good for left justification
//		node.anchorPoint = CGPointMake(0.5, 0.5); //(default) Good for center justification
//		node.anchorPoint = CGPointMake(1.0, 1.0); // Good for right justification
				
		[self addChild:node];
		node.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
		
		SKLabelNode* normalLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
		normalLabel.text = @"normal label";
		normalLabel.position = CGPointMake(self.size.width / 2, self.size.height * 0.25);
		[self addChild: normalLabel];
    }
	
    return self;
}

- (void)didMoveToView: (SKView *) view
{


}


#if TARGET_OS_IPHONE

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint location = [[touches anyObject] locationInNode:self];
	node.position = location;
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint location = [[touches anyObject] locationInNode:self];
	node.position = location;
	
}
#else

-(void)mouseDown:(NSEvent *)theEvent {
	
	CGPoint location = [theEvent locationInNode:self];
	node.position = location;
}

-(void)mouseDragged:(NSEvent *)theEvent {

	CGPoint location = [theEvent locationInNode:self];
	node.position = location;
	
}


#endif

@end

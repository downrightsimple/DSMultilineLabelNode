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

- (void)didMoveToView: (SKView *) view
{
	self.backgroundColor = [SKColor blueColor];
//	self.scaleMode = SKSceneScaleModeAspectFit;
	
	node = [DSMultilineLabelNode labelNodeWithFontNamed:@"Futura"];
	node.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
	node.paragraphWidth = 400;
//	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
//	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter; //default
//	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
	[self addChild:node];
	node.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));

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

#endif

@end

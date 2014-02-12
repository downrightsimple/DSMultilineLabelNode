//
//  TestScene.m
//  DSMultilineLabelNode
//
//  Created by Chris Allwein on 2/12/14.
//  Copyright (c) 2014 Downright Simple. All rights reserved.
//

#import "TestScene.h"
#import "DSMultilineLabelNode.h"

@implementation TestScene

- (void)didMoveToView: (SKView *) view
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    DSMultilineLabelNode *node = [DSMultilineLabelNode labelNodeWithFontNamed:@"Helvetica"];
    node.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    [self addChild:node];
    node.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));

}

@end

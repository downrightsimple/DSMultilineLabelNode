//
//  ViewController.m
//  DSMultilineLabelNode
//
//  Created by Chris Allwein on 2/12/14.
//  Copyright (c) 2014 Downright Simple. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "TestScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	
	SKView* skView = (SKView*)self.view;
	if (!skView.scene) {

		skView.showsFPS = NO;
		skView.showsNodeCount = NO;
        
        self.view.multipleTouchEnabled = NO;
        
        
        
        // Create and configure the scene.
		SKScene* scene = [TestScene sceneWithSize:skView.bounds.size];
        		
        scene.scaleMode = SKSceneScaleModeAspectFill;
		
        
        // Present the scene.
        [skView presentScene:scene];
	}
	
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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

-(void)viewWillAppear:(BOOL)animated
{
    
    TestScene* test = [[TestScene alloc]
                         initWithSize:self.view.frame.size];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

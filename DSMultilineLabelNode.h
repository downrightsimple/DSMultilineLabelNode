//
//  DSMultilineLabelNode.h
//  DSMultilineLabelNode
//
//  Created by Chris Allwein on 2/12/14.
//  Copyright (c) 2014 Downright Simple. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DSMultilineLabelNode : SKSpriteNode

@property(retain, nonatomic) SKColor *fontColor;
@property(copy, nonatomic) NSString *fontName;
@property(nonatomic) CGFloat fontSize;
@property(nonatomic) SKLabelHorizontalAlignmentMode horizontalAlignmentMode;
@property(copy, nonatomic) NSString *text;
@property(nonatomic) SKLabelVerticalAlignmentMode verticalAlignmentMode;

+ (instancetype)labelNodeWithFontNamed:(NSString *)fontName;
- (instancetype)initWithFontNamed:(NSString *)fontName;


@end

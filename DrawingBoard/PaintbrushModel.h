//
//  Paintbrush.h
//  DrawingBoard
//
//  Created by Utopia on 15/8/27.
//  Copyright (c) 2015年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//这是画笔类,用于存储画笔的颜色/位置/大小
@interface PaintbrushModel : NSObject

@property (nonatomic, strong)UIBezierPath *path;//

@property (nonatomic, strong)UIColor *color;

@property (nonatomic, assign)CGFloat width;

@end

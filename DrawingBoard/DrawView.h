//
//  DrawView.h
//  DrawingBoard
//
//  Created by Utopia on 15/8/27.
//  Copyright (c) 2015年 Utopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintbrushModel.h"

@interface DrawView : UIView <NSCoding>

@property (nonatomic, strong) PaintbrushModel *paintbrushModel;//一条线的信息
@property (nonatomic, copy) NSMutableArray *paintbrushModelArray;//存储所有线的信息

@end

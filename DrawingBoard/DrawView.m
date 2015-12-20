//
//  DrawView.m
//  DrawingBoard
//
//  Created by Utopia on 15/8/27.
//  Copyright (c) 2015年 Utopia. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        _paintbrushModelArray = [[NSMutableArray alloc]initWithCapacity:100];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]])
        {
            NSData *data = [[NSData alloc] initWithContentsOfFile:[self getFilePath]];
    
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
            //解档出数据模型
            _paintbrushModelArray= [unarchiver decodeObjectForKey:@"paintbrushModelArray"];
            [unarchiver finishDecoding];
            [self setNeedsDisplay];
        }
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    UIColor *color = [UIColor blackColor];
    [color set]; //设置线条颜色
    _paintbrushModel.path.lineWidth = 10.0;
    _paintbrushModel.path.lineCapStyle = kCGLineCapRound; //线条拐角
    _paintbrushModel.path.lineJoinStyle = kCGLineCapRound; //终点处理
    
    if (_paintbrushModelArray.count == 0)
    {
        [_paintbrushModel.path stroke];
    }
    else
    {
        
        for (PaintbrushModel *paintbrushModelTemp in _paintbrushModelArray)
        {
            
            
            [paintbrushModelTemp.path stroke];
            
        }
      
        [_paintbrushModel.path stroke];
    }

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _paintbrushModel = [[PaintbrushModel alloc]init];

    UITouch *touch = [touches anyObject];
    CGPoint location =[touch locationInView:self];
    [_paintbrushModel.path moveToPoint:location];
    
   // UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 50)];
   // aPath.lineWidth = 5.0;
   // aPath.lineCapStyle = kCGLineCapRound; //线条拐角
   // aPath.lineJoinStyle = kCGLineCapRound; //终点处理
   // [aPath stroke];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    [_paintbrushModel.path addLineToPoint: location];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    [_paintbrushModelArray addObject:_paintbrushModel];
    
      
    NSMutableData *data = [[NSMutableData alloc] init];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:_paintbrushModelArray forKey:@"paintbrushModelArray"];
    
    [archiver finishEncoding];
    
    [data writeToFile:[self getFilePath] atomically:YES];
    
}

- (NSString *) getFilePath
{
    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   
    NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:@"data.archive"];
    
    return path;
    
}



   


@end

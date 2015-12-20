//
//  Paintbrush.m
//  DrawingBoard
//
//  Created by Utopia on 15/8/27.
//  Copyright (c) 2015年 Utopia. All rights reserved.
//

#import "PaintbrushModel.h"

@implementation PaintbrushModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _path = [UIBezierPath bezierPath];
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeObject:_path forKey:@"path"];
    [aCoder encodeDouble:_width forKey:@"with"];
   
    
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self == [super init]) {
        _color =  [aDecoder decodeObjectForKey:@"color"];
        _path = [aDecoder decodeObjectForKey:@"path"];
        _width =  [aDecoder decodeDoubleForKey:@"with"];
       
    }
    
    return self;
}


@end

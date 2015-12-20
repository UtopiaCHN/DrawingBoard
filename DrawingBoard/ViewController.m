//
//  ViewController.m
//  DrawingBoard
//
//  Created by Utopia on 15/8/27.
//  Copyright (c) 2015年 Utopia. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()
{
    NSString *labelContent;
    NSString *fontStyle;
    NSInteger fontSize;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _createView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createView
{
    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 5 * 4)];
    
    [self.view addSubview:drawView];
    
    drawView.backgroundColor = [UIColor yellowColor];
    drawView.tag = 100;
    drawView.paintbrushModel.width = 10;
    drawView.paintbrushModel.color = [UIColor blackColor];

    
//    UIPickerView *pickerView = [[UIPickerView alloc]init];
//    [self.view addSubview:pickerView];
//    pickerView.center = CGPointMake(self.view.center.x, self.view.center.y + 250);
//    pickerView.delegate = self;
//    pickerView.dataSource = self;
//    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
//    //[self.view addSubview:label];
//    label.tag = 100;
//    labelContent = [UIFont familyNames][0];
//    fontStyle = [UIFont familyNames][0];
//    fontSize = 15;
//    label.backgroundColor = [UIColor redColor];
//    label.text = labelContent;
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont fontWithName:fontStyle size:fontSize];
//    label.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        {
            return 10;
        }

    return 10;
}

//设置每个轮盘的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 200.0;
    }
    else
    {
        return 100.0;
      
    }
}

//自定义轮盘的显示视图,通过创建新的自定义视图来覆盖原有的视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
        //设置第一个轮盘
        if (component == 0)
        {
            if (row == 0)
            {
                UIView *view = [[UIView alloc]init];
                view.backgroundColor = [UIColor redColor];
                return view;
            }
            if (row == 1)
            {
                UIView *view1 = [[UIView alloc]init];
                view1.backgroundColor = [UIColor yellowColor];
                return view1;
            }
            if (row == 2)
            {
                UIView *view2 = [[UIView alloc]init];
                view2.backgroundColor = [UIColor greenColor];
                return view2;
            }
            if (row == 3)
            {
                UIView *view3 = [[UIView alloc]init];
                view3.backgroundColor = [UIColor blackColor];
                return view3;
            }
            if (row == 4)
            {
                UIView *view4 = [[UIView alloc]init];
                view4.backgroundColor = [UIColor blueColor];
                return view4;
            }
            if (row == 5)
            {
                UIView *view5 = [[UIView alloc]init];
                view5.backgroundColor = [UIColor cyanColor];
                return view5;
            }
            if (row == 6)
            {
                UIView *view6 = [[UIView alloc]init];
                view6.backgroundColor = [UIColor purpleColor];
                return view6;
            }
            if (row == 7)
            {
                UIView *view7 = [[UIView alloc]init];
                view7.backgroundColor = [UIColor magentaColor];
                return view7;
            }
            if (row == 8)
            {
                UIView *view8 = [[UIView alloc]init];
                view8.backgroundColor = [UIColor brownColor];
                return view8;
            }
            if (row == 9)
            {
                UIView *view9 = [[UIView alloc]init];
                view9.backgroundColor = [UIColor orangeColor];
                return view9;
            }
        }
        else
        {
            UILabel *labelFontSize = [[UILabel alloc]init];
            labelFontSize.text = [NSString stringWithFormat:@"%ld", row + 1];
            return labelFontSize;
        }
    
    return nil;
}

//选择某个轮盘的某行获取里面的信息来设置屏幕上方的label的显示内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    DrawView *drawViewTemp = (DrawView *)[self.view viewWithTag:100];
    if (component == 1)
    {
        UIView *view = [[UIView alloc]init];
        view = [pickerView viewForRow:row forComponent:component];//获取第二个轮盘选中行的视图,然后把该视图的颜色设置给屏幕上方的label
         drawViewTemp.paintbrushModel.color = view.backgroundColor;
        
    }
    else
    {
        drawViewTemp.paintbrushModel.width = row + 1;
    }
    
    
    
}


@end

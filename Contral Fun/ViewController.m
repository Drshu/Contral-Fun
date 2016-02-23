//
//  ViewController.m
//  Contral Fun
//
//  Created by shucheng on 16/2/22.
//  Copyright © 2016年 shucheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text=@"50";//可以保证在触摸滑动条之前也有一个正确的数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFildDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}
- (IBAction)sliderChanged:(UISlider *)sender {
    int progress = lroundf(sender.value);//获取滑动条当前值
    self.sliderLabel.text=[NSString stringWithFormat:@"%d",progress];
}
- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting=sender.isOn;//获取isOn属性值，这里
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex==0) {
        self.leftSwitch.hidden= NO;
        self.rightSwitch.hidden= NO;
        self.doSomethingButton.hidden = YES;
    }
    else{
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}
- (IBAction)buttonPressed:(id)sender {
}
@end

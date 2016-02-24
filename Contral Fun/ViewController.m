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
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"//显示的标题，会显示在操作表单的顶部
                                  delegate:self//委托对象，按下按钮的时候，委托对象就会收到通知，也就是将self作为委托对象参数传递给didDismissWithButtonIndex这个方法
                                  cancelButtonTitle:@"No way!"//取消按钮的标题
                                  destructiveButtonTitle:@"Yes,I'm sure!"//确认按钮的标题
                                  otherButtonTitles:@"Foo",@"Bar", nil];//最后这里可以放入其他更多的按钮
    [actionSheet showInView:self.view];//显示这一个表单，这里是用self作为父视图
}

-(void) actionSheet:(UIActionSheet*)actionSheet//之前指定了self作为委托，所以按下按钮的时候会被调用。
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex !=[actionSheet cancelButtonIndex]){//buttonIndex是指按下哪一个按钮，这行是确定不是按下取消按钮
        NSString *msg = nil;//创建一个新的字符串
        if ([self.nameField.text length]>0) {
            msg=[NSString stringWithFormat:@"You can breathe easy,%@,everything went OK.",
                 self.nameField.text];//若在nameField之中有名字，就将名字加入，如果没有那就使用默认的语句。
        }else{
            msg=@"You can breathe easy everything went OK.";
        }
        UIAlertView*alert=[[UIAlertView alloc]
                           initWithTitle:@"Something was done"
                           message:msg
                           delegate:nil//表示当结束之后，没有任何操作
                           cancelButtonTitle:@"Phew!"
                           otherButtonTitles:nil];//警告视图的创建
        [alert show];
    }
}
@end

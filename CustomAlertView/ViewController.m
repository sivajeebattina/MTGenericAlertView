//
//  ViewController.m
//  CustomAlertView
//
//  Created by SivajeeBattina on 8/12/15.
//  Copyright (c) 2015 Paradigmcreatives. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UITextView *todoTextView;
    UIView *todoTextBGView;
}

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addToDoAlertView];
}

#pragma -mark Action methods
- (IBAction)alertWithTableViewClicked:(id)sender {
    MTGenericAlertView *alertView = [[MTGenericAlertView alloc] initWithTitle:@"List of items in TableView!!" titleColor:nil titleFont:nil backgroundImage:nil];
    alertView.delegate = self;
    [alertView setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"OK",nil]];
    [alertView setContainerViewContent:[self addTableView]];
    [alertView show];
}

-(IBAction)alertWithTextView:(id)sender {
    MTGenericAlertView *alertView = [[MTGenericAlertView alloc] init];
    alertView.delegate = self;
    [alertView setContainerViewContent:todoTextBGView];
    [alertView setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"Cancel",@"OK",nil]];
    [alertView show];
}

- (IBAction)whatsAppLikeAlertView:(id)sender {
   MTGenericAlertView *alertView = [[MTGenericAlertView alloc] initWithTitle:@"A Message From Unknown" titleColor:[UIColor whiteColor] titleFont:nil backgroundImage:[self imageFromColor:[UIColor colorWithRed:13.0/255.0f green:77.0/255.0f blue:68.0/255.0f alpha:1.0f]]];
    [alertView setDelegate:self];
    [alertView setContainerViewContent:[self createWhatsAppLikeAlert]];
    [alertView setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"OK",@"View",nil]];
    [alertView show];
}

- (IBAction)alertWithCustomButtonClicked:(id)sender {
    MTGenericAlertView *alertView = [[MTGenericAlertView alloc] initWithTitle:@"NetWork Error!!" titleColor:nil titleFont:nil backgroundImage:nil];

    [alertView setContainerViewContent:[self addGifAnimation]];
    [alertView setDelegate:self];
    [alertView setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"Close1",@"Done",@"OK",@"Hey" ,nil]];
    
    // You may use a Block, rather than a delegate.
    [alertView setAlertViewButtonActionCompletionHandler:^(MTGenericAlertView *alertViewContainer, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertViewContainer tag]);
        [alertViewContainer close];
    }];
    
    [alertView show];

}
- (IBAction)popUpButtonClicked:(id)sender {
    MTGenericAlertView *alertView = [[MTGenericAlertView alloc] initWithTitle:@"Filter" titleColor:[UIColor whiteColor] titleFont:nil backgroundImage:[self imageFromColor:[UIColor colorWithRed:50.0f/255 green:138.0f/255.0f blue:185.0f/255.0f alpha:1.0]]];
    
    //Add close button only to handle close button action. Other wise by default close button will be added.
    alertView.popUpCloseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [alertView.popUpCloseButton setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [alertView setContainerViewContent:[self addFilterView]];
    alertView.isPopUpView = YES;
    [alertView setDelegate:self];
    [alertView show];
}

-(void)closeButtonCalled{

}

#pragma -mark Sample Views
- (UIView *)createWhatsAppLikeAlert
{
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 160)];
    
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, sampleView.frame.size.width, 40)];
    msgLabel.text = @"Hi, How are you?";
    msgLabel.textAlignment = NSTextAlignmentCenter;
    [sampleView addSubview:msgLabel];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 110, sampleView.frame.size.width-80, 40)];
    [textField1 setBackgroundColor:[UIColor whiteColor]];
    textField1.delegate = self;
    [sampleView addSubview:textField1];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 41, 40)];
    UIImageView *paddingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 5, 30, 30)];
    paddingImageView.image = [UIImage imageNamed:@"emotion_smile"];
    [leftView addSubview:paddingImageView];
    textField1.leftView = leftView;
    textField1.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *micImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sampleView.frame.size.width-50, 110, 40, 40)];
    micImageView.image = [UIImage imageNamed:@"microphone"];
    [sampleView addSubview:micImageView];
    return sampleView;
}

- (UIView *)addTableView{
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 160)];
    UITableView *tv=[[UITableView alloc] initWithFrame:sampleView.frame];
    tv.delegate =self;
    tv.dataSource = self;
    [sampleView addSubview:tv];
    return sampleView;

}

- (UIView *)addPickerView {
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 160)];
    sampleView.backgroundColor = [UIColor whiteColor];
    
    UIDatePicker *datepicker=[[UIDatePicker alloc] initWithFrame:sampleView.frame];
        [sampleView addSubview:datepicker];
    
    return sampleView;
}
- (UIView *)addGifAnimation
{
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 160)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:sampleView.frame];
    imageView.image = [UIImage imageNamed:@"Error.gif"];
    [sampleView addSubview:imageView];
    
    return sampleView;
}

#pragma -mark Alert Delegate methods
- (void)alertViewButtonTouchUpInside: (MTGenericAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}


#pragma -mark TextField Delegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

#pragma -mark TableView Delegate methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = @"Hello";
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

#pragma -mark Create TextView methods
- (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void) addToDoAlertView
{
    todoTextBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = todoTextBGView.bounds;
    gradient.cornerRadius = 7;
    
    [todoTextBGView.layer insertSublayer:gradient atIndex:0];
    todoTextBGView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0f];
    
    [self addToDoTextview];
    [self addAlarmSwitch];
}

- (void)addToDoTextview{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, todoTextBGView.frame.size.width, 40)];
    titleLabel.text = @"Add To Do List";
    titleLabel.textColor = [UIColor colorWithWhite:0 alpha:0.6];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
    
    [todoTextBGView addSubview:titleLabel];
    
    todoTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, titleLabel.frame.size.height, todoTextBGView.frame.size.width-40, todoTextBGView.frame.size.height-titleLabel.frame.size.height - 60)];
    todoTextView.text = @"";
    [todoTextBGView addSubview:todoTextView];
}

- (void)addAlarmSwitch{
    UISwitch *alarmSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, todoTextBGView.frame.size.height - 50, 0, 0)];
    [todoTextBGView addSubview:alarmSwitch];
    
    UILabel *alarmLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, todoTextBGView.frame.size.height-20,  130, 20)];
    alarmLabel.text = @"*Switch on to set an alarm";
    alarmLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:10];
    alarmLabel.textColor = [UIColor colorWithWhite:0 alpha:0.6];
    [todoTextBGView addSubview:alarmLabel];
    
    alarmSwitch.on = NO;
}

-(UIView *)addFilterView
{
    UIView *filterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 325)];
    filterView.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 30)];
    labelTitle.text = @"Parking Type";
    labelTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    [labelTitle setTextColor:[UIColor darkGrayColor]];
    [filterView addSubview:labelTitle];
    
    CGRect frame = CGRectMake(labelTitle.frame.origin.x+ 10, labelTitle.frame.origin.y+labelTitle.frame.size.height, 125, 30);
    
    for (int i=0; i< 2 ; i++) {
        
        UILabel *labelParkingType = [[UILabel alloc]initWithFrame:frame];
        labelParkingType.text = [NSString stringWithFormat:@"Check Mark %d",i+1];
        labelParkingType.font = [UIFont systemFontOfSize:15.0f];
        [labelParkingType setTextColor:[UIColor darkGrayColor]];
        
        [labelParkingType setTag:100+i];
        
        [filterView addSubview:labelParkingType];
        
        
        UIButton *btnCheckBox = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btnCheckBox setTag:100+i];
        
        [btnCheckBox setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
        
        [btnCheckBox setFrame:CGRectMake(filterView.frame.size.width - 50, labelParkingType.frame.origin.y, 30, 30)];
        
        [filterView addSubview:btnCheckBox];
        
        if (i != 1) {
            frame = CGRectMake(frame.origin.x, labelParkingType.frame.origin.y + labelParkingType.frame.size.height+10, frame.size.width, frame.size.height);
        }

    }
    
    
    UILabel *labelRateTitle = [[UILabel alloc]initWithFrame:CGRectMake(labelTitle.frame.origin.x, frame.origin.y + frame.size.height, labelTitle.frame.size.width, labelTitle.frame.size.height)];
    labelRateTitle.text = @"Rate By Hour";
    labelRateTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    [labelRateTitle setTextColor:[UIColor darkGrayColor]];
    [filterView addSubview:labelRateTitle];
    
    UIButton *btnRateFilter;
    if (btnRateFilter==nil) {
        
        btnRateFilter = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnRateFilter setTitle:@"1 Hour" forState:UIControlStateNormal];
        
        [btnRateFilter setBackgroundColor:[UIColor colorWithRed:235.0f/255.0f green:234.0f/255.0f blue:231.0f/255.0f alpha:1.0]];
        
        [btnRateFilter setFrame:CGRectMake(frame.origin.x, labelRateTitle.frame.origin.y+labelRateTitle.frame.size.height+10, filterView.frame.size.width - frame.origin.x - 20, 30)];
        
        [btnRateFilter setEnabled:NO];
        [btnRateFilter setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btnRateFilter setImage:[UIImage imageNamed:@"Dropdown_2x"] forState:UIControlStateNormal];
        
        UIEdgeInsets edgeinset;
        edgeinset.left = btnRateFilter.frame.size.width -30;
        btnRateFilter.imageEdgeInsets = edgeinset;
        
        
        UIEdgeInsets edgeinsetTitle;
        edgeinsetTitle.left = -50;
        edgeinsetTitle.right = 5;
        edgeinsetTitle.top = 5;
        edgeinsetTitle.bottom = 5;
        
        btnRateFilter.titleEdgeInsets = edgeinsetTitle;
        
    }
    
    
    [filterView addSubview:btnRateFilter];
    
    
    UIButton *btnApply = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnApply setTitle:@"Apply" forState:UIControlStateNormal];
    [btnApply setBackgroundColor:[UIColor colorWithRed:50.0f/255 green:138.0f/255.0f blue:185.0f/255.0f alpha:1.0]];
    [btnApply setFrame:CGRectMake(50, btnRateFilter.frame.origin.y+btnRateFilter.frame.size.height+15, 150, 30)];
    [filterView addSubview:btnApply];
    
    [filterView setFrame:CGRectMake(filterView.frame.origin.x, filterView.frame.origin.y, filterView.frame.size.width,labelRateTitle.frame.origin.y + labelRateTitle.frame.size.height + 150)];
    
    return filterView;
    
}
@end

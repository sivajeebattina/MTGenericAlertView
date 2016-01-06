//
//  ViewController.m
//  CustomAlertView
//
//  Created by SivajeeBattina on 8/12/15.
//  Copyright (c) 2015 Paradigmcreatives. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (IBAction)alertWithTableViewClicked:(id)sender {
    MTGenericAlertView *alertViewContainer = [[MTGenericAlertView alloc] initWithTitle:@"Alert!!" titleColor:nil titleFont:nil backgroundImage:nil];
    [alertViewContainer setContainerViewContent:[self createSampleView]];
    alertViewContainer.tag = 3;
    [alertViewContainer setDelegate:self];
    [alertViewContainer setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"OK",nil]];
    
    // You may use a Block, rather than a delegate.
    [alertViewContainer setAlertViewButtonActionCompletionHandler:^(MTGenericAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)alertView.tag);
        [alertView close];
    }];
    
    [alertViewContainer show];
}
- (IBAction)alertWithCustomTitleClicked:(id)sender {
    MTGenericAlertView *alertViewContainer = [[MTGenericAlertView alloc] initWithTitle:@"Alert!!" titleColor:nil titleFont:nil backgroundImage:[UIImage imageNamed:@"image.jpeg"]];
    [alertViewContainer setContainerViewContent:[self createSampleView]];
    [alertViewContainer setDelegate:self];
    [alertViewContainer setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"OK",nil]];
    
    // You may use a Block, rather than a delegate.
    [alertViewContainer setAlertViewButtonActionCompletionHandler:^(MTGenericAlertView *alertViewContainer, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertViewContainer tag]);
        [alertViewContainer close];
    }];
    
    [alertViewContainer show];

}
- (IBAction)alertWithCustomButtonClicked:(id)sender {
    MTGenericAlertView *alertViewContainer = [[MTGenericAlertView alloc] initWithTitle:@"Alert!!" titleColor:nil titleFont:nil backgroundImage:nil];
    [alertViewContainer setContainerViewContent:[self createSampleView]];
    [alertViewContainer setDelegate:self];
    [alertViewContainer setCustomButtonTitlesArray:[NSMutableArray arrayWithObjects:@"Close1",@"Done",@"OK",@"Hey" ,nil]];
    //    UIButton *closebutton=[[UIButton alloc] init];
    //    [closebutton setBackgroundColor:[UIColor purpleColor]];
    //    [closebutton setTitle:@"OK" forState:UIControlStateNormal];
    //    [closebutton addTarget:self action:@selector(closeButtonCalled) forControlEvents:UIControlEventTouchUpInside];
    //
    //    [alertViewContainer setCustomButtons:[NSMutableArray arrayWithObjects:closebutton, nil]];

    
    // You may use a Block, rather than a delegate.
    [alertViewContainer setAlertViewButtonActionCompletionHandler:^(MTGenericAlertView *alertViewContainer, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertViewContainer tag]);
        [alertViewContainer close];
    }];
    
    [alertViewContainer show];

}
- (IBAction)popUpButtonClicked:(id)sender {
    MTGenericAlertView *alertViewContainer = [[MTGenericAlertView alloc] init];
    alertViewContainer.isPopUpView = YES;
    [alertViewContainer setContainerViewContent:[self createSampleView]];
    [alertViewContainer setDelegate:self];
    [alertViewContainer show];
}
-(void)closeButtonCalled{

}
- (void)alertViewButtonTouchUpInside: (MTGenericAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}

- (UIView *)createSampleView
{
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 160)];
    //sampleView.backgroundColor = [UIColor purpleColor];
    
//    UIDatePicker *datepicker=[[UIDatePicker alloc] initWithFrame:sampleView.frame];
//    [sampleView addSubview:datepicker];
    
//    UILabel *lablel1=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, sampleView.frame.size.width-20, 20)];
//    lablel1.text = @"Hey hello! this is sample text";
//
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 40, sampleView.frame.size.width-20, 20)];
    [textField1 setBackgroundColor:[UIColor grayColor]];
    textField1.delegate = self;
    [sampleView addSubview:textField1];
   // [sampleView addSubview:lablel1];
//    
//    UITableView *tv=[[UITableView alloc] initWithFrame:sampleView.frame];
//    tv.delegate =self;
//    tv.dataSource = self;
//    [sampleView addSubview:tv];
    return sampleView;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

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

@end

//
//  AlertViewContainer.h
//  CustomAlertView
//
//  Created by SivajeeBattina on 8/12/15.
//  Copyright (c) 2015 Paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PCSAlertViewContainerDelegate

- (void)alertViewButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface PCSAlertViewContainer : UIView<PCSAlertViewContainerDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *containerViewContent; 
@property (nonatomic, strong) NSArray *customButtonTitlesArray;
@property (nonatomic, strong) NSArray *customButtonsArray;
@property (nonatomic, strong) UILabel *alertTitleLabel;
@property (nonatomic ,assign) BOOL isPopUpView;
@property (nonatomic, assign) id<PCSAlertViewContainerDelegate> delegate;

@property (copy) void (^AlertViewButtonActionCompletionHandler)(PCSAlertViewContainer *alertView, int buttonIndex) ;


- (id)init;

- (id)initWithTitle:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font backgroundImage:(UIImage *)image;

- (void)show;

- (void)close;

- (void)setAlertViewButtonActionCompletionHandler:(void (^)(PCSAlertViewContainer *alertView, int buttonIndex))onButtonTouchUpInside;

@end

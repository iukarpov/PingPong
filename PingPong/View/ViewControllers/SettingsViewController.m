//
//  SettingsViewController.m
//  PingPong
//
//  Created by Igor on 07/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SettingsViewController.h"
#import "GameStartViewController.h"


@interface SettingsViewController ()

@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UISlider *gameComplexitySlider;
@property (nonatomic, assign) CGFloat sliderValue;
@property (nonatomic, strong) NSUserDefaults *sliderState;
@end


@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:77/255.0 green:0/255.0 blue:153/255.0 alpha:1.0];
    self.sliderState = [NSUserDefaults standardUserDefaults];
    [self setupReturnButton];
    [self setupGameComplexitySlider];
    [self setupNormalLabel];
    [self setupNightmareLabel];
    [self setupHellLabel];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.gameComplexitySlider.value = [self.sliderState floatForKey:@"gameComplexity"];

}
-(void)setupGameComplexitySlider
{
    CGFloat sliderWidth = CGRectGetWidth(self.view.frame) - 80;
    CGFloat sliderHeight = 50.0;
    CGFloat sliderX = CGRectGetMidX(self.view.frame) - sliderWidth/2;
    CGFloat sliderY = CGRectGetMinY(self.returnButton.frame) -100;
    
    self.gameComplexitySlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderX, sliderY, sliderWidth, sliderHeight)];
    [self.gameComplexitySlider addTarget:self action:@selector(changeComplexity:) forControlEvents:UIControlEventValueChanged];
    [self.gameComplexitySlider setBackgroundColor:[UIColor clearColor]];
    self.gameComplexitySlider.thumbTintColor  = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
    self.gameComplexitySlider.minimumValue = 1;
    self.gameComplexitySlider.maximumValue = 3;
    self.gameComplexitySlider.continuous = YES;
    self.gameComplexitySlider.value = self.sliderValue;
    self.gameComplexitySlider.minimumTrackTintColor = UIColor.redColor;
    [self.view addSubview:self.gameComplexitySlider];
}

-(void)changeComplexity:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    slider.value = roundf(slider.value);
    self.sliderValue = slider.value;
    [self.sliderState setFloat:self.gameComplexitySlider.value forKey:@"gameComplexity"];
    [self.complexityDelegate passSliderValueFromSettings:self.sliderValue];
}

- (void)setupNormalLabel
{
    CGFloat normalLabelWidth = 60.0;
    CGFloat normalLabelHeight = 30.0;
    CGFloat normalLableX = CGRectGetMinX(self.gameComplexitySlider.frame) - 10;
    CGFloat normalLableY = CGRectGetMidY(self.gameComplexitySlider.frame) + 10;
    
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:CGRectMake(normalLableX, normalLableY, normalLabelWidth, normalLabelHeight)];
    normalLabel.text = @"Normal";
    normalLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:normalLabel];
}

- (void)setupNightmareLabel
{
    CGFloat nightmareLabelWidth = 90.0;
    CGFloat nightmareLabelHeight = 30.0;
    CGFloat nightmareLableX = CGRectGetMidX(self.gameComplexitySlider.frame) - 35;
    CGFloat nightmareLableY = CGRectGetMidY(self.gameComplexitySlider.frame) + 10;
    
    UILabel *nightmareLabel = [[UILabel alloc] initWithFrame:CGRectMake(nightmareLableX, nightmareLableY, nightmareLabelWidth, nightmareLabelHeight)];
    nightmareLabel.text = @"Nightmare";
    nightmareLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:nightmareLabel];
}

- (void)setupHellLabel
{
    CGFloat hellLabelWidth = 60.0;
    CGFloat hellLabelHeight = 30.0;
    CGFloat hellLableX = CGRectGetMidX(self.gameComplexitySlider.frame) + CGRectGetWidth(self.gameComplexitySlider.frame)/2 -20;
    CGFloat hellLableY = CGRectGetMidY(self.gameComplexitySlider.frame) + 10;
    
    UILabel *hellLabel = [[UILabel alloc] initWithFrame:CGRectMake(hellLableX, hellLableY, hellLabelWidth, hellLabelHeight)];
    hellLabel.text = @"Hell";
    hellLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:hellLabel];
}

- (void)setupReturnButton
{
    CGFloat returnButtonWidth = 200.0;
    CGFloat returnButtonHeight = 50.0;
    CGFloat returnButtonX = CGRectGetMidX(self.view.frame) - returnButtonWidth/2;
    CGFloat returnButtonY =CGRectGetMidY(self.view.frame) - returnButtonHeight/2;
    
    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.returnButton addTarget:self action:@selector(returnToGameViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.returnButton setTitle:@"Return" forState:UIControlStateNormal];
    self.returnButton.frame = CGRectMake(returnButtonX, returnButtonY, returnButtonWidth, returnButtonHeight);
    self.returnButton.layer.cornerRadius = returnButtonHeight/2;
    self.returnButton.layer.shadowOffset = CGSizeMake(15.0, 15.0);
    self.returnButton.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    self.returnButton.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.returnButton.layer.shadowOffset = CGSizeMake(0,4);
    self.returnButton.layer.shadowOpacity = 0.9;
    self.returnButton.layer.borderWidth = 2;
    self.returnButton.backgroundColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
    [self.view addSubview:self.returnButton];
}

- (void)returnToGameViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

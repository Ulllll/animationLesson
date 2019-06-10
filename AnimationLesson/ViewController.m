
#import "ViewController.h"
#import "HeaderView.h"

@interface ViewController () <UIScrollViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) UIView *tView;

@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.tView = [UIView new];
	[self.view addSubview:self.tView];
	
	self.header = [HeaderView new];
	[self.view addSubview:self.header];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"New button" forState:UIControlStateNormal];
    button.frame = CGRectMake(135.0, 630.0, 160.0, 40.0);
    button.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1];

    [self.view addSubview:button];
	
	self.header.translatesAutoresizingMaskIntoConstraints = NO;
	self.tView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSArray<NSLayoutConstraint *> *constraints =
		@[
		  [self.header.topAnchor constraintEqualToAnchor:self.view.topAnchor],
		  [self.header.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
		  [self.header.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
		  [self.header.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor],
		  
		  [self.tView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor],
		  [self.tView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
		  [self.tView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
		  [self.tView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
          
		  ];
	
	[NSLayoutConstraint activateConstraints:constraints];
    
    CABasicAnimation *pulsingAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulsingAnimation.autoreverses = YES;
    pulsingAnimation.duration = 1.5;
    pulsingAnimation.repeatCount = INFINITY;
    pulsingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulsingAnimation.fillMode = kCAFillModeForwards;
    pulsingAnimation.fromValue =  @(1.);
    pulsingAnimation.toValue = @(2.);
    pulsingAnimation.removedOnCompletion = NO;
    
    [self.header.backImage.layer addAnimation:pulsingAnimation forKey:@"pulsing"];

}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

@end

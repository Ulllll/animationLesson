
#import "HeaderView.h"

@interface HeaderView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *backImage;


@end

@implementation HeaderView

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1];
		[self setupUI];
	}
	return self;
}


- (void)setupUI
{
	self.imageView = [UIImageView new];
	self.imageView.image = [UIImage imageNamed:@"img"];
	self.imageView.layer.cornerRadius = 50.;
	self.imageView.contentMode = UIViewContentModeScaleAspectFill;
	self.imageView.clipsToBounds = YES;
	self.imageView.layer.borderWidth = 3.;
	self.imageView.layer.borderColor = UIColor.whiteColor.CGColor;
	[self addSubview:self.imageView];
    
    self.backImage = [UIImageView new]; 
    self.backImage.image = [UIImage imageNamed:@"circle"];
    [self addSubview:self.backImage];
    
    
	self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.backImage.translatesAutoresizingMaskIntoConstraints = NO;
	NSArray<NSLayoutConstraint *> *constraints =
  		@[
		  [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
		  [self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
		  [self.imageView.widthAnchor constraintEqualToConstant:100.],
		  [self.imageView.heightAnchor constraintEqualToConstant:100.],
          
          [self.backImage.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
          //[self.backImage.topAnchor constraintEqualToAnchor:self.imageView.topAnchor constant: 1.f],
          [self.backImage.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
          [self.backImage.widthAnchor constraintEqualToConstant:115.],
          [self.backImage.heightAnchor constraintEqualToConstant:115.],
		  ];
	
	[NSLayoutConstraint activateConstraints:constraints];
}




@end

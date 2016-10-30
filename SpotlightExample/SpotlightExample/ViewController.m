//
//  ViewController.m
//  SpotlightExample
//
//  Created by Le Hai Nam on 10/30/16.
//  Copyright © 2016 FlySoFast. All rights reserved.
//

#import "ViewController.h"
#import "FFSpotLightView.h"
@interface ViewController (){
  FFSpotLightView *spotlightController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.


}

-(void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];

  spotlightController=[[FFSpotLightView alloc] initInView:self.view];

  [[[[[[spotlightController addGuidelineForView:self.button] setShape:FFSpotlightShapeRectangle] setInstruction:@"This is a button with rectangle spotlight shape, 400pt width and down direction tooltip view arrow"] setWidth:400] setArrowDirection:JDFTooltipViewArrowDirectionDown] submitGuide];

  [[[[[spotlightController addGuidelineForView:self.button2] setShape:FFSpotlightShapeOval] setInstruction:@"This is a button with oval spotlight shape and up direction tooltip view arrow"] setArrowDirection:JDFTooltipViewArrowDirectionLeft]submitGuide];

  [[[[[spotlightController addGuidelineForView:self.button3] setShape:FFSpotlightShapeOval] setInstruction:@"After touching this button, the guideline tutorial will be disappeared"] setArrowDirection:JDFTooltipViewArrowDirectionDown] submitGuide];

  [spotlightController showSpotlight];

}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
  spotlightController=nil;
}
- (IBAction)button1:(id)sender {
  [spotlightController moveToNextGuide];

}

- (IBAction)button2:(id)sender {
   [spotlightController moveToNextGuide];
}
- (IBAction)button3:(id)sender {
   [spotlightController moveToNextGuide];
}

@end

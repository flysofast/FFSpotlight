//
//  STSpotLightView.m
//  NightClubFlash
//
//  Created by Le Hai Nam on 8/23/16.
//  Copyright © 2016 SofttechVN Inc. All rights reserved.
//

#import "FFSpotLightView.h"


@interface FFSpotLightView(){
  CGRect interactableArea;
  CAShapeLayer *maskLayer;
  UIView *parentView;

  NSMutableArray *guidelineViews;
  FFGuideline *newGuideline;
  int currentGuidelineIndex;
  JDFSequentialTooltipManager *tooltipManager;
  UIButton *skipButton;

}
@end

@implementation FFSpotLightView

static BOOL isPresenting=NO;

-(instancetype)initInView:(UIView* )view{
  self=[super initWithFrame:view.bounds];
  if(self){

    //FOR TRAPPING TAP GESTURES
    self.userInteractionEnabled=YES;

    self.backgroundColor = [UIColor colorWithRed:0	 green:0 blue:0 alpha:0.9];

    parentView=view;

    guidelineViews=[NSMutableArray new];

    skipButton=[[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width-170, 0, 170, 50)];
    [skipButton setTitle:@"SKIP TUTORIAL" forState:UIControlStateNormal];
    [skipButton setBackgroundColor:[UIColor colorWithRed:50/255.0 green:216/255.0 blue:229/255.0 alpha:1]];
    [skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [skipButton addTarget:self
               action:@selector(skipButtonTouched:)
     forControlEvents:UIControlEventTouchUpInside];
    [parentView addSubview:skipButton];

  }
  return self;
}

-(void)skipButtonTouched:(id)sender{
  [self hideSpotlight];
}


//IMPORTANT: TRAP ALL TOUCH EXCEPT FOR THOSE INSIDE OF THE HIGHLIGHTED CONTROL'S BOUNDS
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{


  if(CGRectContainsPoint(interactableArea, point)||CGRectContainsPoint(skipButton.frame, point)){
//        maskLayer = [[CAShapeLayer alloc] init];
//    [self moveSpotlightIndex:currentGuidelineIndex+1];

    return NO;

  }
  return YES;

}

-(void)createHoleWithView:(UIView*)highlightView shape:(FFSpotlightShape)shape{
  if(!maskLayer){
    maskLayer = [[CAShapeLayer alloc] init];
  }

  CGMutablePathRef maskPath = CGPathCreateMutable();
  CGPathAddRect(maskPath, NULL, self.bounds); // this line is new

  CGRect spotLight=highlightView.frame;

  UIBezierPath *path;
  if(shape==FFSpotlightShapeOval){
    path=[UIBezierPath bezierPathWithOvalInRect:spotLight];
  }
  if(shape==FFSpotlightShapeRectangle){
    path=[UIBezierPath bezierPathWithRect:spotLight];
  }

  CGPathAddPath(maskPath, nil, path.CGPath);
  [maskLayer setPath:maskPath];
  maskLayer.fillRule = kCAFillRuleEvenOdd;// this line is new
  CGPathRelease(maskPath);
  self.layer.mask = maskLayer;
  interactableArea=highlightView.frame;
}

-(void)moveToNextGuide{
  [self moveSpotlightIndex:currentGuidelineIndex+1];
}

-(void)moveSpotlightIndex:(int)index{

  if(index<guidelineViews.count){

    FFGuideline *guide=((FFGuideline*)guidelineViews[index]);
    [UIView animateWithDuration:0.3 animations:^{
      self.alpha=0;
    } completion:^(BOOL finished) {

      [self createHoleWithView:guide.view shape:guide.shape];

      currentGuidelineIndex=index;

      if(![self isDescendantOfView:parentView]){
        [parentView addSubview:self];
        [parentView bringSubviewToFront:skipButton];
      }

      [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0.5;
        [tooltipManager showNextTooltip];

      }];
      
    }];
  }else{

    NSLog(@"The guide queue is clear");
    [self hideSpotlight];
  }

}

-(void)showSpotlight{
  if(isPresenting){
    return;
  }

  self.alpha=0;

  currentGuidelineIndex=0;

  tooltipManager = [[JDFSequentialTooltipManager alloc] initWithHostView:self];
  for (int i=0;i<guidelineViews.count;i++){

    FFGuideline *guide=(FFGuideline*)guidelineViews[i];

//    [tooltipManager addTooltipWithTargetView:guide.view hostView:self tooltipText:guide.instruction arrowDirection:guide.arrowDirection width:guide.width];


    JDFTooltipView *tooltip=[[JDFTooltipView alloc] initWithTargetView:guide.view hostView:self tooltipText:guide.instruction arrowDirection:guide.arrowDirection width:guide.width];
    [tooltip setTooltipBackgroundColour:[UIColor blueColor]];
    [tooltip setShadowEnabled:NO];
    [tooltipManager addTooltip:tooltip];
  }

  isPresenting=YES;

  [self moveSpotlightIndex:currentGuidelineIndex];

}
-(void)hideSpotlight{
  guidelineViews=nil;
  [UIView animateWithDuration:0.5 animations:^{
    self.alpha=0;
    skipButton.alpha=0;
  } completion:^(BOOL finished) {
    [skipButton removeFromSuperview];
    [self removeFromSuperview];
  }
   ];

  isPresenting=NO;
}

#pragma mark - Adding new Guideline
-(instancetype)addGuide{

  return self;
}


-(void)submitGuide{
    [guidelineViews addObject:newGuideline];
}


-(instancetype)addGuidelineForView:(UIView*)view{

  if(view){

    newGuideline=[FFGuideline new];
    newGuideline.view=view;
  }
  else{
    NSLog(@"Cannot set guideline to nil view");
  }
  return self;
}

-(instancetype)setShape:(FFSpotlightShape)shape{

    newGuideline.shape=shape;

  return self;
}

-(instancetype)setArrowDirection:(JDFTooltipViewArrowDirection) arrowDirection{
  if(arrowDirection){
    newGuideline.arrowDirection=arrowDirection;
  }
  return self;
}

-(instancetype)setWidth:(float)width{
  if(width>0){
    newGuideline.width=width;
  }
  return self;
}

-(instancetype)setInstruction:(NSString*)instruction{
  if(instruction){
    newGuideline.instruction=instruction;
  }

  return self;
}

@end

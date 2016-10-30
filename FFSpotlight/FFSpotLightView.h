//
//  STSpotLightView.h
//  NightClubFlash
//
//  Created by Le Hai Nam on 8/23/16.
//  Copyright © 2016 SofttechVN Inc. All rights reserved.
//

#import "FFGuideline.h"
//#import <Foundation/Foundation.h>
//@protocol FFSpotLightViewDelegate:NSObject
//@optional
//
//@end

@interface FFSpotLightView : UIView


-(instancetype)initInView:(UIView* )view;
-(void)showSpotlight;
-(void)moveToNextGuide;

-(void)submitGuide;

-(instancetype)addGuidelineForView:(UIView*)view;

-(instancetype)setShape:(FFSpotlightShape)shape;

-(instancetype)setArrowDirection:(JDFTooltipViewArrowDirection) arrowDirection;

-(instancetype)setWidth:(float)width;

-(instancetype)setInstruction:(NSString*)instruction;


@end

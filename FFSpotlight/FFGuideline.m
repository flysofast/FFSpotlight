//
//  FFGuideline.m
//  NightClubFlash
//
//  Created by Le Hai Nam on 8/24/16.
//  Copyright © 2016 SofttechVN Inc. All rights reserved.
//

#import "FFGuideline.h"

@implementation FFGuideline
-(instancetype)init{
  self.width=200;
  self.instruction=@"";
  self.arrowDirection=JDFTooltipViewArrowDirectionUp;
  self.shape=FFSpotlightShapeOval;
  return self;
}
@end

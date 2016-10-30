//
//  FFGuideline.h
//  NightClubFlash
//
//  Created by Le Hai Nam on 8/24/16.
//  Copyright © 2016 SofttechVN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JDFTooltips.h"

typedef NS_ENUM(NSUInteger, FFSpotlightShape) {

  FFSpotlightShapeRectangle,
  FFSpotlightShapeOval,
  FFSpotlightShapeTypeCount
};

@interface FFGuideline : NSObject
@property (nonatomic,strong) NSString* instruction;
@property (nonatomic,strong) UIView* view;
@property (nonatomic,assign) JDFTooltipViewArrowDirection arrowDirection;
@property (nonatomic,assign) float width;
@property (nonatomic,assign) FFSpotlightShape shape;
@end

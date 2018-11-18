# FSFTutorialSpotlight
Spotlight tutorial view for iOS - Objective-C

This was inspired by [TourGuide](https://github.com/worker8/TourGuide) for Android. It was my attemp to replicate the library with the same workflow. It lets you add pointer, overlay and tooltip easily, guiding users on how to use your app.

Click [here to see my Vietnamese blog post about it](http://flysofast.comuv.com/2016/10/30/tao-huong-dan-su-dung-cho-nguoi-dung-theo-dang-spotlight/?preview=true&preview_id=187&preview_nonce=1a1f80695d&post_format=standard)

#Demo:

![Result](https://github.com/flysofast/FSFTutorialSpotlight/blob/master/FFSpotlightDemo.gif)

#Installation and Usage:
Copy everything from `FFSpotlight` folder to your project and use it like this:
``` objc
    // In your interface
@interface ViewController (){
  FFSpotLightView *spotlightController;
}
- (void)viewDidLoad {
  [super viewDidLoad];

  spotlightController=[[FFSpotLightView alloc] initInView:self.view];

  //The properties of the guideline view (width, arrow direction, shape,..) can be set in random order
  [[[[[[spotlightController addGuidelineForView:self.button] setShape:FFSpotlightShapeRectangle] setInstruction:@"This is a button with rectangle spotlight shape, 400pt width and down direction tooltip view arrow"] setWidth:400] setArrowDirection:JDFTooltipViewArrowDirectionDown] submitGuide];

  [[[[[spotlightController addGuidelineForView:self.button2] setShape:FFSpotlightShapeOval] setInstruction:@"This is a button with oval spotlight shape and up direction tooltip view arrow"] setArrowDirection:JDFTooltipViewArrowDirectionLeft]submitGuide];

  [[[[[spotlightController addGuidelineForView:self.button3] setShape:FFSpotlightShapeOval] setInstruction:@"After touching this button, the guideline tutorial will be disappeared"] setArrowDirection:JDFTooltipViewArrowDirectionDown] submitGuide];

  [spotlightController showSpotlight];
}

```
See more in the `SpotlightExample` project

#Open sources:
- [JDFTooltips](https://github.com/JoeFryer/JDFTooltips) by ([@JoeFryer](https://twitter.com/joefryer88))

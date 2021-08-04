//
//  CanvasComponent.m
//  GcanvasDemo
//
//  Created by MOMO on 2021/6/25.
//

#import "CanvasComponent.h"
#import <GLKit/GLKit.h>
@interface CanvasComponent()
@property(nonatomic, strong) NSString* componentIdPro;
@property(nonatomic, assign) CGFloat devicePixelRatioPro;
@end
@implementation CanvasComponent
-(instancetype) initWithFrame:(CGRect)frame{
    if (self == [super init]) {
        if(!self.glkview){
            GLKView *glkview = [[GLKView alloc] initWithFrame:frame];
            glkview.enableSetNeedsDisplay = YES;
            glkview.userInteractionEnabled = YES;
            glkview.drawableDepthFormat = GLKViewDrawableDepthFormat24;
            glkview.layer.borderWidth = 0.5f;
            self.glkview = glkview;
        }
    }
    return self;
}
- (void)setInfo:(NSString *)componentId devicePixelRatio:(CGFloat)radio {
    self.componentIdPro = componentId;
    self.devicePixelRatioPro = radio;
}
- (NSString *)componentId {
    return self.componentIdPro;
}
- (CGFloat)devicePixelRatio {
    return self.devicePixelRatioPro;
}
- (BOOL)needChangeEAGLContenxt {
    return NO;
}
- (BOOL)isOffscreen {
    return NO;
}
@end

//
//  CanvasComponent.h
//  GcanvasDemo
//
//  Created by MOMO on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import <GCanvas/GCanvasViewProtocol.h>
NS_ASSUME_NONNULL_BEGIN

@interface CanvasComponent : NSObject<GCanvasViewProtocol>
@property(nonatomic, strong) GLKView* glkview;
-(instancetype)initWithFrame: (CGRect) frame;
-(void) setInfo: (NSString*) componentId devicePixelRatio: (CGFloat) radio;
@end

NS_ASSUME_NONNULL_END

//
//  ViewController.m
//  GcanvasDemo
//
//  Created by momo.com on 2021/6/21.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>
#import <GCanvas/GCanvasSDK.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "CanvasComponent.h"
@interface ViewController ()<GCanvasModuleProtocol>
@property(nonatomic, strong) GCanvasPlugin* gplugin;
@property(nonatomic, strong) NSString* componentId;
@property(nonatomic, strong) NSMutableDictionary* moduleDict;
@property(nonatomic, strong) GCanvasModule* gmodule;

@end

@implementation ViewController
- (NSString *)gcanvasModuleInstanceId {
    return @"component1";
}
- (id<GCanvasViewProtocol>)gcanvasComponentById:(NSString *)componentId {
    if (!self.moduleDict[componentId]) {
        CanvasComponent *com = [[CanvasComponent alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
        [com setInfo:self.componentId devicePixelRatio:2.0];
        [self.view addSubview:com.glkview];
        [self.moduleDict setObject:com forKey:componentId];
    }
    return self.moduleDict[componentId];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.moduleDict = [[NSMutableDictionary alloc] init];
    self.componentId = @"component1";
    GCanvasModule *gmodule = [[GCanvasModule alloc] initWithDelegate:self];
    [gmodule enable:@{
        @"componentId": self.componentId
    }];
    self.gmodule = gmodule;
    // 核心代码1, 设置context
    GCanvasObject *gobj = self.gmodule.gcanvasObjectDict[self.componentId];
    CanvasComponent *com = gobj.component;
    [EAGLContext setCurrentContext:com.glkview.context];
    // 核心代码2, 设置绘制区域
    GCanvasPlugin *plugin = gobj.plugin;
    [plugin setFrame:CGRectMake(0, 0, 400, 400)];// 这里的400,和上面200对应, 因为设置的分辨率是2.0
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
-(void) run {
    [self.gmodule render:@"n50,50,100,100;" componentId:self.componentId];// 这里只是一个示例命令, 具体命令参考gcanvas-brige的js版本源码
}

@end

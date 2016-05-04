//
//  Browser.m
//  Browser
//
//  Created by mopsicus.ru
//

#import <UIKit/UIKit.h>

extern UIViewController *UnityGetGLViewController(); // Главный контроллер Unity

@interface Browser : UIViewController {
    UIWebView *webView;
}
@end

@implementation Browser;

// Показываем браузер
- (void)showBrowser {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height)];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, screenRect.size.width, screenRect.size.height - 300)]; // для примера
    [UnityGetGLViewController().view addSubview:webView];
}

// Загрузить страницу
- (void)loadUrl:(NSString *)url {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

// Убрать браузер
- (void)close {
    [webView removeFromSuperview];
    webView = NULL;
}

static Browser *browser = NULL;

extern "C" {
    
    void browserLaunch () {
        if (browser == NULL)
            browser = [[Browser alloc] init];
        [browser showBrowser];
    }
    
    void browserLoadUrl (const char* url) {
        [browser loadUrl:[NSString stringWithUTF8String:url]];
    }
    
    void browserClose () {
        [browser close];
    }
    
}


@end

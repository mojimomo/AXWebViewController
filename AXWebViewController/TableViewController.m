//
//  TableViewController.m
//  AXWebViewController
//
//  Created by ai on 15/12/23.
//  Copyright © 2015年 AiXing. All rights reserved.
//

#import "TableViewController.h"
#import "AXWebViewController.h"
#import "AXPracticalHUD.h"

@interface TableViewController () <UITextFieldDelegate>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringFromTableInBundle(@"back", @"AXWebViewController", [NSBundle bundleWithPath:[[[NSBundle bundleForClass:NSClassFromString(@"AXWebViewController")] resourcePath] stringByAppendingPathComponent:@"AXWebViewController.bundle"]], @"Back") style:0 target:nil action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithURL:[NSURL fileURLWithPath:[NSBundle.mainBundle pathForResource:@"Swift" ofType:@"pdf"]]];
            webVC.title = @"Swift.pdf";
            webVC.showsToolBar = NO;
            if (AX_WEB_VIEW_CONTROLLER_iOS9_0_AVAILABLE()) {
                webVC.webView.allowsLinkPreview = YES;
            }
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
        case 1:
        {
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"http://www.baidu.com"];
            webVC.showsToolBar = NO;
            // webVC.showsNavigationCloseBarButtonItem = NO;
            if (AX_WEB_VIEW_CONTROLLER_iOS9_0_AVAILABLE()) {
                webVC.webView.allowsLinkPreview = YES;
            }
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
        case 2:
        {
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"http://www.baidu.com"];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
            nav.navigationBar.tintColor = [UIColor colorWithRed:0.322 green:0.322 blue:0.322 alpha:1.00];
            [self presentViewController:nav animated:YES completion:NULL];
            webVC.showsToolBar = YES;
            webVC.navigationType = 1;
        }
            break;
        case 3: {
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"https://github.com/devedbox/AXWebViewController"];
            webVC.showsToolBar = NO;
            webVC.showsBackgroundLabel = NO;
            // webVC.showsNavigationBackBarButtonItemTitle = NO;
            if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
                webVC.webView.allowsLinkPreview = YES;
            }
            [self.navigationController pushViewController:webVC animated:YES];
        } break;
        case 4: {
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"https://github.com/devedbox/AXWebViewController/releases/latest"];
            webVC.showsToolBar = NO;
            if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
                webVC.webView.allowsLinkPreview = YES;
            }
            [self.navigationController pushViewController:webVC animated:YES];
        } break;
        default:
            break;
    }
}

- (void)handle:(id)sender {
    NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"AXWebViewController.bundle/html.bundle/neterror" ofType:@"html" inDirectory:nil]];
    AXWebViewController *webVC = [[AXWebViewController alloc] initWithURL:URL];
    webVC.showsToolBar = NO;
    webVC.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.100f green:0.100f blue:0.100f alpha:0.800f];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.996f green:0.867f blue:0.522f alpha:1.00f];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (IBAction)gotoGithub:(id)sender {
    AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"https://github.com/devedbox/AXWebViewController"];
    webVC.showsToolBar = NO;
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
        webVC.webView.allowsLinkPreview = YES;
    }
    [self.navigationController pushViewController:webVC animated:YES];
}

- (IBAction)clearCache:(id)sender {
    [[AXPracticalHUD sharedHUD] showNormalInView:self.navigationController.view text:@"清理缓存..." detail:nil configuration:NULL];
    [AXWebViewController clearWebCacheCompletion:^{
        [[AXPracticalHUD sharedHUD] hide:YES afterDelay:0.5 completion:NULL];
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Get the text of text field.
    NSString *text = [textField.text copy];
    // Create an url object with the text string.
    NSURL *URL = [NSURL URLWithString:text];
    
    if (URL) {
        [self.view endEditing:YES];
        
        AXWebViewController *webVC = [[AXWebViewController alloc] initWithURL:URL];
        webVC.showsToolBar = NO;
        if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
            webVC.webView.allowsLinkPreview = YES;
        }
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
    return YES;
}
@end

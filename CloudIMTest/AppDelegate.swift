//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by 赵晓东 on 16/3/29.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?

    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let userInfo = RCUserInfo()
        
        userInfo.userId = userId
        
        switch userId {
            case "xiaobo":
                userInfo.name = "小波"
                userInfo.portraitUri = "http://cdn.duitang.com/uploads/item/201207/24/20120724123200_x85tj.jpeg"
            case "xiaobo2":
                userInfo.name = "小波2"
                userInfo.portraitUri = "http://img5.duitang.com/uploads/item/201508/28/20150828130108_fYxJF.jpeg"
            default:
                print("无此用户")
        }
        
        return completion(userInfo)
    }
    
    
    func connectServer(completion:() -> Void) {
        
        //查询保存的token
        //let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        //初始化appKey
        RCIM.sharedRCIM().initWithAppKey("z3v5yqkbvtbx0")
        
        //设置用户信息提供着为自己
        RCIM.sharedRCIM().userInfoDataSource = self
        
        //用token测试链接
    RCIM.sharedRCIM().connectWithToken("70pasIAbGXLyghO5lkgaboNSgeVjgxeEfAfYWipsFksSeXW87WFuvSySvXRJaerJfMgrRHF28k0Xa3foppDP0A==", success: { (_) -> Void in
        
        
            print("连接成功1！")
        
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
            
//            let currentUser = RCUserInfo(userId: "zhaoxd", name: "赵晓东", portrait: "http://imgreader.gmw.cn/attachement/jpg/site2/20160329/002564a615ae1864239960.jpg")
//            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
        
        }, error: { (_) -> Void in
            print("连接失败！")
        }) { () -> Void in
            print("Token不正确，或已经失效")
        }
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationVC = UINavigationController(rootViewController: LoginViewController());
        self.window?.rootViewController = navigationVC;
        self.window?.makeKeyAndVisible();
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


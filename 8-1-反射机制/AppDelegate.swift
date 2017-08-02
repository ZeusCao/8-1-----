//
//  AppDelegate.swift
//  8-1-反射机制
//
//  Created by Zeus on 2017/8/1.
//  Copyright © 2017年 Zeus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // **注意：window是可选的
    var window: UIWindow?
    
    /**
        1. swift中有命名空间
          -- 在同一个命名空间下，全局共享
          -- 第三方框架使用swift如果直接拖拽到项目中，从属于同一个命名空间，很有可能冲突
          -- 第三方尽量都要用cocoaPods
        2. 重点要知道swift中NSClassFromString（反射机制）的写法
          -- 反射最重要的目的就是用来解耦
     */


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // ***** 代码中的问好都是可选解包，发送消息，不参与计算
        // 1. 实例化window
        window = UIWindow()
        window?.backgroundColor = UIColor.red
        // 2. 设置根视图控制器: 方法2需要添加命名空间——》默认是项目名称（最好不要有数字和特殊符号）
        
          // 方法1
          //let vc = ViewController()
          // 方法2 （可以修改名字：BuildSetting 里面Product Name）
          //let clsName = "XXX反射机制.ViewController" //（不能用数字和特殊符号）
         // 上一行也可这样取值(动态获取命名空间)

         let ns = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
         // 还可以写成
          //let ns = Bundle.main.nameSpace()
        
         let clsName = ns + "." + "ViewController"
          // AnyClass? -> 视图控制器的类型
          let cls = NSClassFromString(clsName) as? UIViewController.Type
          // 使用类创建视图控制器
          let vc = cls?.init()
        
        
        window?.rootViewController = vc
        // 3. 让window可见
        window?.makeKeyAndVisible()
        
        return true
        
        // 输出info.plist的内容
        print(Bundle.main.infoDictionary ?? "")
        
        
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


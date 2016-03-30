//
//  ViewController.swift
//  CloudIMTest
//
//  Created by 赵晓东 on 16/3/29.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createViewContollers()
    }
    
    
    func createViewContollers() {
        
        let firstVC = UINavigationController(rootViewController: ConversationListViewController())
        let item1 : UITabBarItem = UITabBarItem (title: "会话", image: UIImage(named: "un_tabbar_information@2x.png"), selectedImage: UIImage(named: "tabbar_information@2x.png"))
        firstVC.tabBarItem = item1
        
        let secondVC = UINavigationController(rootViewController: ContactViewController())
        let item2 : UITabBarItem = UITabBarItem (title: "通讯录", image: UIImage(named: "un_tabbar_tool@2x.png"), selectedImage: UIImage(named: "tabbar_tool@2x.png"))
        secondVC.tabBarItem = item2
        
        let otherVC = UINavigationController(rootViewController: ServeViewController())
        let item3 : UITabBarItem = UITabBarItem (title: "客服", image: UIImage(named: "un_tabbar_venues@2x.png"), selectedImage: UIImage(named: "tabbar_venues@2x.png"))
        otherVC.tabBarItem = item3
        
        let fourVC = UINavigationController(rootViewController: AboutViewController())
        let item4 : UITabBarItem = UITabBarItem (title: "关于", image: UIImage(named: "un_tabbar_user@2x.png"), selectedImage: UIImage(named: "tabbar_user@2x.png"))
        fourVC.tabBarItem = item4
        
        let tabArray = [firstVC,secondVC,otherVC,fourVC]
        self.viewControllers = tabArray
        
        
        //.自定义工具栏
        self.tabBar.backgroundImage = UIImage(named: "tabbar_bg@2x.jpg")
        
        //.设置底部工具栏文字颜色（默认状态和选中状态）
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:RGBA (152.0, g:153.0, b: 154.0, a: 1), forKey:NSForegroundColorAttributeName) as? [String : AnyObject], forState:UIControlState.Normal);
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:RGBA (119.0, g:142.0, b: 28.0, a: 1), forKey:NSForegroundColorAttributeName) as? [String : AnyObject], forState:UIControlState.Selected)
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


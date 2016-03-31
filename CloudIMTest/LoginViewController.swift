//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by 赵晓东 on 16/3/31.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.createNav()
     
        self.createView()
    }
    
    func createNav() {
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = false
        
        //设置导航的标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:RGBA (255.0, g:255.0, b: 255.0, a: 1),NSFontAttributeName:UIFont.systemFontOfSize(18)]
        self.navigationItem.title = "登录"
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = RGBA (86.0, g:173.0, b: 216.0, a: 1)
    }
    
    
    func createView() {
    
        let UserNameTextFeild = createTextField(CGRect(x:20, y:380 ,width:WIDTH-40, height:30), placeholder: "请输入用户名", passWord: false, Font: 14)
        self.view.addSubview(UserNameTextFeild)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

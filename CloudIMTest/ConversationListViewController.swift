//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by 赵晓东 on 16/3/30.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createNav()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in
            
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue,
                ])
            
            self.refreshConversationTableViewIfNeeded()
        })
        
    }
    
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        
        let conVC = RCConversationViewController()
        conVC.targetId = model.targetId
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        
        conVC.title = model.conversationTitle
        conVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(conVC, animated: true)
    }
    
    
    
    
    
    
    func createNav() {
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = false
        
        //设置导航的标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:RGBA (255.0, g:255.0, b: 255.0, a: 1),NSFontAttributeName:UIFont.systemFontOfSize(18)]
        self.navigationItem.title = "最近会话"
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = RGBA (86.0, g:173.0, b: 216.0, a: 1)
        
//        let item4:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("buttonClick:"))
//        self.navigationItem.rightBarButtonItem = item4
        
        let button = UIButton(type:.Custom)
        button.frame = CGRectMake(0, 0, 50, 30)
        button.setTitle("添加", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("buttonClick:"), forControlEvents:UIControlEvents.TouchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func buttonClick(button:UIButton) {
        var frame = button.frame
        frame.origin.y = frame.origin.y + 30
        
        KxMenu.showMenuInView(self.view, fromRect:frame , menuItems: [
            KxMenuItem("客服",image: UIImage(named: "tabbar_information@2x.png"), target: self, action: "ClickMenu1"),
            KxMenuItem("测试与小波聊天",image: UIImage(named: "tabbar_tool@2x.png"), target: self, action: "ClickMenu2"),
            
            ])
        
        
    }
    
    func ClickMenu1() {
        print("你点击了第一项")
    }
    
    func ClickMenu2() {
        let conVC = RCConversationViewController()
        conVC.targetId = "xiaobo"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        
        conVC.title = "小波"
        conVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(conVC, animated: true)
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

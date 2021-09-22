//
//  MainTabbarViewController.swift
//  Alarm
//
//  Created by 陳郁勳 on 2021/9/13.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 建立四個變數存放ViewController，提供以下做設定
        let worldClockVC = WorldClockViewController()
        let alarmVC = AlarmViewController()
        let stopWatchVC = StopWatchViewController()
        let timerVC = TimerViewController()
        
        // 設定這四個ViewController在Tabbar上面顯示的圖片
        worldClockVC.tabBarItem.image = UIImage(systemName: "network")
        alarmVC.tabBarItem.image = UIImage(systemName: "alarm.fill")
        stopWatchVC.tabBarItem.image = UIImage(systemName: "stopwatch.fill")
        timerVC.tabBarItem.image = UIImage(systemName: "timer")
        
        // 設定這四個ViewController在Tabber上的文字
        worldClockVC.title = "世界時鐘"
        alarmVC.title = "鬧鐘"
        stopWatchVC.title = "碼表"
        timerVC.title = "計時器"
        
        //由於鬧鐘頁面最上頭有NavigationBar，因此將鬧鐘設定為NavigationController
        let navAlarm = UINavigationController(rootViewController: alarmVC)
        
        // 讓NavigationBar不透明
        navAlarm.navigationBar.isTranslucent = false
        // 設定NavigationBar的背景顏色
        navAlarm.navigationBar.barTintColor = .black
        // 設定NavigationBar的文字顏色
        navAlarm.navigationBar.titleTextAttributes =  [.foregroundColor: UIColor.white]
    
        // 設定Tabbar背景色
        self.tabBar.barTintColor = .clear
        // 設定Tabbar的文字顏色
        self.tabBar.tintColor = .orange
        
        // 將四個ViewController依序加進TabbarController內
        setViewControllers([worldClockVC, navAlarm, stopWatchVC, timerVC], animated: false)
    }
}

//
//  AlarmViewController.swift
//  Alarm
//
//  Created by *** on 2021/9/13.
//

import UIKit
import SnapKit

class AlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 代表只要兩個Section
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            // 第一個Header下顯示一個Cell即可
            return 1
        default:
            // 其餘不顯示任何Cell
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        // 第一個Header要顯示哪個Cell
        case 0:
            // 將剛剛實作的Cell實體化，並顯示於畫面上
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WakeUpTableViewCell.identifier, for: indexPath) as? WakeUpTableViewCell else { return UITableViewCell() }
            return cell
        default:
            // 其餘的Header都顯示預設Cell
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            // 建立一個View，這個View為我們建立的「AlarmHeaderView」
            let view: AlarmHeaderView = {
                let view = AlarmHeaderView()
                
                // 將該HeaderView的內容文字更改為：「睡眠｜起床鬧鐘」
                view.headerViewLabel.text = "睡眠｜起床鬧鐘"
                
                // 回傳該View，作為第一個Setcion的HeaderView
                return view
            }()
            return view
        case 1:
            // 建立一個View，這個View為我們建立的「AlarmHeaderView」
            let view: AlarmHeaderView = {
                let view = AlarmHeaderView()
                
                // 將該HeaderView的內容文字更改為：「其他」
                view.headerViewLabel.text = "其他"
                
                // 回傳該View，作為第一個Setcion的HeaderView
                return view
            }()
            return view
        default:
            break
        }
        return UIView()
    }
    
    //MARK: - IBOutLets
    let alarmTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(WakeUpTableViewCell.self, forCellReuseIdentifier: WakeUpTableViewCell.identifier)
        
        // 將alarmTableView的背景色更改為灰色
        tableView.backgroundColor = .black
        
        return tableView
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setLayouts()
        // Set Navigation
        setNavigation()
        self.alarmTableView.delegate = self
        self.alarmTableView.dataSource = self
    }
    
    // MARK: - View Setting
    func setViews() {
        self.view.addSubview(alarmTableView)
    }
   
    func setLayouts() {
        alarmTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    // MARK: - Function
    func setNavigation() {
        //Left Button
        let editButton = UIBarButtonItem(title: "編輯",
                                         style: .plain,
                                         target: self,
                                         action: #selector(editAlarm))
        editButton.tintColor = .orange
        self.navigationItem.leftBarButtonItem = editButton

        //Right Button
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(addAlarm))
        addButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc func editAlarm() {
        
    }

    @objc func addAlarm() {
        let vc = AddAlarmViewController()
        let nv = UINavigationController(rootViewController: vc)
        present(nv, animated: true, completion: nil)
    }
}


        
    

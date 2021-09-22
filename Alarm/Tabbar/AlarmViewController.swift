//
//  AlarmViewController.swift
//  Alarm
//
//  Created by *** on 2021/9/13.
//

import UIKit
import SnapKit

class AlarmViewController: UIViewController {
    
    //MARK: - IBOutLets
    let alarmTableView: UITableView = {
        let tableView = UITableView()
        
        // 將alarmTableView的背景色更改為灰色
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setLayouts()
        // Set Navigation
        setNavigation()
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


        
    

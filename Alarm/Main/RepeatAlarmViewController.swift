//
//  RepeatAlarmViewController.swift
//  Alarm
//
//  Created by sapido on 2021/9/27.
//

import UIKit

protocol updateRepeatDelegate: AnyObject {
    func updateRepeatDetail(data: [Int])
}

class RepeatAlarmViewController: UIViewController {

    // MARK: - Properties
    weak var updateRepeatDelegate: updateRepeatDelegate?
    let titleDatas: [String] = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六",]
    var isSelected: [Int] = []
    
    // MARK: - IBLayOuts
    let repeatTableView: UITableView = {
        let tableView = UITableView()
        // 註冊Cell
        tableView.register(RepeatAlarmTableViewCell.self, forCellReuseIdentifier: RepeatAlarmTableViewCell.identifier)
        tableView.bounces = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setViews()
        setLayouts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        updateRepeatDelegate?.updateRepeatDetail(data: self.isSelected)
    }
    
    // MARK: - Function
    func initView() {
        
        // 設定navigationBar上面的文字
        self.title = "重複"
        
        // 設定navigation BackButton Color
        self.navigationController?.navigationBar.tintColor = .orange
        
        // 設定該ViewController的背景色
        self.view.backgroundColor = #colorLiteral(red: 0.1097886786, green: 0.1098149046, blue: 0.1183715835, alpha: 1)
        
        self.repeatTableView.delegate = self
        self.repeatTableView.dataSource = self
    }
    
    func setViews() {
        self.view.addSubview(repeatTableView)
    }
    
    func setLayouts() {
        repeatTableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(350)
        }
    }
}

extension RepeatAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepeatAlarmTableViewCell.identifier, for: indexPath) as? RepeatAlarmTableViewCell else {  return UITableViewCell() }
        
        cell.titleLabel.text = titleDatas[indexPath.row]
        
        // 預設Cell為沒被點擊過
        cell.selectionStyle = .none
        
        // 判斷Cell是否有在陣列中，有則打勾，沒有則不打勾
        if self.isSelected.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 判斷目前點擊的Cell是否有儲存於陣列中，有存在陣列中代表有點擊過
        if self.isSelected.contains(indexPath.row) {
            // 若已選擇過，則將該index移除陣列內
            self.isSelected = self.isSelected.filter{$0 != indexPath.row}
        } else {
            // 若未選擇過，則將該index加入陣列中
            self.isSelected.append(indexPath.row)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

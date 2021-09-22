//
//  addAlarmViewController.swift
//  Alarm
//
//  Created by 陳郁勳 on 2021/9/16.
//

import UIKit

class AddAlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addAlarmTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 告知TableView要使用哪個Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: addAlarmContentTableViewCell.identifier, for: indexPath)
                as? addAlarmContentTableViewCell else { return UITableViewCell() }

        // 設定Cell的TitleLabel內容
        cell.titleLabel.text = addAlarmTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

    // MARK: - IBLetOuts
    let timeLabel: UILabel = {
        let label = UILabel()
        // Label的文字顏色
        label.textColor = .white
        // Label的內容
        label.text = "時間"
        return label
    }()
    
    let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        // DatePicker 只顯示時間，不顯示日期
        datePicker.datePickerMode = .time
        // 讓DatePicker顯示24小時制
        datePicker.locale = Locale(identifier: "NL")
        // 讓DatePicker的樣式跟IPhone上一模一樣
        datePicker.preferredDatePickerStyle = .inline
        // 設定DatePicker的文字顏色
        datePicker.tintColor = .orange
        return datePicker
    }()
    
    let addAlarmTableView: UITableView  = {
        let tableView = UITableView()
        // 註冊 addAlarmContentTableViewCell
        tableView.register(addAlarmContentTableViewCell.self,
                           forCellReuseIdentifier: addAlarmContentTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Properties
    let addAlarmTitles = ["重複","標籤","提示聲","重複提醒"]
    
    // MARK: - LifrCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setViews()
        setLayouts()
        setNavigation()
    }
    
    // MARK: - SetViews
    func initView() {
        self.view.backgroundColor = #colorLiteral(red: 0.1106709018, green: 0.1056526229, blue: 0.1100939736, alpha: 1)
        // addAlarmTableView 的 delegate 由目前的ViewController實作
        self.addAlarmTableView.delegate = self
        // addAlarmTableView 的  由目前的ViewController實作
        self.addAlarmTableView.dataSource = self
    }
    
    func setViews() {
        self.view.addSubview(datePicker)
        self.view.addSubview(timeLabel)
        self.view.addSubview(addAlarmTableView)
    }
    
    func setLayouts() {
        datePicker.snp.makeConstraints { make in
            // 設定DatePicker元件的左邊距離畫面的左邊間隔17
            make.trailing.equalTo(self.view).offset(-17)
            // 設定DatePicker元件的頂部距離畫面的頂部間隔80
            make.top.equalTo(self.view).offset(120)
        }
        
        timeLabel.snp.makeConstraints { make in
            // 設定Label元件的頂部與底部皆與datePicker的頂部與底部一致
            make.top.bottom.equalTo(datePicker)
            // 設定Label元件的左邊距離畫面的左邊間隔17
            make.leading.equalTo(self.view).offset(17)
        }
        
        addAlarmTableView.snp.makeConstraints { make in
            // TableView 的左邊與右邊與畫面的左邊與右邊對齊
            make.leading.trailing.equalTo(self.view)
            // TableView 的頂部距離 timeLabel 的底部間隔 50
            make.top.equalTo(timeLabel.snp.bottom).offset(50)
            // TableView 的高度設為200
            make.height.equalTo(200)
        }
    }
    
    // MARK: - Functions
    
    func setNavigation() {
        // Set Navigatoin title
        self.title = "加入鬧鐘"
        
        //Set Navigation Title Color
        self.navigationController?.navigationBar.titleTextAttributes =  [.foregroundColor: UIColor.white]
        
        //Set Navigation Bar Background Color
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1577772796, green: 0.1526409686, blue: 0.1614466906, alpha: 1)
        
        //Left Button
        let cancelButton = UIBarButtonItem(title: "取消",
                                         style: .plain,
                                         target: self,
                                         action: #selector(backToMain))
        cancelButton.tintColor = .orange
        self.navigationItem.leftBarButtonItem = cancelButton

        //Right Button
        let saveButton = UIBarButtonItem(title: "儲存",
                                        style: .plain,
                                        target: self,
                                        action: #selector(saveAlarm))
        saveButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveAlarm() {
        
    }
    
    @objc func backToMain() {
        
    }
}

//extension AddAlarmViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return addAlarmTitles.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: addAlarmContentTableViewCell.identifier, for: indexPath) as? addAlarmContentTableViewCell else { return UITableViewCell() }
//
//        cell.titleLabel.text = addAlarmTitles[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}

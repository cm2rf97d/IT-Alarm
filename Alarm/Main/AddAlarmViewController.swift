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
        
        switch indexPath.row {
        
        // 當TableView顯示到第四欄時，顯示剛剛新增的AddAlarmButtonTableViewCell
        case 3:
            
            // 告知TableView要使用哪個Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddAlarmButtonTableViewCell.identifier, for: indexPath) as? AddAlarmButtonTableViewCell else { return UITableViewCell() }
            
            // 設定Cell的TitleLabel內容
            cell.titleLabel.text = addAlarmTitles[indexPath.row]
            return cell
            
        // 其他的欄位，顯示之前新增的AddAlarmContentTableViewCell
        default:
            
            // 告知TableView要使用哪個Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddAlarmContentTableViewCell.identifier, for: indexPath)
                    as? AddAlarmContentTableViewCell else { return UITableViewCell() }

            // 設定Cell的titleLabel內容
            cell.titleLabel.text = addAlarmTitles[indexPath.row]
            
            // 設定Cell的contentLabel內容
            cell.contentLabel.text = addAlarmDetails[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        // 點擊第一欄時，要做什麼
        case 0:
            let vc = RepeatAlarmViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        // 點擊第二欄時，要做什麼
        case 1:
            let vc = AlarmLabelViewController()
            
            // 讓AddAlarmViewController成為
            // AlarmLabelViewController的updateAlarmLabelDelegate的執行者
            vc.updateAlarmLabelDelegate = self
            
            // 使用navigationController的pushViewController()，達到畫面由右至左的效果。
            self.navigationController?.pushViewController(vc, animated: true)
        // 點擊第三欄時，要做什麼
        case 2:
            break
        // 點擊第四欄時，要做什麼
        case 3:
            break
        default:
            break
        }
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
        tableView.register(AddAlarmContentTableViewCell.self,
                           forCellReuseIdentifier: AddAlarmContentTableViewCell.identifier)
        
        // 註冊 addAlarmButtonTableViewCell
        tableView.register(AddAlarmButtonTableViewCell.self,
                           forCellReuseIdentifier: AddAlarmButtonTableViewCell.identifier)
        
        tableView.bounces = false
        return tableView
    }()
    
    // MARK: - Properties
    let addAlarmTitles = ["重複","標籤","提示聲","重複提醒"]
    var addAlarmDetails = ["永不","鬧鐘","雷達"] {
        didSet {
            // TableView重新抓取值
            addAlarmTableView.reloadData()
        }
    }
    
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

extension AddAlarmViewController: UpdateAlarmLabelDelegate {

    func updateAlarmLabel(alarmLabelText: String) {
        // 讓第二行Cell的Detail顯示回傳回來的文字
        self.addAlarmDetails[1] = alarmLabelText
    }
}

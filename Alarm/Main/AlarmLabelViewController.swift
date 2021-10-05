//
//  AlarmLabelViewController.swift
//  Alarm
//
//  Created by sapido on 2021/9/24.
//

import UIKit

protocol UpdateAlarmLabelDelegate: AnyObject {
    
    func updateAlarmLabel(alarmLabelText: String)
}

class AlarmLabelViewController: UIViewController {

    // MARK: - IBLayOuts
    let alarmLabelTextField: UITextField = {
        let textField = UITextField()
        textField.text = "鬧鐘"
        textField.textColor = .white
        textField.backgroundColor = #colorLiteral(red: 0.1537905931, green: 0.1488661468, blue: 0.1617964804, alpha: 1)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    // MARK: - Propreties
    weak var updateAlarmLabelDelegate: UpdateAlarmLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setViews()
        setLayouts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if let text = alarmLabelTextField.text {
            
            if text == "" { // 若輸入框內為空白，回傳「鬧鐘」
                updateAlarmLabelDelegate?.updateAlarmLabel(alarmLabelText: "鬧鐘")
            }else { // 若輸入框內不為空白，回傳「輸入框內的文字」
                updateAlarmLabelDelegate?.updateAlarmLabel(alarmLabelText: text)
            }
        }
    }
    
    func initView() {
        // 設定這個ViewController的背景色
        self.view.backgroundColor = #colorLiteral(red: 0.1097886786, green: 0.1098149046, blue: 0.1183715835, alpha: 1)
        // 設定NavigationBar的文字
        self.title = "標籤"
        // 設定navigation BackButton Color
        self.navigationController?.navigationBar.tintColor = .orange
    }
    
    func setViews() {
        self.view.addSubview(alarmLabelTextField)
    }
    
    func setLayouts() {
        alarmLabelTextField.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(300)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(50)
        }
    }
}

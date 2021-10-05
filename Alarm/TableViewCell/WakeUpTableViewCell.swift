//
//  WakeUpTableViewCell.swift
//  Alarm
//
//  Created by sapido on 2021/10/4.
//

import UIKit

class WakeUpTableViewCell: UITableViewCell {

    static let identifier = "wakeUpTableViewCell"
    
    // MARK: - IBOutLets
    let wakeUpLabel: UILabel = {
        let label = UILabel()
        // label的文字
        label.text = "沒有鬧鐘"
        // label的文字顏色
        label.textColor = .gray
        return label
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        // button的文字
        button.setTitle("設定", for: .normal)
        // button的文字顏色
        button.setTitleColor(.orange, for: .normal)
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 該cell的背景色為透明
        self.backgroundColor = .clear
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setViews
    func setViews() {
        self.addSubview(wakeUpLabel)
        self.addSubview(settingButton)
    }
    
    // MARK: - setLayouts
    func setLayouts() {
        wakeUpLabel.snp.makeConstraints { make in
            
            // top 跟 bottom 離cell的top 與 bottom 20個單位的原因是，要讓這個Cell看起來上跟下有空間
            make.top.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.leading.equalTo(self).offset(10)
        }
        
        settingButton.snp.makeConstraints { make in
            
            // button 的頂部與底部設置等同於 wakeUpLabel
            make.top.bottom.equalTo(self)
            make.trailing.equalTo(self).offset(-10)
        }
    }
}

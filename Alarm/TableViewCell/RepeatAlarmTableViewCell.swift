//
//  RepeatAlarmTableViewCell.swift
//  Alarm
//
//  Created by sapido on 2021/9/27.
//

import UIKit

class RepeatAlarmTableViewCell: UITableViewCell {

    // 設定 RepeatAlarmTableViewCell的識別碼
    static let identifier = "repeatAlarmTableViewcCell"
    
    // MARK: - IBOutLets
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.1333159506, green: 0.1333458424, blue: 0.1419014633, alpha: 1)
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setViews
    func setViews() {
        // 將titleLabel加進這個TableViewCell內
        self.addSubview(titleLabel)
    }
    
    // MARK: - setLayouts
    func setLayouts() {
        titleLabel.snp.makeConstraints { make in
            // titleLabel的頂部，底部，左邊都貼齊TableViewCell
            make.top.bottom.equalTo(self)
            // titleLabel的左邊貼齊TableViewCell的左邊間隔10
            make.leading.equalTo(self).offset(10)
        }
    }
}

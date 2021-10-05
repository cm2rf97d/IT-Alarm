//
//  AddAlarmButtonTableViewCell.swift
//  Alarm
//
//  Created by sapido on 2021/9/23.
//

import UIKit

class AddAlarmButtonTableViewCell: UITableViewCell {
    
    static let identifier = "addAlarmButtonTableViewCell"

    // MARK: - IBOutLets
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.1734634042, green: 0.1683282256, blue: 0.1771324873, alpha: 1)
        // 設定accessoryView 為 UISwitch
        self.accessoryView = UISwitch(frame: .zero)
        setViews()
        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setViews
    func setViews() {
        self.addSubview(titleLabel)
    }

    // MARK: - setLayouts
    func setLayouts() {
        titleLabel.snp.makeConstraints { make in
            // titleLabel 的頂部跟底部貼齊TableViewCell的頂部跟底部
            make.top.bottom.equalTo(self)
            // titleLabel 的左邊距離TableViewCell的左邊間隔10
            make.leading.equalTo(self).offset(10)
        }
    }
}

//
//  addAlarmTextTableViewCell.swift
//  Alarm
//
//  Created by 陳郁勳 on 2021/9/18.
//

import UIKit

class addAlarmContentTableViewCell: UITableViewCell {

    static let identifier = "addAlarmContentTableViewCell"

    // MARK: - IBOutLets
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    let detailImageView: UIImageView = {
        // 設定這個 imageView 的圖案為 "chevron.right"
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        // 設定這格 imageView 的顏色為灰色
        imageView.tintColor = .lightGray
        return imageView
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.1734634042, green: 0.1683282256, blue: 0.1771324873, alpha: 1)
        // 設定accessoryView 為 detailImageView(剛剛製作的View)
        self.accessoryView = detailImageView
        setViews()
        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setViews
    func setViews() {
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }

    // MARK: - setLayouts
    func setLayouts() {
        titleLabel.snp.makeConstraints { make in
            // titleLabel 的頂部跟底部貼齊TableViewCell的頂部跟底部
            make.top.bottom.equalTo(self)
            // titleLabel 的左邊距離TableViewCell的左邊間隔10
            make.leading.equalTo(self).offset(10)
        }

        contentLabel.snp.makeConstraints { make in
            // contentLabel 的頂部、底部、右邊都貼齊TableViewCell
            make.trailing.top.bottom.equalTo(self)
        }
    }
}

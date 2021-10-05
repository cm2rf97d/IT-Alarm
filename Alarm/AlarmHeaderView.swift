//
//  AlarmHeaderView.swift
//  Alarm
//
//  Created by sapido on 2021/10/2.
//

import UIKit

class AlarmHeaderView: UIView {
    // MARK: - Properties
    // MARK: - IBOutLets
    
    // 建立一個Label，用來顯示文字
    let headerViewLabel: UILabel = {
        let label = UILabel()
        // 該Label的字體顏色為白色
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 該View的背景色為黑色
        self.backgroundColor = .black
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Function
    // MARK: - setViews
    func setViews() {
        self.addSubview(headerViewLabel)
    }
    // MARK: - setLayouts
    func setLayouts() {
        headerViewLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.equalTo(self).offset(10)
        }
    }
}

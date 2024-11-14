//
//  NamozHeaderView.swift
//  Namoz vaqti
//
//  Created by user on 04/07/24.
//

import UIKit

class NamozHeaderView: UIView {

  lazy var descriptionLabel: UILabel = {
    $0.font = .systemFont(ofSize: 20, weight: .medium)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(descriptionLabel)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    descriptionLabel.frame = CGRect(x: 25,
                                    y: 0,
                                    width: self.frame.width-50,
                                    height: self.frame.height)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

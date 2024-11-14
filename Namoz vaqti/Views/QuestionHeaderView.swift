//
//  QuestionView.swift
//  Namoz vaqti
//
//  Created by user on 06/07/24.
//

import UIKit

class QuestionHeaderView: UIView {

  private lazy var segmentedControl: UISegmentedControl = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.selectedSegmentIndex = 0
    $0.selectedSegmentTintColor = .greenColor2
    $0.setTitle("Tahorat haqida", forSegmentAt: 0)
    $0.setTitle("Namoz haqida", forSegmentAt: 1)
    return $0
  }(UISegmentedControl())

  var segmentChanged: (() -> Void)?

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(segmentedControl)
    segmentedControl.addTarget(self, action: #selector(didTapSegmentedControl), for: .valueChanged)
  }

  @objc private func didTapSegmentedControl() {
    self.segmentChanged?()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    segmentedControl.frame = CGRect(x: 20,
                                    y: 10,
                                    width: self.frame.width-40,
                                    height: 45)
  }
}

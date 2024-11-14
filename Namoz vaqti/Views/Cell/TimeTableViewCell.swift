//
//  TimeTableViewCell.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

  static let reuseId = "TimeTableViewCell"

  private lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 22, weight: .medium)
    $0.textColor = .label
    return $0
  }(UILabel())

  private lazy var timeLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .medium)
    $0.textColor = .label
    return $0
  }(UILabel())

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setConstrains()
    selectionStyle = .none
    contentView.backgroundColor = .systemBackground
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension TimeTableViewCell {
  private func setConstrains() {
    let stack = UIStackView(arrangedSubviews: [titleLabel, timeLabel])
    stack.axis = .horizontal
    stack.spacing = 10
    stack.distribution = .equalSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stack)

    NSLayoutConstraint.activate([
      stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}

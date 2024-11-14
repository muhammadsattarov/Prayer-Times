//
//  TimeTableViewCell.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

  static let reuseId = "TimeTableViewCell"

  lazy var backgroundImage: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "green fon1")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  lazy var imageOfView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFit
    $0.tintColor = .systemYellow
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  private lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .regular)
    $0.textColor = .white
    return $0
  }(UILabel())

  private lazy var timeLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .regular)
    $0.textColor = .white
    $0.text = "-/-"
    return $0
  }(UILabel())

  private lazy var containerView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.layer.cornerRadius = self.frame.height/1.6
    $0.clipsToBounds = true
    return $0
  }(UIView())

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(containerView)
    containerView.addSubview(backgroundImage)
    contentView.addSubview(imageOfView)
    setConstrains()
    selectionStyle = .none
    contentView.backgroundColor = .clear
    self.backgroundColor = .clear
  }

  func configure(image: String, title: String, time: String) {
    imageOfView.image = UIImage(systemName: image)
    titleLabel.text = title
    timeLabel.text = time
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
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
      containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

      backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor),
      backgroundImage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

      imageOfView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
      imageOfView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      imageOfView.widthAnchor.constraint(equalToConstant: 28),
      imageOfView.heightAnchor.constraint(equalToConstant: 28),

      stack.leftAnchor.constraint(equalTo: imageOfView.rightAnchor, constant: 10),
      stack.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
      stack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
    ])
  }
}

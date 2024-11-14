//
//  ListViewTableViewCell.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {

  static let reuseId = "ListViewTableViewCell"

  private lazy var backgroundImage: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "green fon1")
    $0.contentMode = .scaleAspectFill
    return $0
  }(UIImageView())

  private lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 25, weight: .medium)
    $0.textColor = .white
    $0.textAlignment = .center
    return $0
  }(UILabel())

  private lazy var containerView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .greenColor2
    $0.layer.cornerRadius = self.frame.height/1.6
    $0.clipsToBounds = true
    return $0
  }(UIView())

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = .clear
    contentView.addSubview(containerView)
    containerView.addSubview(backgroundImage)
    containerView.addSubview(titleLabel)
    setCosntrains()
    selectionStyle = .none
  }

  func configure(with title: String) {
    titleLabel.text = title
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setCosntrains() {
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
      containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

      backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor),
      backgroundImage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

      titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
    ])
  }

}

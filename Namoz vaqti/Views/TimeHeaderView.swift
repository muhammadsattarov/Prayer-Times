//
//  TimeHeaderView.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit

protocol TimeHeaderViewDelegate: AnyObject {
  func refreshButtonTapped()
}

class TimeHeaderView: UIView {

  private lazy var imageOfView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "green fon1")
    $0.contentMode = .scaleAspectFill
    return $0
  }(UIImageView())

  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 45, weight: .medium)
    $0.textColor = .white
    $0.text = "- -"
    $0.textAlignment = .center
    return $0
  }(UILabel())

  let timeLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 45, weight: .light)
    $0.textColor = .white
    $0.text = "- -"
    $0.textAlignment = .center
    return $0
  }(UILabel())

  private let refreshButton: UIButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
    $0.tintColor = .white
    return $0
  }(UIButton(type: .system))

  let countryLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 16, weight: .light)
    $0.textColor = .white
    return $0
  }(UILabel())

  private lazy var vStack: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.spacing = 10
    $0.distribution = .fill
    return $0
  }(UIStackView(arrangedSubviews: [titleLabel, timeLabel]))

  weak var delegate: TimeHeaderViewDelegate?

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .greenColor2
    self.clipsToBounds = true
    setup()
    setConstrains()
  }
  
  private func setup() {
    addSubview(imageOfView)
    addSubview(vStack)
    addSubview(refreshButton)
    addSubview(countryLabel)
    refreshButton.addTarget(self, action: #selector(didTapRefresh), for: .touchUpInside)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = 40
    self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
  }

  @objc private func didTapRefresh() {
    delegate?.refreshButtonTapped()
    refreshButton.rotate360Degrees()
  }

  // MARK: - Constrains
  private func setConstrains() {
    NSLayoutConstraint.activate([
      imageOfView.topAnchor.constraint(equalTo: self.topAnchor),
      imageOfView.leftAnchor.constraint(equalTo: self.leftAnchor),
      imageOfView.rightAnchor.constraint(equalTo: self.rightAnchor),
      imageOfView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

      vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      vStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),

      refreshButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
      refreshButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      refreshButton.widthAnchor.constraint(equalToConstant: 25),
      refreshButton.heightAnchor.constraint(equalToConstant: 23),

      countryLabel.leftAnchor.constraint(equalTo: refreshButton.rightAnchor, constant: 10),
      countryLabel.bottomAnchor.constraint(equalTo: refreshButton.bottomAnchor),
      countryLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
    ])
  }
}


extension UIViewController {
  func timeString(time: TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format: "%02i:%02i%02i", hours, minutes, seconds)
  }
}

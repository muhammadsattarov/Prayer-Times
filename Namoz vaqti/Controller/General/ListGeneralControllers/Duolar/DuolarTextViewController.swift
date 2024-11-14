//
//  DuolarTextViewController.swift
//  Namoz vaqti
//
//  Created by user on 05/07/24.
//

import UIKit

class DuolarTextViewController: UIViewController {

  lazy var backgroundImage: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "whiteFon2")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  private let scrollView: UIScrollView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.alwaysBounceVertical = true
    return $0
  }(UIScrollView())

  private let containerView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIView())

  private lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 18, weight: .medium)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  var headerText: String?

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstrains()
  }

  private func setupViews() {
    view.addSubview(backgroundImage)
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
    containerView.addSubview(titleLabel)
    titleLabel.text = headerText
  }
}

// MARK: - Constrains
extension DuolarTextViewController {
  private func setConstrains() {
    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
      scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
      containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
      containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

      titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
      titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25),
      titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -25),
    ])
  }
}


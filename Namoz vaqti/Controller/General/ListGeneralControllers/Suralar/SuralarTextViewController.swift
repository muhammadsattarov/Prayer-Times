//
//  SuralarTextViewController.swift
//  Namoz vaqti
//
//  Created by user on 01/07/24.
//

import UIKit

class SuralarTextViewController: UIViewController {

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

  private lazy var translateLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 19, weight: .light)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  var headerText: String?
  var manosi: String?

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstrains()
  }

  private func setupViews() {
    view.backgroundColor = .systemBackground
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
    containerView.addSubview(titleLabel)
    containerView.addSubview(translateLabel)
    titleLabel.text = headerText
    translateLabel.text = manosi
  }
}

// MARK: - Constrains
extension SuralarTextViewController {
  private func setConstrains() {
    NSLayoutConstraint.activate([
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

      translateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
      translateLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
      translateLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
      translateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
    ])
  }
}

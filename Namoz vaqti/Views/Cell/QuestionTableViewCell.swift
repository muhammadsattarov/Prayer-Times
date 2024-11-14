//
//  QuestionTableViewCell.swift
//  Namoz vaqti
//
//  Created by user on 06/07/24.
//

import UIKit


class QuestionTableViewCell: UITableViewCell {

  static let reuseId = "QuestionTableViewCell"

  private lazy var questionLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .regular)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  private lazy var answerLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .semibold)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  private lazy var lineView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemGray5
    return $0
  }(UIView())

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(questionLabel)
    contentView.addSubview(answerLabel)
    contentView.addSubview(lineView)
    setConstrains()
    selectionStyle = .none
  }
  
  func configure(with question: String, answer: String) {
    questionLabel.text = question
    answerLabel.text = answer
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension QuestionTableViewCell {
  func setConstrains() {
    NSLayoutConstraint.activate([
      lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      lineView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      lineView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      lineView.heightAnchor.constraint(equalToConstant: 2),

      questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      questionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      questionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),

      answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
      answerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      answerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
      answerLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20),
    ])
  }
}

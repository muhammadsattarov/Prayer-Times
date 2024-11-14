

import UIKit

class TahoratTableViewCell: UITableViewCell {

  static let reuseId = "TahoratTableViewCell"

  private lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 30, weight: .bold)
    $0.textColor = .label
    return $0
  }(UILabel())

  private lazy var imageOfView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .systemGray6
    return $0
  }(UIImageView())

  private lazy var descriptionLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 20, weight: .regular)
    $0.textColor = .label
    $0.numberOfLines = 0
    return $0
  }(UILabel())

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
    setConstrains()
    selectionStyle = .none
  }

  func configure(title: String, image: String, description: String) {
    titleLabel.text = title
    imageOfView.image = UIImage.gif(name: image)
    descriptionLabel.text = description
  }

  private func setup() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(imageOfView)
    contentView.addSubview(descriptionLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    imageOfView.image = nil
    descriptionLabel.text = nil
  }
}

// MARK: - Constrains
extension TahoratTableViewCell {
  private func setConstrains() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
      titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
      titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),

      imageOfView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      imageOfView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
      imageOfView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
      imageOfView.heightAnchor.constraint(equalToConstant: 170),

      descriptionLabel.topAnchor.constraint(equalTo: imageOfView.bottomAnchor, constant: 10),
      descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
      descriptionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
    ])
  }
}


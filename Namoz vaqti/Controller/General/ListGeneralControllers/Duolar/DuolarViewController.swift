//
//  DuolarViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class DuolarViewController: UIViewController {

  lazy var backgroundImage: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "whiteFon2")
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  private let tableView: UITableView = {
    $0.register(ListViewTableViewCell.self,
                forCellReuseIdentifier: ListViewTableViewCell.reuseId)
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
    return $0
  }(UITableView())

private var duolar = ["Sa'no duosi",
                      "Salovat",
                      "Robbana duosi",
                      "Attahiyat",
                      "Qunut duosi",
                      "Vitr namozi"]

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstrains()
  }

  private func setupViews() {
    navigationItem.title = "Duolar"
    view.addSubview(backgroundImage)
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension DuolarViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return duolar.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.reuseId, for: indexPath) as! ListViewTableViewCell
    cell.configure(with: duolar[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DuolarTextViewController()
    let section = Duolar(rawValue: indexPath.row)
    switch section {
    case .sano:
      vc.headerText = Duolar.sano.description
    case .salovat:
      vc.headerText = Duolar.salovat.description
    case .robbana:
      vc.headerText = Duolar.robbana.description
    case .attahiyat:
      vc.headerText = Duolar.attahiyat.description
    case .qunut:
      vc.headerText = Duolar.qunut.description
    case .vitr:
      vc.headerText = Duolar.vitr.description
    case nil:
      break
    }
    vc.title = duolar[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}

private extension DuolarViewController {
  func setConstrains() {
    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

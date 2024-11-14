//
//  DuolarViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class DuolarViewController: UIViewController {

  private let tableView: UITableView = {
    $0.register(ListViewTableViewCell.self,
                forCellReuseIdentifier: ListViewTableViewCell.reuseId)
    $0.backgroundColor = .white
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
  }

  private func setupViews() {
    view.backgroundColor = .systemBackground
    navigationItem.title = "Duolar"
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
    let section = Duolar(rawValue: indexPath.row)
    switch section {
    case .sano:
      <#code#>
    case .salovat:
      <#code#>
    case .robbana:
      <#code#>
    case .attahiyat:
      <#code#>
    case .qunut:
      <#code#>
    case .vitr:
      <#code#>
    case nil:
      <#code#>
    }
  }
}

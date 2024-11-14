//
//  SuralarViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class SuralarViewController: UIViewController {

  private let tableView: UITableView = {
    $0.register(ListViewTableViewCell.self,
                forCellReuseIdentifier: ListViewTableViewCell.reuseId)
    $0.backgroundColor = .white
    $0.separatorStyle = .none
    return $0
  }(UITableView())

  private var suralar = ["Fotiha surasi",
                         "Ixlos surasi",
                         "An-nos surasi",
                         "Kavsar surasi",
                         "Falak’ surasi",]

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.backgroundColor = .systemBackground
    navigationItem.title = "Suralar"
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension SuralarViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return suralar.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.reuseId, for: indexPath) as! ListViewTableViewCell
    cell.configure(with: suralar[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = SuralarTextViewController()
    let section = Suralar(rawValue: indexPath.row)
    switch section {
    case .Fotiha:
      vc.headerText = Suralar.Fotiha.description
      vc.manosi = Suralar.Fotiha.manosi
    case .Ixlos:
      vc.headerText = Suralar.Ixlos.description
      vc.manosi = Suralar.Ixlos.manosi
    case .Annos:
      vc.headerText = Suralar.Annos.description
      vc.manosi = Suralar.Annos.manosi
    case .Kavsar:
      vc.headerText = Suralar.Kavsar.description
      vc.manosi = Suralar.Kavsar.manosi
    case .Falaq:
      vc.headerText = Suralar.Falaq.description
      vc.manosi = Suralar.Falaq.manosi
    case nil:
      break
    }
    vc.title = suralar[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}
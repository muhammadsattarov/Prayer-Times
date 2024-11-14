//
//  ListViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class ListViewController: UIViewController {

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

  var lists = ["Suralar", "Duolar", "Tahorat", "Savol va javoblar"]

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
  }

  private func setupViews() {
    view.addSubview(backgroundImage)
    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.title = "Islom"
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: view.frame.width,
                                                     height: 80))
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.reuseId, for: indexPath) as! ListViewTableViewCell
    cell.configure(with: lists[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = ListItem(rawValue: indexPath.row)
    switch section {
    case .suralar:
      let vc = SuralarViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .duolar:
      let vc = DuolarViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .tahorat:
      let vc = TahoratViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .savol_va_javoblar:
      let vc = QuestionsViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case nil:
      print("nil")
    }
  }

}


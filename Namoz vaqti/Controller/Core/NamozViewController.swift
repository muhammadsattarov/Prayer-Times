//
//  NamozViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class NamozViewController: UIViewController {

  lazy var backgroundImage: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(named: "whiteFon2")
    $0.contentMode = .scaleAspectFill
    return $0
  }(UIImageView())

  private let tableView: UITableView = {
    $0.register(ListViewTableViewCell.self,
                forCellReuseIdentifier: ListViewTableViewCell.reuseId)
    $0.separatorStyle = .none
    $0.backgroundColor = .clear
    return $0
  }(UITableView())

  var types = ["Bomdod", "Peshin", "Asr", "Shom", "Hufton"]

   // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.backgroundColor = .secondarySystemBackground
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
    navigationItem.title = "Namoz"
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
extension NamozViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return types.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ListViewTableViewCell.reuseId, for: indexPath) as! ListViewTableViewCell
    cell.configure(with: types[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = NamozItem(rawValue: indexPath.row)
    switch section {
    case .bomdod:
      let vc = BomdodViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .peshin:
      let vc = PeshinViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .asr:
      let vc = AsrViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .shom:
      let vc = ShomViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .hufton:
      let vc = HuftonViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case nil:
      print("Error: NamozViewController - didSelectRowAt")
    }
  }
}

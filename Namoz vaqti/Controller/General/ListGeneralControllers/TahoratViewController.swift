//
//  TahoratViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//


import UIKit

class TahoratViewController: UIViewController {

  private let tableView: UITableView = {
    $0.register(TahoratTableViewCell.self,
                forCellReuseIdentifier: TahoratTableViewCell.reuseId)
    $0.backgroundColor = .white
    $0.separatorStyle = .none
    return $0
  }(UITableView())

  var images = ["1","2","3","4","5","6","7","8","9"]


  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationItem.title = "Tahorat"
    setupViews()
  }

  private func setupViews() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TahoratViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TahoratTexts.titles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TahoratTableViewCell.reuseId, for: indexPath) as! TahoratTableViewCell
    cell.configure(title: TahoratTexts.titles[indexPath.row],
                   image: images[indexPath.row],
                   description: TahoratTexts.description[indexPath.row])
    return cell
  }


}


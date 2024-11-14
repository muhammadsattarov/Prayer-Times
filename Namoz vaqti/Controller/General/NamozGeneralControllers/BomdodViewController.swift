//
//  NamozTextViewController.swift
//  Namoz vaqti
//
//  Created by user on 28/06/24.
//

import UIKit

class NamozTextViewController: UIViewController {

  private let tableView: UITableView = {
    $0.register(NamozTextTableViewCell.self,
                forCellReuseIdentifier: NamozTextTableViewCell.reuseId)
    $0.backgroundColor = .white
    $0.separatorStyle = .none
    return $0
  }(UITableView())

  var timeTitle = ["1.Niyat qilish", "2.Takbiri tahrima", "3.Qiyom ","4.Ruku ","5.Qiyom", "6.Sajda",  "7.Sajda ","8.Jalsa" ,"9.Sajda ","10.Qiyom"," 11.Ikkinchi raka’at", "12.Qa’da", "13.Salom"]

  var image = ["1b","2b","3b","4b","5b","6b","7b","8b","9b","10b","11b","12b","13b"]

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.title = "Bomdod namozi"
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension NamozTextViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return timeTitle.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NamozTextTableViewCell.reuseId, for: indexPath) as! NamozTextTableViewCell
    cell.configure(title: timeTitle[indexPath.row],
                   image: image[indexPath.row],
                   description: Texts.bomdodTekst[indexPath.row])
    return cell
  }


}


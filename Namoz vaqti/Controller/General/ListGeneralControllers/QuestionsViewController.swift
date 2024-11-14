//
//  QuestionsViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit

class QuestionsViewController: UIViewController {

  private let tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(QuestionTableViewCell.self,
                forCellReuseIdentifier: QuestionTableViewCell.reuseId)
    $0.backgroundColor = .white
    $0.separatorStyle = .none
    return $0
  }(UITableView())

  private lazy var segmentedControl: UISegmentedControl = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.selectedSegmentIndex = 0
    $0.selectedSegmentTintColor = .greenColor2
    let font = UIFont.systemFont(ofSize: 18)
    $0.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    return $0
  }(UISegmentedControl(items: ["Tahorat haqida", "Namoz haqida"]))


// MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstrains()
  }

  private func setupViews() {
    view.backgroundColor = .systemBackground
    navigationItem.title = "Savol va javoblar"
    view.addSubview(segmentedControl)
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    segmentedControl.addTarget(self, action: #selector(didTapSegmentedControl), for: .valueChanged)
  }

  @objc private func didTapSegmentedControl() {
    self.tableView.reloadData()
  }
}

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      return Questions.tahoratHaqida.count
    case 1:
      return Questions.namozHaqida.count
    default:
      break
    }
    return Questions.tahoratHaqida.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.reuseId, for: indexPath) as! QuestionTableViewCell
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      cell.configure(with: Questions.tahoratHaqida[indexPath.row],
                     answer: Questions.tahoratHaqidaJavob[indexPath.row])
    case 1:
      cell.configure(with: Questions.namozHaqida[indexPath.row],
                     answer: Questions.namozHaqidaJavob[indexPath.row])
    default:
      break
    }
    return cell
  }
}

extension QuestionsViewController {
  private func setConstrains() {
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
      segmentedControl.heightAnchor.constraint(equalToConstant: 45),

      tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

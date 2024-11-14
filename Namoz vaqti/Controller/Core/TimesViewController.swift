//
//  TimesViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit
import Adhan

class TimesViewController: UIViewController {

  private let tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(TimeTableViewCell.self,
                forCellReuseIdentifier: TimeTableViewCell.reuseId)
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
    $0.bounces = false
    return $0
  }(UITableView())

  private var viewModel = TimesViewModel()

  private lazy var indicator: UIActivityIndicatorView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.hidesWhenStopped = true
    $0.style = .medium
    $0.tintColor = .white
    return $0
  }(UIActivityIndicatorView())

  let headerView = TimeHeaderView()

  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  // MARK: - Setup Views
  private func setupViews() {
    addSubViews()
    settings()
    fetchData()
    setConstrains()
  }
}

// MARK: - View settings
private extension TimesViewController {
  func addSubViews() {
    view.addSubview(tableView)
    view.addSubview(headerView)
    view.addSubview(indicator)
    headerView.translatesAutoresizingMaskIntoConstraints = false
  }

  func settings() {
    view.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    headerView.delegate = self
  }
}

// MARK: - Fetch Data
private extension TimesViewController {
  func fetchData() {
    indicator.startAnimating()
    viewModel.showPrayerTimes { [weak self] name, time, countryName  in
      self?.indicator.stopAnimating()
      self?.headerView.titleLabel.text = name
      self?.headerView.timeLabel.text = time
      self?.headerView.countryLabel.text = countryName
      self?.tableView.reloadData()
    }

  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TimesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return NamozTimes.allCases.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TimeTableViewCell.reuseId, for: indexPath) as! TimeTableViewCell
    let section = NamozTimes(rawValue: indexPath.row)

    switch section {
    case .tong:
      cell.configure(image: "sun.haze.fill", title: "Tong", time: viewModel.fajr ?? "A'loqa mavjud emas!")
    case .quyosh:
      cell.configure(image: "sunrise.fill", title: "Quyosh", time: viewModel.sunrise ?? "")
    case .peshin:
      cell.configure(image: "sun.max.fill", title: "Peshin", time: viewModel.dhuhr ?? "")
    case .asr:
      cell.configure(image: "sun.max.fill", title: "Asr", time: viewModel.asr ?? "")
    case .shom:
      cell.configure(image: "sunset.fill", title: "Shom", time: viewModel.maghrib ?? "")
    case .hufton:
      cell.configure(image: "moon.stars.fill", title: "Hufton", time: viewModel.isha ?? "")
    case .none:
     print("Something are wrong!")
    }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if view.frame.height > 800 {
      return view.frame.height/12.1
    }
    return view.frame.height/10.5
  }

}

// MARK: - Constrains
extension TimesViewController {
  private func setConstrains() {
    let topSpace: CGFloat = (view.frame.height/2.7) / 2
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
      headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
      headerView.heightAnchor.constraint(equalToConstant: view.frame.height/2.9),

      indicator.topAnchor.constraint(equalTo: headerView.topAnchor, constant: topSpace),
      indicator.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),

      tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 7),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TimesViewController: TimeHeaderViewDelegate {
  func refreshButtonTapped() {
    print("refresh")
  }
}

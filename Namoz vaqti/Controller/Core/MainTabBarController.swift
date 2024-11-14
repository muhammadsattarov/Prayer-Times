//
//  ViewController.swift
//  Namoz vaqti
//
//  Created by user on 25/06/24.
//

import UIKit
import Adhan

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    tabBar.backgroundColor = .secondarySystemBackground
    let timesVC = TimesViewController()
    let namozVC = UINavigationController(rootViewController: NamozViewController())
    let listVC = UINavigationController(rootViewController: ListViewController())

    timesVC.tabBarItem.image = UIImage(systemName: "clock")
    namozVC.tabBarItem.image = UIImage(named: "star")
    listVC.tabBarItem.image = UIImage(systemName: "line.3.horizontal.decrease")
    tabBar.tintColor = .label
    setViewControllers([timesVC, namozVC, listVC], animated: true)
  }


}


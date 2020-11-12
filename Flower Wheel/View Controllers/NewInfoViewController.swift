//
//  NewInfoViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 11.11.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class NewInfoViewController: UIViewController {
    
    @IBOutlet weak var infoTable: UITableView!
    
    let names = ["Инструкция", "Гид сочетаний", "Тепло-холод", "Оттенки", "Светлота", "Схемы цветового колеса", "Фон для букета", "Цветочная витрина", "Видео уроки", "Наш инстаграм"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.delegate = self
        infoTable.dataSource = self
        infoTable.tableFooterView = UIView(frame: .zero)
    }
}

extension NewInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "infoCell")
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if #available(iOS 13.0, *) {
            let vc = self.storyboard?.instantiateViewController(identifier: "InfoTappedViewController") as! InfoTappedViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
}

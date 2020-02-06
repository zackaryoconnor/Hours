//
//  HomeController.swift
//  Hours
//
//  Created by Zackary O'Connor on 2/5/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
    
    fileprivate func setupTableView() {
        tableView.register(HomeCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 75
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
    }
    
    
    fileprivate func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddNewHours))
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Hours"
    }
    
    
    @objc fileprivate func handleAddNewHours() {
        let vc = AddNewHoursController()
        present(vc, animated: true)
    }
    
}




extension HomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! HomeCell
        return cell
    }
}







class HomeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}










//
//  ShoppingListController.swift
//  ShoppingItems
//
//  Created by Bharatraj Rai on 4/15/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ShoppingListController: UIViewController, CreateShoppingItemControllerDelegate {
    
    let tableView = UITableView()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Alpha", "Creation Time"])
        sc.selectedSegmentIndex = 0
        sc.layer.cornerRadius = 5.0
        sc.backgroundColor = .gray
        sc.addTarget(self, action: #selector(handleSegmentSelection), for: .valueChanged)
        return sc
    }()
    
    var garments: [Garment] = []
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(handleAddShoppingItem))
        navigationItem.title = "Garment List"
        navigationController?.setupNavigationalController()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        setupUI()
        fetchGarmentsFromCoreData()
    }
    
    @objc func handleSegmentSelection() {
        fetchGarmentsFromCoreData()
    }
    
    func fetchGarmentsFromCoreData() {
        if segmentedControl.selectedSegmentIndex == 0 {
            garments = CoreDataManager.shared.fetchGarments(sortBy: "itemName")
        } else {
            garments = CoreDataManager.shared.fetchGarments(sortBy: "addedDate")
        }
        tableView.reloadData()
    }
    
    func setupUI() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: guide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 40)
        segmentedControl.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        view.addSubview(tableView)
        tableView.anchor(top: segmentedControl.bottomAnchor, left: guide.leftAnchor, bottom: guide.bottomAnchor, right: guide.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc func handleAddShoppingItem() {
        let createShoppingItemController = CreateShoppingItemController()
        createShoppingItemController.delegate = self
        let navController = UINavigationController(rootViewController: createShoppingItemController)
        present(navController, animated: true, completion: nil)
    }
    
     func didAddGarment() {
        fetchGarmentsFromCoreData()
    }
    
}

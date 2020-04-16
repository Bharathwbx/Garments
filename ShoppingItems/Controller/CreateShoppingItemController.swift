//
//  CreateShoppingItemController.swift
//  ShoppingItems
//
//  Created by Bharatraj Rai on 4/15/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol CreateShoppingItemControllerDelegate: class {
    func didAddGarment()
}

class CreateShoppingItemController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Garment Name:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    
    weak var delegate: CreateShoppingItemControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setupNavigationalController()
        navigationItem.title = "Add Garment"
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCanel))
        setupUI()
    }
    
    func setupUI() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: guide.topAnchor, left: guide.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        
        view.addSubview(nameTextField)
        nameTextField.anchor(top: nameLabel.bottomAnchor, left: guide.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 250, height: 40)
        
    }
    
    @objc func handleSave() {
        guard let garmentName = nameTextField.text else { return }
        if garmentName.count == 0 {
            let alertController = UIAlertController(title: Message.noGarmentTitle, message: Message.noGarmentDesc, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        saveGarmentItem()
    }
    
    func saveGarmentItem() {
        let context = CoreDataManager.shared.persistenceContainer.viewContext
        let garment = NSEntityDescription.insertNewObject(forEntityName: "Garment", into: context)
        garment.setValue(nameTextField.text, forKey: "itemName")
        garment.setValue(Date(), forKey: "addedDate")
        do {
            try context.save()
            dismiss(animated: true) {
                self.delegate?.didAddGarment()
            }
        } catch let saveErr {
            print("Failed to save garment..", saveErr)
        }
    }
    
    @objc func handleCanel() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit - CreateShoppingItemController")
    }
}

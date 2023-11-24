//
//  DetailViewController.swift
//  reminderToWords
//
//  Created by Ahmet Göktürk Kurt on 27.10.2023.
//

import UIKit

protocol SendTextFieldDelegate : AnyObject{
    func sendTextField(_ frontName :[String],_ backName :[String],_ cardDescription : [String])
}

class DetailViewController: UIViewController {
    
    private var frontName : [String] = [""]
    private var backName : [String] = [""]
    private var cardDescription : [String] = [""]
    public var homePageVc = HomePageCollectionViewController()
    private var tableView = UITableView()
    
    private let identifier = "detailCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        configureTableView()
        setupCell()
        setTableViewDelegate()
    }
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.backgroundColor = .white
        configureNavigationController()
    }
    
    private func setupCell() {
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didTapDoneButton))
    }
    
    @objc private func didTapDoneButton() {
        configureFirebaseData()
    }
    
    private func configureFirebaseData() {
        let cardNameModel  = CardNameModel(frontName: frontName, backName: backName, cardDescription: cardDescription)
        AuthService.shared.addCardNameDataToFirebase(cardNameModel) { [weak self] error in
            guard let self = self else {return}
            if let error = error {
                print("wrong data \(error.localizedDescription)")
            }else {
                print("successfuly saved data")
                self.sendTextField(self.frontName, self.backName, self.cardDescription)
            }
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let vc = CardViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension DetailViewController : UITableViewDelegate , UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frontName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DetailTableViewCell else {
            fatalError("wrong identifier ")
        }
        cell.configureCell(delegate: self, frontText: frontName[indexPath.row], tag: indexPath.row, backText: backName[indexPath.row], descriptionText: cardDescription[indexPath.row])
        
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DetailTableViewCell else {
            fatalError("wrong identifier")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let tag = textField.tag
        
        if tag >= frontName.count {
            while tag >= frontName.count {
                frontName.append("")
            }
        }
        
        if tag >= backName.count {
            while tag >= backName.count {
                backName.append("")
            }
        }
        
        if tag >= cardDescription.count {
            while tag >= cardDescription.count {
                cardDescription.append("")
            }
        }
        
        frontName[tag] = text
        backName[tag] = text
        cardDescription[tag] = text
        
        return true
    }
}

extension DetailViewController : SendTextFieldDelegate {
    
    func sendTextField(_ frontName: [String], _ backName: [String], _ cardDescription: [String]) {
        let vc = CardViewController()
        vc.frontName = frontName
        vc.backName = backName
        vc.cardDescription = cardDescription
    }
}

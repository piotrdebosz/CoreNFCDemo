//
//  ViewController.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 07/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import UIKit
import CoreNFC
import SnapKit

class MainViewController: UIViewController {
    private var manager: NFCManager?
    private let tableView: UITableView = UITableView()
    
    private var messages: [NFCNDEFMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigationBar()
        self.setUpUI()
        
        self.manager = NFCManager(didDetectTag: { [unowned self] (message) in
            self.addNewMessage(message: message)
            }, didInvalidateWithError: { (error) in
                print("Error: \(error)")
        })
    }
    
    private func addNewMessage(message: NFCNDEFMessage) {
        self.messages.append(message)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setUpNavigationBar() {
        self.title = "Tags"
        
        let refreshButton = UIBarButtonItem(image: #imageLiteral(resourceName: "refresh"), style: .plain, target: self, action: #selector(refresh))
        let cleanButton = UIBarButtonItem(image: #imageLiteral(resourceName: "broom"), style: .plain, target: self, action: #selector(clean))
        
        self.navigationItem.leftBarButtonItem = cleanButton
        self.navigationItem.rightBarButtonItem = refreshButton
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func refresh() {
        self.manager?.startLookingForTag()
    }
    
    private func setUpUI() {
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.tableView.register(RecordTableViewCell.self, forCellReuseIdentifier: "RecordCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension MainViewController {
    @objc private func clean() {
        self.messages.removeAll()
        self.tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages[section].records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordTableViewCell else {
            fatalError("Cannot dequeue record cell!")
        }
        
        let record = self.messages[indexPath.section].records[indexPath.row]
        
        cell.configure(identifier: record.identifierString(), type: record.typeString())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView(section: section)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = DetailViewController(record: self.messages[indexPath.section].records[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

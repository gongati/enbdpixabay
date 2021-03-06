//
//  PBHitsListViewController.swift
//  ENBDPixabay
//
//  Created by Vishnu Vardhan Reddy G on 29/04/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit

class PBHitsListViewController: UIViewController {
    
    var viewModel = PBHitsListViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        self.title = "Pixabay"
        
        self.setupViewModel()
        self.viewModel.fetchNextSetofHits()
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - View setup
    private func setupViewModel() {
        
        self.viewModel.onShouldOpenHitDetails = { [weak self] hit in
            
            //open details viewcontroller with the hit
            let detailsViewModel = PBHitDetailsViewModel(hit: hit)
            let vc = PBHitDetailsViewController(viewModel: detailsViewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        self.viewModel.onShouldRefreshItems = { [weak self] in
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }

        self.viewModel.onShouldStartLoadingItems = { [weak self] isNewQuery in
            
            DispatchQueue.main.async {
                
                if isNewQuery {
                    
                    self?.tableView.reloadData()
                }
                self?.tableView.reloadSections(IndexSet(integer: 1), with: .none)
            }
        }
        
        self.viewModel.onShouldShowError = { [weak self] error in
            
            self?.popupAlert(title: "Error", message: error, actionTitles: ["OK"], actions: [nil])
        }
    }
}

// MARK: - UITableViewDelegte
extension PBHitsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return self.viewModel.hitsList.count
        }else if section == 1 && self.viewModel.fetchingMore {
            
            return 1
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! PBHitListViewCell
            
            if self.viewModel.hitsList.count > indexPath.row {
                
                cell.update(hit: self.viewModel.hitsList[indexPath.row])
            }

            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! PBLoadingCell
            
            cell.loadingIndicator.startAnimating()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.viewModel.hitsList.count > indexPath.row {
            
            let hit = self.viewModel.hitsList[indexPath.row]
            self.viewModel.performActionWith(hit: hit)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 100
        } else {
            
            return 50
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            
            if !self.viewModel.fetchingMore {
                
                self.viewModel.fetchNextSetofHits()
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension PBHitsListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBar.endEditing(true)
        self.viewModel.fetchNewSet(query: searchBar.text ?? "")
    }
}

// MARK: - UIViewController
extension UIViewController {
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - KeyBoard
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        
        self.view.endEditing(true)
    }
}

//
//  ViewController.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import UIKit

class CustomerSearchViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private let interactor = CustomerSearchInteractor()
    private let searchController = UISearchController(searchResultsController: nil)
    private var dublin = Coordinate(latitude: 53.339428, longitude: -6.257664)
    private var customers: [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.text = "100"
        searchController.searchBar.keyboardType = .numberPad
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension CustomerSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath)
        let customer = customers[indexPath.row]
        cell.textLabel?.text = customer.name
        cell.detailTextLabel?.text = "\(customer.location.distance(to: dublin).rounded(toDecimalPlace: 2)) Km"
        cell.detailTextLabel?.textColor = UIColor.gray
        return cell
    }
}

// MARK: - UISearchResultsUpdating
extension CustomerSearchViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        var distance = Double.greatestFiniteMagnitude
        if let searchText = searchController.searchBar.text, !searchText.isEmpty,
            let dist = Double(searchText) {
            distance = dist
        }
        customers = interactor.nearbyCustomers(currentLocation: dublin, distance: distance)
        tableView.reloadData()
    }
}



//
//  ViewController.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import UIKit

protocol LatestListViewControllerType: class {
    var presenter: LatestListPresenterType! { get }
    
    func onRecievedData(items: [Item]?)
    func showAlert(_ message: String)
}

class LatestListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: LatestListPresenterType!
    private var items: [Item] = []
    
    internal static func instantiate(withPresenter presenter: LatestListPresenterType) -> LatestListViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LatestListViewController") as! LatestListViewController
        vc.presenter = presenter
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.onViewDidLoad(withView: self)
        self.tableView.isHidden = true
        
        let barButtonCart = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.onCartTapped))
        barButtonCart.tintColor = UIColor.init(named: "Tasman500")
        let barButtonSearch = UIBarButtonItem(image: UIImage(named: "search"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.onSearchTapped))
        barButtonSearch.tintColor = UIColor.init(named: "Tasman500")
        
        self.navigationItem.rightBarButtonItems = [barButtonCart, barButtonSearch]
    }
    
    @objc func onSearchTapped(){
        self.presenter.showSearch()
    }
    
    @objc func onCartTapped(){
        self.presenter.showCart()
    }
    
}

extension LatestListViewController: LatestListViewControllerType {
    func showAlert(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func onRecievedData(items: [Item]?) {
        DispatchQueue.main.async {
            self.items = items ?? []
            self.tableView.isHidden = self.items.count == 0
            self.tableView.reloadData()
        }
    }
}

extension LatestListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listItemCell = tableView.dequeueReusableCell(withIdentifier: "LatestListItemCell", for: indexPath) as! ItemCell
        let interactor = ItemInteractor(networkManager: NetworkManager())
        let presenter = ItemPresenter(interactor: interactor)
        interactor.interactorDelegate = presenter
        listItemCell.presenter = presenter
        listItemCell.item = ListItem(self.items[indexPath.row])
        return listItemCell
    }

}


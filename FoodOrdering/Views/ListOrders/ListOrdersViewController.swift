//
//  ListOrdersViewController.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import UIKit
import JGProgressHUD

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders : [Order] = []
    var hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
        
        hud.show(in: self.view)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        NetworkService.shared.fetchOrders { [weak self] result in
            switch result {
                
            case .success(let orders):
                self?.hud.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                self?.hud.textLabel.text = "\(error.localizedDescription)"
                self?.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self?.hud.show(in: (self?.view)!)
                self?.hud.dismiss()
            }
        }
    }
    private func registerCells() {
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}
extension ListOrdersViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
    }
}

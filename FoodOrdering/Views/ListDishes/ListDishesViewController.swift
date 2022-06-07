//
//  ListDishesViewController.swift
//  FoodOrdering
//
//  Created by naruto kurama on 2.06.2022.
//

import UIKit
import JGProgressHUD

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dishes : [Dish] = []
    var category : DishCategory!
    
    var hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCell()
        
        hud.show(in: self.view)
        
        NetworkService.shared.fetchCategoryDishes(categoryID: category.id ?? "") { [weak self] result in
            switch result {
                
            case .success(let dishes):
                self?.hud.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                self?.hud.textLabel.text = "\(error.localizedDescription)"
                self?.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self?.hud.show(in: (self?.view)!)
                self?.hud.dismiss(afterDelay: 1)
            }
        }

    }
    private func registerCell() {
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}
extension ListDishesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

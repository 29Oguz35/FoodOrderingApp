//
//  DishDetailViewController.swift
//  FoodOrdering
//
//  Created by naruto kurama on 1.06.2022.
//

import UIKit
import JGProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriprionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    var hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       populateView()
    }
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriprionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
  
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
                      !name.isEmpty else {
            
            hud.textLabel.text = "Please enter your name"
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2)
            return
        }
        hud.textLabel.text = "Place Order..."
        hud.show(in: self.view)
        NetworkService.shared.placeOrder(dishID: dish.id ?? "", name: name ) { [weak self] result in
            switch result {
            case .success(_):
                self?.hud.textLabel.text = "Your order has been received 🧑🏼‍🍳"
                self?.hud.show(in: (self?.view)!)
                self?.hud.dismiss(afterDelay: 3)
            case .failure(let error):
                self?.hud.textLabel.text = "\(error.localizedDescription)"
                self?.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self?.hud.show(in: (self?.view)!)
                self?.hud.dismiss()
            }
        }
    }
    
}

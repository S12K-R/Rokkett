//
//  ShoppingCartViewController.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 19/10/2022.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    var shoppingCart: ShoppingCart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.title = "Go Back"
        navigationController?.navigationBar.topItem?.title = "Shopping Cart"
        
        shoppingCartTableView.delegate = self
        shoppingCartTableView.dataSource = self
        
        let cellNib = UINib(nibName: String(describing: ShoppingCartTableViewCell.self), bundle: nil)
        shoppingCartTableView.register(cellNib, forCellReuseIdentifier: "ShoppingCartTableViewCell")
        
    }
    
    func deleteRow(at indexPath: IndexPath) {
        //Elimina el producto del array perteneciente al carrito de compras
        self.shoppingCart.delete(at: indexPath.row)
        shoppingCartTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell") as? ShoppingCartTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.setData(shoppingCart.cartProducts[indexPath.row])
        
        return cell
    }
}

extension ShoppingCartViewController: ShoppingCartTableViewCellDelegate {
    
    func deleteTapped(cell: ShoppingCartTableViewCell) {
        if let indexPath = shoppingCartTableView.indexPath(for: cell) {
            deleteRow(at: indexPath)
        }
        
    }
    
}

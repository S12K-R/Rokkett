//
//  ProductViewController.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 12/10/2022.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var cartButton: UIButton!
    
    var products: [Product] = []
    let shoppingCart = ShoppingCart()
    
    let names: [String] = ["Burger", "Fries", "Hot Dog", "Pizza", "Stir Fry", "Sandwich"]
    let price: [Double] = [5.0, 2.5, 2.0, 10.0, 5.0, 6.0]
    let stock: [Int] = [10,60,20,10,15,20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Product"
        
        productTableView.delegate = self
        productTableView.dataSource = self
        shoppingCart.delegate = self
        
        cartButton.setTitle("Cart: \(shoppingCart.count)", for: .normal)
        
        //Returns a UINib object initialized to the nib file in the specified bundle.
        let cellNib = UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil)
        productTableView.register(cellNib, forCellReuseIdentifier: "ProductTableViewCell")
        
        for num in 0..<6 {
            products.append(Product(id: UUID(), name: names[num], price: price[num], stock: stock[num]))
        }
        
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ShoppingCart") as? ShoppingCartViewController else { return }
        vc.shoppingCart = shoppingCart
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.setData(products[indexPath.row])
        return cell
    }
    
}


extension ProductViewController: Buyable {
    
    func discard(cartProduct: CartProduct) {
        // si no hay de este elemento en el arreglo lo inserta, es decir imagina que llegaste a 0 burgers, recien ahi lo inserta
        if !products.contains(cartProduct.product) {
            products.append(cartProduct.product)
        }
        
        cartButton.setTitle("Cart: \(shoppingCart.count) / Cost: \(shoppingCart.total)", for: .normal)
        productTableView.reloadData()
    }
    
    func buy(product: Product) {
        // Compra
        guard let productIndex = products.firstIndex(where: { $0.id == product.id }),
              shoppingCart.addProduct(product: product) else {
            return
        }
        
        let indexPaths = [IndexPath(row: productIndex, section: 0)]
        // Elimina el producto de la lista si su stock llega a 0, luego actualiza los labels de la lista
        if product.stock ==  0 {
            products.remove(at: productIndex)
            productTableView.deleteRows(at: indexPaths,
                                        with: .fade)
        } else {
            productTableView.reloadRows(at: indexPaths,
                                        with: .automatic)
        }
        
        cartButton.setTitle("Cart: \(shoppingCart.count) / Cost: \(shoppingCart.total)", for: .normal)
    }
    
}

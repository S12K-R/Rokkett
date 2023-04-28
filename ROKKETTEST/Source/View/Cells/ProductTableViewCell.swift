//
//  ProductTableViewCell.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 13/10/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    weak var delegate: Buyable?
    var product: Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ product: Product) {
        self.product = product
        nameLabel.text = product.name
        priceLabel.text = "Price: \(product.price)"
        stockLabel.text = "Stock: \(product.stock)"
    }
   
    @IBAction func buyButtonTapped(_ sender: Any) {
        delegate?.buy(product: product)
    }
  
}


// Procolos - Contratos

// Contrato de Alquiler
// protocol RentDelegate {
// func cobrarAlquiler()
// }

// Controlador - El locatario - (el que lo usa es el que indica delegate = self )
// Celda - Arrendador  - (el que crea es el que tiene la variable weak var delegate: DeleagteAlgo)

//
//  ShoppingCartTableViewCell.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 19/10/2022.
//

import UIKit


class ShoppingCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: ShoppingCartTableViewCellDelegate?
    var cartProduct: CartProduct!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ cartProduct: CartProduct) {
        
        nameLabel.text = "YUH"
        totalPriceLabel.text = "Total Price: \(cartProduct.total)"
        amountLabel.text = "Amount: \(cartProduct.count)"
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteTapped(cell: self)
    }

}


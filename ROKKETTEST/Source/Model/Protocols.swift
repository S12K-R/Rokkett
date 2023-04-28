//
//  Buyable.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 29/10/2022.
//

import Foundation

protocol Buyable: AnyObject {
    // Buying/Discarding items protocol
    func buy (product: Product)
    func discard(cartProduct: CartProduct)
}

protocol ShoppingCartTableViewCellDelegate: AnyObject {
    func deleteTapped(cell: ShoppingCartTableViewCell)
}

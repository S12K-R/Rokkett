//
//  ShoppingCart.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 26/10/2022.
//

import Foundation


class ShoppingCart: CustomStringConvertible {
    

    private (set) var cartProducts = [CartProduct]()
    var delegate: Buyable?
    
    var description: String {
        return """
            total: \(total)
            products: \(cartProducts)
            cantidad: \(count)
            """
    }
    
    // computed properties
    
    var total: Double {
        var accum: Double = 0
        cartProducts.forEach { cartProduct in
            accum += cartProduct.total
        }
        return accum
    }
    
    var count: Int {
        var accum = 0
        cartProducts.forEach { cartProduct in
            accum += cartProduct.count
        }
        return accum
    }
    
    func addProduct( product: Product, count: Int  = 1) -> Bool {
        // Adds the product to the shoppingCart array, then reduces stock based on the number of desired products
        guard product.decreaseStock(count) else { return false }
        
        if let currentCartProduct = cartProducts.first(where: {
            $0.product == product
        }) {
            currentCartProduct.count += count
        } else {
            let newCartProduct = CartProduct(product: product, count: count)
            cartProducts.append(newCartProduct)
        }
        return true
    }
    func delete (at index: Int) {
        //Removes the product from the shoppingCart array, then stock gets updated
        let cartProduct = cartProducts.remove(at: index)
        cartProduct.product.increaseStock(cartProduct.count)
        delegate?.discard(cartProduct: cartProduct)
        
    }
    
}

//
//  CartProduct.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 26/10/2022.
//

import Foundation

class CartProduct: CustomStringConvertible {
    
    var product: Product
    var count: Int
    
    var total: Double {
        return product.price * Double(count)
    }
    
    var description: String {
        return """
                product: \(product)
                count: \(count)
                total: \(total)
            """
    }
    
    init(product: Product, count: Int) {
        self.product = product
        self.count = count
    }
    
}

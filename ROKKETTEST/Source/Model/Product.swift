//
//  Product.swift
//  ROKKETTEST
//
//  Created by Jorge Vasquez on 13/10/2022.
//

import Foundation

class Product: CustomStringConvertible {
    
    let id: UUID
    var name: String = ""
    var price: Double
    var stock: Int = 0

    init(id: UUID, name: String, price: Double, stock: Int) {
        
        self.id = id
        self.name = name
        self.price = price
        self.stock = stock
    }
    
    var description: String {
        return """
            name: \(name)
            price: \(price)
            stock: \(stock)
            """
    }
    
    func decreaseStock(_ count: Int = 1) -> Bool {
        guard stock >= count else {
            return false
        }
        stock -= count
        return true
    }
    
    func increaseStock(_ count: Int) {
        stock += count
    }
}

extension Product: Equatable {

    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }

}


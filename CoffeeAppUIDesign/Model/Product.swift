//
//  Product.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 03/02/2023.
//

import Foundation

struct ProductPrice {
    var small: String
    var medium: String
    var large: String
}

struct Product: Identifiable {
    let id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var price: ProductPrice
    var rating: String
    var image: String
}

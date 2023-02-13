//
//  HomeViewModel.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 03/02/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var products = DataService.instance.data
    @Published var limitedTimeOffer = DataService.instance.limitedTimeOffer
    @Published var selectedProduct: Product?
}

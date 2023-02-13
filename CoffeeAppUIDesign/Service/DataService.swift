//
//  DataService.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 03/02/2023.
//

import Foundation

class DataService {
    static let instance = DataService()
    private init() {}
    
    let data: [Product] = [
        Product(
            title: "Black",
            subTitle: "No Milk",
            description: "Black coffee is as simple as it gets with ground coffee beans steeped in hot water, served warm. And if you want to sound fancy, you can call black coffee by its proper name: cafe noir.",
            price: ProductPrice(small: "$2.0", medium: "$3.0", large: "$4.5"),
            rating: "4.7",
            image: "blackCoffee"
        ),
        Product(
            title: "Latte",
            subTitle: "Espresso & Streamed Milk",
            description: "As the most popular coffee drink out there, the latte is comprised of a shot of espresso and steamed milk with just a touch of foam. It can be ordered plain or with a flavor shot of anything from vanilla to pumpkin spice.",
            price: ProductPrice(small: "$4.0", medium: "$5.0", large: "$6.0"),
            rating: "4.9",
            image: "latteCoffee"
        ),
        Product(
            title: "Cappuccino",
            subTitle: "Cinnamon on top",
            description: "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top. Sometimes you can find variations that use cream instead of milk or ones that throw in flavor shot, as well.",
            price: ProductPrice(small: "$4.65", medium: "$6.0", large: "$7.0"),
            rating: "4.8",
            image: "cappuccinoCoffee"
        ),
        Product(
            title: "Americano",
            subTitle: "Espresso shot",
            description: "With a similar flavor to black coffee, the americano consists of an espresso shot diluted in hot water. Pro tip: if you’re making your own, pour the espresso first, then add the hot water.",
            price: ProductPrice(small: "$2.5", medium: "$3.0", large: "$3.25"),
            rating: "4.8",
            image: "americanoCoffee"
        ),
        Product(
            title: "Espresso",
            subTitle: "Served solo shot",
            description: "An espresso shot can be served solo or used as the foundation of most coffee drinks, like lattes and macchiatos.",
            price: ProductPrice(small: "$2.0", medium: "$3.0", large: "$4.0"),
            rating: "4.5",
            image: "espressoCoffee"
        )
    ]
    
    let limitedTimeOffer = Product(
        title: "Americano",
        subTitle: "Espresso shot",
        description: "With a similar flavor to black coffee, the americano consists of an espresso shot diluted in hot water. Pro tip: if you’re making your own, pour the espresso first, then add the hot water.",
        price: ProductPrice(small: "$2.5", medium: "$3.0", large: "$3.25"),
        rating: "4.8",
        image: "CoffeeBackground"
    )
}

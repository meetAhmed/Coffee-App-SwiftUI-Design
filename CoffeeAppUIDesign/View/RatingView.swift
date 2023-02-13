//
//  RatingView.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 03/02/2023.
//

import SwiftUI

struct RatingView: View {
    let product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 10, height: 10)
            
            Text(product.rating)
                .fontWeight(.bold)
        }
        .padding(.all, 6)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.darkBrownColor)
        )
        .frame(height: 20)
        .font(.headline)
        .foregroundColor(.white)
        .padding(.all, 10)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(product: DataService.instance.limitedTimeOffer)
    }
}

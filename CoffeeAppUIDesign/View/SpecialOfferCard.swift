//
//  SpecialOfferCard.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 02/02/2023.
//

import SwiftUI

struct SpecialOfferCard: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    let product: Product
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardImageWidth, height: cardImageHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 10)
                    
                    Text("4.9")
                }
                .padding(.all, 6)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.darkBrownColor)
                )
                .frame(height: 20)
                .font(.caption2)
                .foregroundColor(.white)
                .padding(.all, 10)
            }
            
            VStack {
                Text("Limited")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.all, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.darkBrownColor)
                    )
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Buy 1 get 1 free if you buy with Gopay.")
                    .font(.headline)
            }
            .frame(height: cardImageHeight, alignment: .center)
        }
        .frame(height: cardImageHeight, alignment: .leading)
        .padding(.all, 10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(colorScheme == .dark ? .black : .white)
        )
        .shadow(
            color: colorScheme == .dark ? .white.opacity(0.15) : .gray.opacity(0.15),
            radius: 7,
            x: 2,
            y: 1
        )
        .onTapGesture {
            viewModel.selectedProduct = product
        }
    }
}

struct SpecialOfferCard_Previews: PreviewProvider {
    static var previews: some View {
        SpecialOfferCard(product: DataService.instance.limitedTimeOffer)
    }
}


private extension SpecialOfferCard {
    var cardImageHeight: CGFloat {
        UIScreen.main.bounds.height * 0.18
    }
    
    var cardImageWidth: CGFloat {
        UIScreen.main.bounds.width * 0.45
    }
}

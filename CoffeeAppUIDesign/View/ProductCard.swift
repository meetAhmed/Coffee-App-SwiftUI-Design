//
//  CategoryCard.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 01/02/2023.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardImageWidth, height: cardImageHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                RatingView(product: product)
            }
            
            Text(product.title)
                .font(.headline)
            
            Text(product.subTitle)
                .font(.caption)
            
            HStack {
                Text(product.price.small)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                ZStack {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 10)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(width: 30, height: 30)
                .background(
                    Circle()
                        .fill(Color.darkBrownColor)
                )
            }
        }
        .frame(width: cardImageWidth)
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
        .padding(.horizontal, 5)
        .onTapGesture {
            viewModel.selectedProduct = product
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: DataService.instance.data[1])
    }
}

private extension ProductCard {
    var cardImageHeight: CGFloat {
        UIScreen.main.bounds.height * 0.18
    }
    
    var cardImageWidth: CGFloat {
        UIScreen.main.bounds.width * 0.45
    }
}

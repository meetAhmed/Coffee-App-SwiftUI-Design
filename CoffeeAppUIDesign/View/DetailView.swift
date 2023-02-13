//
//  DetailView.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 03/02/2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let product: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            imageSection
            detailSection
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(product: DataService.instance.data[0])
    }
}

private extension DetailView {
    var imageSection: some View {
        Image(product.image)
            .resizable()
            .scaledToFill()
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height * 0.5
            )
            .ignoresSafeArea()
            .overlay(
                Button {
                    viewModel.selectedProduct = nil
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.darkBrownColor.opacity(0.95))
                        )
                        .padding()
                },
                alignment: .topLeading
            )
    }
    
    var detailSection: some View {
        VStack(alignment: .leading) {
            detailSectionHeader
            detailSectionBody
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(.black.opacity(0.3))
        .offset(y: UIScreen.main.bounds.height * 0.3)
    }
    
    var detailSectionHeader: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(product.subTitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            RatingView(product: product)
        }
        .padding(.all, 5)
    }
    
    var detailSectionBody: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("About")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(product.description)
                .font(.subheadline)
            
            Spacer()
            
            HStack {
                Text("Add To Cart")
                Spacer()
                Text(product.price.small)
            }
            .padding()
            .font(.headline)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.darkBrownColor)
            )
            
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.detailPageBackground)
        )
    }
}

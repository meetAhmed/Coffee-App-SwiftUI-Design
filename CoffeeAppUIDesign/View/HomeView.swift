//
//  HomeView.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 01/02/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                header
                
                searchBar
                
                listOfProducts
                
                SpecialOfferCard(product: viewModel.limitedTimeOffer)
            }
        }
        .padding()
        .fullScreenCover(item: $viewModel.selectedProduct) { product in
            DetailView(product: product)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

private extension HomeView {
    var header: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image("UserImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Spacer()
                
                Text("Bintara, Bekasi")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Good Morning")
                .font(.headline)
                .padding(.top, 14)
        }
    }
    
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .frame(width: 24, height: 24)
            
            TextField("Search", text: $searchText)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 100)
                .fill(Color("SearchBoxColor"))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(colorScheme == .dark ? .white.opacity(0.15) : .black.opacity(0.15), lineWidth: 1)
        )
        .padding(.top, 15)
    }
    
    var listOfProducts: some View {
        VStack(alignment: .leading) {
            Text("Coffee")
                .font(.headline)
                .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.products) {
                        ProductCard(product: $0)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

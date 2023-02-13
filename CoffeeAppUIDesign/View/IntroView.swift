//
//  IntroView.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 30/01/2023.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentUserSignedIn = false
    
    var body: some View {
        ZStack {
            if currentUserSignedIn {
                HomeView()
            } else {
                OnboardingView()
            }
        }
        .onAppear {
            currentUserSignedIn = false
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

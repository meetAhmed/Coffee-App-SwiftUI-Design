//
//  OnBoardingView.swift
//  CoffeeAppUIDesign
//
//  Created by Ahmed Ali on 30/01/2023.
//

import SwiftUI

struct OnboardingView: View {
    // Onboarding States:
    /*
     0 - Screen 1
     1 - Scree 2
     2 - Screen 3
     */
    @State var onboardingState = 0
    @AppStorage("signed_in") var currentUserSignedIn = false
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    var body: some View {
        ZStack {
            Image("CoffeeBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.45)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    switch onboardingState {
                    case 0:
                        screen1Content
                            .transition(transition)
                    case 1:
                        screen2Content
                            .transition(transition)
                    case 2:
                        screen3Content
                            .transition(transition)
                    default:
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.yellow)
                            .transition(transition)
                    }
                }
                .padding(.bottom, 40)
            
                Spacer()
                
                commonBottomView
                
                Spacer()
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// MARK: Components
private extension OnboardingView {
    var commonBottomView: some View {
        VStack {
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(onboardingState == index ? Color("ButtonColor") : .white)
                        .frame(width: 10, height: 10)
                }
            }
            
            Text(onboardingState == 0 ? "Get Started" : onboardingState == 2 ? "Finish" : "Next")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 65)
                .frame(minWidth: 250)
                .background(Color("ButtonColor"))
                .cornerRadius(34)
                .onTapGesture {
                    handleNextBtnPressed()
                }
        }
    }
    
    var screen1Content: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("Good coffee,\nGood friends,\nLet it blends.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Never Underestimate the Importance of Being Properly Caffeinated.")
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.7)
        }
        .multilineTextAlignment(.center)
    }
    
    var screen2Content: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("Restaurant & Coffee.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Judge a restaurant by the bread and by the coffee.")
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.7)
        }
        .multilineTextAlignment(.center)
    }
    
    var screen3Content: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("Coffee With Friends!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Friends bring happiness into your life. Best friends bring coffee.")
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.7)
        }
        .multilineTextAlignment(.center)
    }
}

// MARK: Functions
private extension OnboardingView {
    func handleNextBtnPressed() {
        withAnimation(.spring()) {
            if onboardingState == 2 {
                currentUserSignedIn = true
            } else {
                onboardingState += 1
            }
        }
    }
}

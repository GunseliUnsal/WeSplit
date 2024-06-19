//
//  WelcomeView.swift
//  WeSplit
//
//  Created by Günseli Ünsal on 19.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white).ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    Image("rich")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                        Text("WeSplit")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("textColor"))

                        Text("Easily split your bill and calculate tips!")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("brandSecondary"))
                            .padding(.bottom, 50)
                        

                        NavigationLink(destination: ContentView()) {
                            Text("Get Started")
                                .frame(width: 250, height: 20)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("brandPrimary"))
                                .cornerRadius(10)
                        }
                    
                    Spacer()
                    }
            }
        }
    }
}

#Preview {
    WelcomeView()
}

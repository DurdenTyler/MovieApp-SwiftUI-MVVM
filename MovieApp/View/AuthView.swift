//
//  SignInOrSignUpView.swift
//  MovieApp
//
//  Created by Ivan White on 20.06.2022.
//

import SwiftUI

struct AuthView: View {
    
    @State var maxCircleHeight: CGFloat = 0
    
    @State var showSignUp = false
    
    
    var body: some View {
        VStack {
            
            GeometryReader {proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0 {
                        maxCircleHeight = height
                    }
                }
                
                return AnyView(
                    
                    ZStack {
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: screen.width / 2, y: -height / 1.3)
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: -screen.width / 2, y: -height / 1.5)
                        
                        Circle()
                            .fill(Color("lightblue"))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                    }
                
                )
            }
            .frame(maxHeight: screen.width)
            
            
            
            
            
            ZStack {
                if showSignUp {
                    SignUp()
                        .transition(.move(edge: .trailing))
                } else {
                    SignIn()
                        .transition(.move(edge: .trailing))
                }
                
            }
            .padding(.top, -maxCircleHeight / (screen.height < 750 ? 1.5 : 1.6 ))
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            HStack {
                Text(showSignUp ? "Еще не с нами?" : "Уже с нами?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Button {
                    withAnimation {
                        showSignUp.toggle()
                    }
                } label: {
                    Text(showSignUp ? "Регистрируйся" : "Войти")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightblue"))
                }

            }
                .padding(.bottom, safeArea.bottom == 0 ? 15 : 0)
            ,alignment: .bottom
        )
        .background(
            
            HStack {
                Circle()
                    .fill(Color("lightblue"))
                    .frame(width: 70, height: 70)
                    .offset(x: -20, y: screen.height < 750 ? -20 : -30)
                
                Spacer()
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 110, height: 110)
                    .offset(x: 30, y: -20)
            }
                .offset(y: safeArea.bottom + 70)
            
            ,alignment: .bottom
        
        )
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

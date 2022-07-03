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
                        Image("solo")
                            .resizable().offset(x: 0, y: 60)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                            .frame(width: 310, height: 410)
                            .offset(x: screen.width / 2, y: -height / 1.5)
                        
                        Image("rental")
                            .resizable().offset(x: 25, y: 110)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                            .offset(x: -screen.width / 2, y: -height / 1.5)
                        
                        Image("toystory")
                            .resizable().offset(x: 0, y: 30)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                            .frame(width: 310, height: 410)
                            .offset(y: -height / 1.58)
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
                Text(showSignUp ? "Уже с нами?" : "Еще не с нами?")
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightblue2"))
                
                Button {
                    withAnimation {
                        showSignUp.toggle()
                    }
                } label: {
                    Text(showSignUp ? "Войти" : "Регистрируйся")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

            }
                .padding(.bottom, safeArea.bottom == 0 ? 15 : 0)
            ,alignment: .bottom
        )
        .background(
            
            ZStack {
                Image("soul")
                    .resizable().offset(x: 75, y: 18)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                    .frame(width: 320, height: 410)
                    .offset(x: 140, y: 70)
                
                Image("PalmSprings")
                    .resizable().offset(x: -100, y: 0)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                    .frame(width: 220, height: 310)
                    .offset(x: -130, y: 100)
                
                Image("true")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                    .frame(width: 320, height: 410)
                    .offset(x: 0, y: 70)
            }
                .offset(y: safeArea.bottom + 70)
            
            ,alignment: .bottom
        
        )
        .background(Color("lightblue2").ignoresSafeArea())
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

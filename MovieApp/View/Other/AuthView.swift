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
    
    @State var showAlert = false
    @State var alertMessage = ""
    @State var toMainTabBar = false
    
    
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
                        Image("starwars3")
                            .resizable().offset(x: -48, y: 10)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                            .frame(width: 310, height: 410)
                            .offset(x: screen.width / 2.4, y: -height / 1.55)
                        
                        Image("starwars3")
                            .resizable().offset(x: 52, y: 108)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                            .offset(x: -screen.width / 2, y: -height / 1.2)
                        
                        Image("solo")
                            .resizable().offset(x: -8, y: 70)
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color("dark"), lineWidth: 10))
                            .frame(width: 310, height: 410)
                            .offset(y: -height / 1.45)
                            .rotationEffect(.init(degrees: -5))
                        
                    }
                        .blur(radius: 3)
                    
                
                )
            }
            .frame(maxHeight: screen.width)
            
            
            
            
            
            ZStack {
                if showSignUp {
                    SignUp(toMainTabBar: $toMainTabBar, showAlert: $showAlert, alertMessage: $alertMessage)
                        .transition(.move(edge: .trailing))
                } else {
                    SignIn(toMainTabBar: $toMainTabBar, showAlert: $showAlert, alertMessage: $alertMessage)
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
                Image("true2")
                    .resizable().offset(x: -75, y: 10)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                    .frame(width: 320, height: 410)
                    .offset(x: 140, y: 70)
                
                Image("true3")
                    .resizable().offset(x: -12, y: -90)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                    .frame(width: 220, height: 310)
                    .offset(x: -130, y: 130)
                
                Image("true")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("almostwhite"), lineWidth: 10))
                    .frame(width: 320, height: 410)
                    .offset(x: 0, y: 110)
            }
                .offset(y: safeArea.bottom + 70)
                .blur(radius: 3)
            
            ,alignment: .bottom
        
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.white).blur(radius: 3).ignoresSafeArea())
        .alert(Text(alertMessage), isPresented: $showAlert) {
            Text("Ok")
        }
        .fullScreenCover(isPresented: $toMainTabBar) {
            let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
            MainTabBarView(mainTabBarViewModel: mainTabBarViewModel)
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

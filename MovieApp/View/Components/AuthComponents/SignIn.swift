//
//  SignIn.swift
//  MovieApp
//
//  Created by Ivan White on 20.06.2022.
//

import SwiftUI

struct SignIn: View {
    
    @State var email = ""
    @State var password = ""
    @State var toMainTabBar = false
    
    var body: some View {
        VStack {
            Text("Войти")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("lightblue2"))
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Логин")
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightblue2"))
                
                TextField(" ijustine@gmail.com", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .background(.white)
                    .cornerRadius(5)
            }
            .padding(.top, 20)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Пароль")
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightblue2"))
                
                SecureField(" 123456", text: $password)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .background(.white)
                    .cornerRadius(5)
            }
            .padding(.top, 20)
            
            Button {
                print("Забыли пароль")
            } label: {
                Text("Забыли пароль?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            
            
            Button {
                toMainTabBar.toggle()
            } label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("lightblue2"))
                    .clipShape(Circle())
                    .shadow(color: Color("lightblue").opacity(0.6), radius: 5, x: 0, y: 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .fullScreenCover(isPresented: $toMainTabBar) {
                MainTabBarView()
            }


        }
        .padding()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

//
//  SignUp.swift
//  MovieApp
//
//  Created by Ivan White on 20.06.2022.
//

import SwiftUI

struct SignUp: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View {
        VStack {
            Text("Зарегистрироваться")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("dark"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Логин")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("ijustine@gmail.com", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                
                
                Divider()
            }
            .padding(.top, 25)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Пароль")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                SecureField("123456", text: $password)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                
                
                Divider()
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Подтвердите пароль")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                SecureField("123456", text: $confirmPassword)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                
                
                Divider()
            }
            .padding(.top, 20)
            
            
            Button {
                ///
            } label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("dark"))
                    .clipShape(Circle())
                    .shadow(color: Color("lightblue").opacity(0.6), radius: 5, x: 0, y: 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)


        }
        .padding()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

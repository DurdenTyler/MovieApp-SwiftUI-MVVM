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
    
    @Binding var toMainTabBar: Bool
    @Binding var showAlert: Bool
    @Binding var alertMessage: String
    
    
    var body: some View {
        VStack {
            Text("Зарегистрироваться")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("lightblue2"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Логин")
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightblue2"))
                
                TextField(" ijustine@gmail.com", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .background(.white)
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
            .padding(.top, 15)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Подтвердите пароль")
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightblue2"))
                
                SecureField(" 123456", text: $confirmPassword)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .background(.white)
                    .cornerRadius(5)
            }
            .padding(.top, 15)
            
            
            Button {
                guard password.count >= 4 else {
                    self.alertMessage = "Пароль должен быть длиннее"
                    self.showAlert.toggle()
                    return
                }
                guard password == confirmPassword else {
                    self.alertMessage = "Проверочный пароль должен совпадать"
                    self.showAlert.toggle()
                    return
                }
                
                AuthService.shared.signUp(email: email, password: password) { result in
                    switch result {
                    case .success(let user):
                        alertMessage = "Вы успешно зарегистрированы на почту: \(user.email!)"
                        showAlert.toggle()
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                    case .failure(let error ):
                        alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                        showAlert.toggle()
                    }
                }
            } label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("lightblue2"))
                    .clipShape(Circle())
                    .shadow(color: Color("lightblue2").opacity(0.6), radius: 5, x: 0, y: 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)


        }
        .padding()
    }
    
    private func signIn(email: String, password: String) {
        AuthService.shared.signIn(email: email, password: password) { result in
            switch result {
            case .success(_):
                
                toMainTabBar.toggle()
                
            case .failure(let error):
                
                alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                showAlert.toggle()
                
            }
        }
    }
}

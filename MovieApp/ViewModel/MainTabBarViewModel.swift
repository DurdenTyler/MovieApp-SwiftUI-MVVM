//
//  MainTabBarViewModel.swift
//  MovieApp
//
//  Created by Ivan White on 25.07.2022.
//

import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init (user: User) {
        self.user = user
    }
    
}

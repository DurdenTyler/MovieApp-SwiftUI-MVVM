//
//  MainTabBarView.swift
//  MovieApp
//
//  Created by Ivan White on 12.07.2022.
//

import SwiftUI

struct MainTabBarView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(Tab.home)
                RecommendView()
                    .tag(Tab.recommend)
                FavoritesView()
                    .tag(Tab.favorites)
            }
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}

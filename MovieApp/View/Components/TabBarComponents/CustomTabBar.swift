//
//  CustomTabBar.swift
//  MovieApp
//
//  Created by Ivan White on 12.07.2022.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader{ proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -65
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)) {
                            yOffset = 0
                        }
                    } label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 27)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("nightSky") : Color("almostwhite"))
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }

                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(Color("lightblue2"))
                    .frame(width: 27, height: 27)
                    .offset(x: 41, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
            }
        }
        .frame(height: 30)
        .padding(.bottom, 10)
        .padding([.horizontal, .top])
    }
    
    func indicatorOffset(width: CGFloat)->CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 {
            return 0
        }
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    func getIndex()->Int {
        switch currentTab {
        case .home:
            return 0
        case .recommend:
            return 1
        case .favorites:
            return 2
        }
    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}

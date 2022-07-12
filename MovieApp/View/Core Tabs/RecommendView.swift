//
//  RecommendView.swift
//  MovieApp
//
//  Created by Ivan White on 12.07.2022.
//

import SwiftUI

struct RecommendView: View {
    var body: some View {
        VStack {
            Text("Recommend")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG").ignoresSafeArea())
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}

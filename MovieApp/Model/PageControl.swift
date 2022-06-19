//
//  PageControl.swift
//  MovieApp
//
//  Created by Ivan White on 28.05.2022.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    
    var maxPages: Int
    var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

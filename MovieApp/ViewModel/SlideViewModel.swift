//
//  SlideViewModel.swift
//  MovieApp
//
//  Created by Ivan White on 27.05.2022.
//

import SwiftUI


class SlideViewModel: ObservableObject {
    
    static let shared = SlideViewModel()
    
    var slides = [
        
        Slide(title: "Лучший поиск фильма на вечер", image: "SpiderMan"),
        Slide(title: "Найди фильм по настроению", image: "StrangerThings"),
        Slide(title: "Тематической подборки", image: "BladeRunner"),
        Slide(title: "", image: "Topgun")
    
    ]
    
}

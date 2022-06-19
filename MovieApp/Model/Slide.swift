//
//  Slide.swift
//  MovieApp
//
//  Created by Ivan White on 27.05.2022.
//

import SwiftUI


struct Slide: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var image: String
}


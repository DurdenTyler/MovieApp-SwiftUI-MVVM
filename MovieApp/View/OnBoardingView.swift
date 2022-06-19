//
//  Home.swift
//  MovieApp
//
//  Created by Ivan White on 28.05.2022.
//

import SwiftUI

struct OnBoardingView: View {
    // Устанавливаем текущий слайд
    @State var selectedSlide: Slide = SlideViewModel.shared.slides[0]
    
    // Отключаем эффект оттягивания
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            GeometryReader {
                proxy in
                let frame = proxy.frame(in: .global)
                
                Image(selectedSlide.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    .cornerRadius(0)
                    .blur(radius: 2, opaque: true)
            }
            .ignoresSafeArea()

            
            VStack {
                Text("Вперед с агрегатором мира кино")
                    .fontWeight(.bold)
                    .foregroundColor(.yellow).opacity(0.5)
                    .cornerRadius(10)
                
                Text("Что посмотреть?")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                    .padding(.top, 1)
                    .padding(.bottom, 10)
                
                VStack {
                    GeometryReader {
                        proxy in
                        let frame = proxy.frame(in: .global)
                        
                        TabView(selection: $selectedSlide) {
                            
                            ForEach(SlideViewModel.shared.slides) {
                                slide in
                                Image(slide.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width, height: frame.height, alignment: .center)
                                    .cornerRadius(10)
                                    .tag(slide)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .frame(height: UIScreen.main.bounds.height / 1.89)
                    
                    // Здесь делаем page Control
                    PageControl(maxPages: SlideViewModel.shared.slides.count, currentPage: getIndex())
                        .padding(.top, 25)
                }
                .padding(.top)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .padding(.horizontal, 30)
                
                if selectedSlide != SlideViewModel.shared.slides[3] {
                    Text(selectedSlide.title)
                        .font(.title3.bold())
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 18)
                        .padding(.top, 10)
                        .padding(.horizontal)
                    
                } else {
                    Button {
                        //
                    } label: {
                        Text("Вперед")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 18)
                            .frame(maxWidth: .infinity)
                            .background(.cyan)
                            .cornerRadius(10)
                    }
                    .padding(.top, 15)
                    .padding(.horizontal)
                }

            }
    }
    }
        
        func getIndex()-> Int {
            let index = SlideViewModel.shared.slides.firstIndex { (slide)-> Bool in
                return selectedSlide.id == slide.id
            } ?? 0
            return index
        }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

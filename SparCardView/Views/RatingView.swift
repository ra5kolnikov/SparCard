//
//  RatingView.swift
//  RatingView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Double
    let reviewsCount: Int
    
    var body: some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text("\(rating, specifier: "%.1f")")
            Text("| \(reviewsCount) отзывов")
                .foregroundStyle(.gray)
            Spacer()
        }
    }
}

struct RatingView_ProviderView: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3.0, reviewsCount: 30)
            .previewLayout(.fixed(width: 400, height: 50))
    }
}

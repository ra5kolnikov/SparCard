//
//  ReviewsView.swift
//  ReviewsView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct ReviewsView: View {
    let reviews: [Reviews]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack (alignment: .leading){
                Text("Отзывы")
                    .bold()
                    .font(.title)
                HStack(spacing: 20) {
                    ForEach(reviews) { review in
                        ReviewCard(review: review)
                    }
                }
                .padding(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let reviews = Reviews.sampleData
    static var previews: some View {
        ReviewsView(reviews: reviews)
    }
}


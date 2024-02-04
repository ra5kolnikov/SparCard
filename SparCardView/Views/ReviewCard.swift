//
//  ReviewCard.swift
//  ReviewCard
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct ReviewCard: View {
    let review: Reviews
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(review.name)
                .font(.headline)
            
                StarRatingView(rating: review.rating)
                Text(review.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            
            Text(review.description)
                .font(.body)
                .lineLimit(3)
        }
        .padding()
        .frame(width: 250, height: 180)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct StarRatingView: View {
    let rating: Double
    
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(index < Int(rating) ? .yellow : .gray)
            }
        }
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: Reviews.sampleData[0])
            .previewLayout(.fixed(width: 300, height: 300))
    }
}

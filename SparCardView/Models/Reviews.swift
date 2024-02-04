//
//  Reviews.swift
//  SparCardView
//
//  Created by Виталий on 03.02.2024.
//

import Foundation
import SwiftUI

struct Reviews: Identifiable {
    let id: UUID
    let name: String
    let date: Date
    let rating: Double
    let description: String
    
    init(id: UUID = UUID(), name: String, date: Date, rating: Double, description: String) {
        self.id = id
        self.name = name
        self.date = date
        self.rating = rating
        self.description = description
    }
    
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM y")
        return dateFormatter.string(from: date)
    }
}

extension Reviews {
    static let sampleData: [Reviews] =
    [
        Reviews(name: "Александр В.", date: Date(), rating: 4, description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими !"),
        Reviews(name: "Екатерина С.", date: Date(), rating: 4, description: "Хорошее качество, но цена немного высокая."),
        Reviews(name: "Иван П.", date: Date(), rating: 3, description: "Средний товар, ожидал большего."),
        Reviews(name: "Мария К.", date: Date(), rating: 5, description: "Прекрасный продукт, рекомендую всем!")
    ]
}


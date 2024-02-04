//
//  ReviewButton.swift
//  ReviewButton
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct ReviewButton: View {
    var action: () -> Void

    let buttonColor: Color
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    
    var body: some View {
        Button(action: action) {
            Text("Оставить отзыв")
                .foregroundColor(buttonColor)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.green, lineWidth: borderWidth)
        )
        .padding()
    }
}

struct ReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewButton(action: {
            print("Отзыв оставлен")
        }, buttonColor: .green, cornerRadius: 25, borderWidth: 3)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}

//
//  ProviderView.swift
//  ProviderView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI

struct ProviderView: View {
    let image: Image
    let text: String
    var body: some View {
        HStack {
            image
                .resizable()
                .clipShape(.circle)
                .frame(width: 30, height: 30)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct ProviderCiew_Previews: PreviewProvider {
    static var image = Image("spainFlag")
    static var text = "spainFlag"
    static var previews: some View {
        ProviderView(image: image, text: text)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

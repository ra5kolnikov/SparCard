//
//  CardView.swift
//  CardView
//
//  Created by Виталий on 03.02.2024.
//

import SwiftUI
struct CardView: View {
    @State private var isSharing = false
    let product: ProductModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        product.image
                            .resizable()
                            .frame(height: 350)
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom)
                        RatingView(rating: product.rating, reviewsCount: product.reviews.count)
                            .padding(.bottom, 5)
                        Text(product.name)
                            .font(.title)
                            .bold()
                            .lineLimit(3)
                        ProviderView(image: product.providerImage,
                                     text: product.providerDescr)
                        DescriptionView(description: product.description,
                                        characteristics: product.characteristics)
                        ReviewsView(reviews: product.reviews)
                        ReviewButton(action: {
                            print("Отзыв оставлен")
                        },
                                     buttonColor: .green,
                                     cornerRadius: 25,
                                     borderWidth: 2
                        )
                    }
                }
                PurchaseView(discountPercentage: product.discount ?? 0.0,
                             originalPricePerCol: product.pricePerCol,
                             originalPricePerKg: product.pricePerKG,
                             discountPricePerCol: product.discountedPricePerCol,
                             discountPricePerKG: product.discountedPricePerKG)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Label("Back", systemImage: "arrow.backward")
                    }
                    .tint(.green)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Label("Plus", systemImage: "note.text")
                    }
                    .tint(.green)
                    Button(action: {
                        self.isSharing = true
                    }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .sheet(isPresented: $isSharing) {
                        ActivityViewController(activityItems: product.contentToShare)
                            }
                    .tint(.green)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var product = ProductModel.sampleData[0]
    static var previews: some View {
        CardView(product: product)
    }
}

//
//  FoodCatalogCustomCell.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

import Kingfisher
import SwiftUI

struct FoodCatalogCustomCell: View {
    var image = ""
    var text = ""

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Asset.Colors.foodCeelsBackground.swiftUIColor)
                .cornerRadius(10.0)
                .frame(width: 109, height: 109)
                .overlay {
                    KFImage(URL(string: image))
                        .resizable()
                        .scaledToFit()
                        .padding()
                }

            Text(text)
                .foregroundColor(.black)
                .font(FontFamily.SFProDisplay.regular.swiftUIFont(size: 14))
                .kerning(0.14)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 109, alignment: .leading)
        }
    }
}

struct FoodCatalogCustomCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodCatalogCustomCell()
    }
}

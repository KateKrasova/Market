//
//  MainCustomCell.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

import Kingfisher
import SwiftUI

struct MainCustomCell: View {
    var text = ""
    var image = ""

    var body: some View {
        KFImage(URL(string: image))
            .resizable()
            .scaledToFill()
            .overlay(alignment: .topLeading) {
                Text(text)
                    .foregroundColor(.black)
                    .font(FontFamily.SFProDisplay.medium.swiftUIFont(size: 20.0))
                    .kerning(0.2)
                    .frame(maxWidth: 170, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
    }
}

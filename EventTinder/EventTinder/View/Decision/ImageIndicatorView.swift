//
//  ImageIndicatorView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

//Probably don't need this but good to have

import SwiftUI

struct ImageIndicatorView: View {
    
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension ImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    ImageIndicatorView(currentImageIndex: 1, imageCount: 9)
        .preferredColorScheme(.dark)
}


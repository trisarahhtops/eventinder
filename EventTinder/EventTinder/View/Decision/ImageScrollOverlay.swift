//
//  ImageScrollOverlay.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct ImageScrollOverlay: View {
    @Binding var currentImageIndex: Int
    
    let imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollOverlay {
    func updateImageIndex(increment: Bool){
        if increment {
            guard currentImageIndex < imageCount - 1 else { return }
            currentImageIndex += 1
        } else{
            guard currentImageIndex > 0 else { return }
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollOverlay(currentImageIndex: .constant(1), imageCount: 2)
}


//
//  SwipeButtonView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct SwipeButtonView: View {
    @ObservedObject var viewModel: DecisionViewModel
    var body: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 100, height: 100)
            
            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    SwipeButtonView(viewModel: DecisionViewModel(service: DecisionService()))
}

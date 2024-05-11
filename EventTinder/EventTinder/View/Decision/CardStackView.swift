//
//  CardStackView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        VStack {
            ZStack {
                Text("No events left")
                    .font(.headline)
                ForEach(DecisionViewModel.shared.decisionModels, id: \.self) { decision in
                    DecisionView(model: decision)
                }
                
            }
            if !DecisionViewModel.shared.decisionModels.isEmpty {
                SwipeButtonView(viewModel: DecisionViewModel.shared)
            }
        }
    }
}

#Preview {
    CardStackView()
}

/*.onChange(of: viewModel.decisionModels) { oldValue, newValue in
print("DEBUG: Old value count is \(oldValue.count)")
print("DEBUG: New value count is \(oldValue.count)")*/


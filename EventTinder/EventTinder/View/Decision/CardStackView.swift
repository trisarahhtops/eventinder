//
//  CardStackView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = DecisionViewModel()
    var body: some View {
        VStack {
            ZStack {
                Text("No events left")
                    .font(.headline)
                ForEach(viewModel.decisionModels, id: \.self) { decision in
                    DecisionView(viewModel: viewModel, model: decision)
                }
                
            }
            if !viewModel.decisionModels.isEmpty {
                SwipeButtonView(viewModel: viewModel)
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


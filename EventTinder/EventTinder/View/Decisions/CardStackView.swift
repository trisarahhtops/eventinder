//
//  CardStackView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = DecisionViewModel(service: DecisionService())
    var body: some View {
            ZStack {
                ForEach(viewModel.decisionModels) { decision in
                    DecisionView(viewModel: viewModel, model: decision)
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

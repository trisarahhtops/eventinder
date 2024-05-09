//
//  DecisionViewModel.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

@MainActor
class DecisionViewModel: ObservableObject {
    @Published var decisionModels:[DecisionModel] = []
    @Published var buttonSwipeAction: SwipeAction?
    
        //private let service: DecisionService = DecisionService()

    init() {
        for e in MockData.events {
            decisionModels.append(DecisionModel(event: e))
        }

       // Task { await fetchDecisionModels() }
    }

/*
    func fetchDecisionModels() async {
        do {
            //self.decisionModels = try await service.fetchDecisionModels()
        } catch {
            print("DEBUG: Failed to fetch decisions with error: \(error)")
        }
    }
 */
    func removeDecision(_ decision: DecisionModel) {
        guard let index = decisionModels.firstIndex(where: { $0.event.id == decision.event.id }) else { return }
        decisionModels.remove(at: index)
    }
}

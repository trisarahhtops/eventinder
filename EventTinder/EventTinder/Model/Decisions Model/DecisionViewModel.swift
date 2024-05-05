//
//  DecisionViewModel.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

@MainActor
class DecisionViewModel: ObservableObject {
    @Published var decisionModels = [DecisionModel(event: MockData.events[1]), DecisionModel(event: MockData.events[2])]
    @Published var buttonSwipeAction: SwipeAction?
    @Published var decisionModel = DecisionModel(event: MockData.events[1])
    
        private let service: DecisionService
    
    init(service: DecisionService) {
        self.service = service
        Task { await fetchDecisionModels() }
    }
    
    func fetchDecisionModels() async {
        do {
            self.decisionModels = try await service.fetchDecisionModels()
        } catch {
            print("DEBUG: Failed to fetch decisions with error: \(error)")
        }
    }
    
    func removeDecision(_ decision: DecisionModel) {
        guard let index = decisionModels.firstIndex(where: { $0.id == decision.id }) else { return }
        decisionModels.remove(at: index)
    }
}

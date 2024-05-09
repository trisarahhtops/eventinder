//
//  DecisionService.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation
struct DecisionService {
    func fetchDecisionModels() async throws -> [DecisionModel] {
        let events = MockData.events
        return events.map({ DecisionModel(event: $0)})
    }
}

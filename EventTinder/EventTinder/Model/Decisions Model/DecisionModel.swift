//
//  DecisionModel.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation

struct DecisionModel {
    let event: Event
}

extension DecisionModel: Identifiable {
    var id: String { return event.id }
}

extension DecisionModel: Equatable {
    static func == (lhs: DecisionModel, rhs: DecisionModel) -> Bool {
        return lhs.event == rhs.event
    }
}

extension DecisionModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(event)
    }
}


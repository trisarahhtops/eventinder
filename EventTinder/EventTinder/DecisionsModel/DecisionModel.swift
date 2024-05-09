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

extension DecisionModel: Identifiable, Hashable {
    var id: String { return event.id }
}


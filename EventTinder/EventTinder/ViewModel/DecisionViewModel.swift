//
//  DecisionViewModel.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import Foundation
import FirebaseAuth

@MainActor
class DecisionViewModel: ObservableObject {
    static var shared = DecisionViewModel()
    @Published var decisionModels:[DecisionModel] = []
    @Published var buttonSwipeAction: SwipeAction?
    
        //private let service: DecisionService = DecisionService()

    init() {
        //getAllEvents()
       // Task { await fetchDecisionModels() }
    }
    
    func getAllEvents() {
        decisionModels = []
        Task{
            if await (UserManagerViewModel.shared.getLastSwipedEvent(userId: UserData.shared.username)-1 > 0){
                for i in await 0...UserManagerViewModel.shared.getLastSwipedEvent(userId: UserData.shared.username)-1{
                    decisionModels.append(DecisionModel(event: MockData.events[i]))
                }
            }
        }
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
    func removeDecision(likes: Bool) {
        /*
        guard let index = decisionModels.firstIndex(where: { $0.event.id == decision.event.id }) else { return }
        decisionModels.remove(at: index)
         */
        
        //ToDo: Datenbank event geliked
        if(likes){
            UserManagerViewModel.shared.userLikesEvent(userId: UserData.shared.username, eventId: decisionModels.last!.event.id)
        }
        decisionModels.removeLast()
    }
}

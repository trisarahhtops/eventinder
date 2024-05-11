//
//  DecisionViewModel.swift
//  EventTinder
//
//  Created by Julia Eisele on 09.05.2024
//

import Foundation
import FirebaseAuth

@MainActor
class DecisionViewModel: ObservableObject {
    static var shared = DecisionViewModel()
    @Published var decisionModels:[DecisionModel] = []
    @Published var buttonSwipeAction: SwipeAction?

    
    func getAllEvents() {
        //gets all Events that a user has not seen yet (if there are any left)
        decisionModels = []
        Task{
            if await (UserManagerViewModel.shared.getLastSwipedEvent(userId: UserData.shared.username)-1 > 0){
                for i in await 0...UserManagerViewModel.shared.getLastSwipedEvent(userId: UserData.shared.username)-1{
                    decisionModels.append(DecisionModel(event: MockData.events[i]))
                }
            }
        }
    }

    func removeDecision(likes: Bool) {
        //removes an event that the user swiped/clicked yes/no on from the list of events that the user has not seen yet. If the user liked that event (clicked yes or swiped right) the event ID is saved in the database
        if(likes){
            UserManagerViewModel.shared.userLikesEvent(userId: UserData.shared.username, eventId: decisionModels.last!.event.id)
        }
        decisionModels.removeLast()
    }
}

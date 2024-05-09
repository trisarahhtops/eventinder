//
//  DecisionView.swift
//  EventTinder
//
//  Created by Amelie Patzer on 22.04.24.
//

import SwiftUI

struct DecisionView: View {
    @ObservedObject var viewModel: DecisionViewModel = DecisionViewModel()
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    @State private var currentImageIndex = 1 //might delete later
    
    //let model: DecisionModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                Image(viewModel.decisionModels[0].event.imageURLs[currentImageIndex]) //delete later
                //Image(.cafe) this is without the imagescroll
                    .resizable()
                    .scaledToFill()
                    .overlay { //delete later
                        ImageScrollOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount) //Delete later
                
                SwipeView(xOffset: $xOffset, screenCutoff: SizeConstants.screenCutoff)
            }
                
            
            EventInfoView(event: event)
            /*VStack {
                Spacer()
                SwipeButtonView(viewModel: viewModel)
                    //.padding(.bottom, 100) // Adjust the padding as needed
            }
            .padding(.horizontal)*/
            
        }
        
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action: action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
        //CardStackView(viewModel: viewModel)
    }
    
}



private extension DecisionView {
    var event: Event {
        return viewModel.decisionModels[0].event
    }
    
    var imageCount: Int {
        return event.imageURLs.count
    }
}

private extension DecisionView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight(){
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeDecision(viewModel.decisionModels[0])
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeDecision(viewModel.decisionModels[0])
        }
    }
    func onReceiveSwipeAction( action: SwipeAction?){
        guard let action else { return }
        
        let topDecision = viewModel.decisionModels.last
        
        if topDecision == viewModel.decisionModels[0] {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension DecisionView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) < abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

/* moved to sizeconstants
private extension CardView {
    var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}*/

#Preview {
    DecisionView(viewModel: DecisionViewModel())
}

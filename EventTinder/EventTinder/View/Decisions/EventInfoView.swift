//
//  EventInfoView.swift
//  EventTinder
//
//  Created by Sarah Zhong on 28/4/2024.
//

import SwiftUI

struct EventInfoView: View {
    let event: Event
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(event.eventName)
                .font(.title)
                .fontWeight(.heavy)
            
            Spacer()
            
            /*Button {
                print("DEBUG: Show event here...")
            } label: {
                    Image(systemName: "arrow.up.circle")
                    .fontWeight(.bold)
                    .imageScale(.large)
                }*/
            }
            Text(event.eventDate)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.bottom,10)
            
        Text("Some test description for now..")
            .font(.subheadline)
            .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors:[.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    EventInfoView(event: MockData.events[1])
}

//
//  EventCard.swift
//  EventTinder
//
//  Created by Sarah Zhong on 5/5/2024.
//

import SwiftUI

struct EventCard: View {
    let event: Event
    
    var body: some View {
        VStack(spacing: 0) {
            Image(event.imageURLs.first ?? "")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                }
                .frame(height: 225, alignment: .bottom)
                .clipped()
            
            Text(event.eventName)
                .font(.system(.footnote, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
                .padding(.top, 16)
                .foregroundStyle(.black) // Make the text black
                
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(event.eventDate)
                    .foregroundStyle(.secondary)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.callout)
            }
            .padding(.top, 5)
            .font(.system(.caption2, weight: .semibold))
            .foregroundStyle(.black)
        }
        .frame(width: 160)
        .clipped()
        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}



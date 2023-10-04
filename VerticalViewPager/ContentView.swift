//
//  ContentView.swift
//  VerticalViewPager
//
//  Created by XING ZHAO on 2023-10-03.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.pink, .orange, .indigo, .green]
    let morningAffirmations = [
        "I am grateful for a new day filled with endless opportunities.",
        "I am confident in my abilities and ready to tackle any challenges that come my way.",
        "I radiate positivity and attract positive energy into my life.",
        "I embrace change as a chance to grow and learn."
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<colors.count, id:\.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(colors[index])
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Affirmation \(index + 1).")
                                    .font(.system(size: 36).bold())
                                    .foregroundStyle(.white.opacity(0.7))
                                Text(morningAffirmations[index])
                                    .font(.system(size: 48).bold())
                                    .foregroundStyle(.white)
                            }
                            .padding()
                        }
                        .frame(height: geo.size.height)
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

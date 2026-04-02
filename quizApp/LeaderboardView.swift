//
//  LeaderboardView.swift
//  quizApp
//
//  Created by Robin Eliasson on 2026-03-29.
//

import SwiftUI

struct LeaderboardView: View {
    // Array of quiz-related emojis
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸", 
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]
    
    var body: some View {
        ZStack {
            // Background
            EmojiBackgroundView(emojis: emojis, isAnimating: false)
            
            // Gradient overlay for better readability
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.3),
                    Color.black.opacity(0.5),
                    Color.black.opacity(0.3)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Content will go here
            VStack {
                Text("leaderboard_title")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
        }
        .navigationTitle("leaderboard_title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LeaderboardView()
    }
}

//
//  StartScreen.swift
//  quizApp
//
//  Created by Robin Eliasson on 2026-03-29.
//

import SwiftUI

struct StartScreen: View {
    @State private var isAnimating = false
    
    // Array of quiz-related emojis
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸", 
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                //  emoji background
                EmojiBackgroundView(emojis: emojis, isAnimating: isAnimating)
                
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
                
                // Main content
                VStack(spacing: 40) {
                    Spacer()
                    
                    // Title section
                    VStack(spacing: 16) {
                        Text("welcome_to")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                        
                        Text("emoji_quiz_title")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.yellow, .orange, .pink],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                        
                        Text("🎯🎮🎨🎭")
                            .font(.system(size: 40))
                    }
                    
                    Spacer()
                    
                    // Buttons section
                    VStack(spacing: 16) {
                        // Start Game button (Primary action)
                        NavigationLink(destination: QuizView()) {
                            Label("start_game", systemImage: "play.fill")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 18)
                                .background(
                                    LinearGradient(
                                        colors: [.green, .mint],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: .green.opacity(0.5), radius: 10, x: 0, y: 5)
                        }
                        .buttonStyle(.plain)
                        
                        // How to Play button (Primary action)
                        NavigationLink(destination: HowToPlayView()) {
                            Label("how_to_play", systemImage: "questionmark.circle.fill")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 18)
                                .background(
                                    LinearGradient(
                                        colors: [.blue, .cyan],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                        }
                        .buttonStyle(.plain)
                        
                        HStack(spacing: 16) {
                            // Statistik/leaderboard button
                            // FRAMTIDA FEATURE
                            NavigationLink(destination: LeaderboardView()) {
                                Label("leaderboard", systemImage: "trophy.fill")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(.ultraThinMaterial)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            }
                            .buttonStyle(.plain)
                            
                            // Settings button (Secondary action)
                            // FRAMTIDA FEATURE (språket styrs nu av telefonens språksetting och vi vill i framtiden kunna välja att override till eget valt språk)
                            NavigationLink(destination: SettingsView()) {
                                Label("settings", systemImage: "gearshape.fill")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(.ultraThinMaterial)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                        .frame(height: 60)
                }
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

// Static emoji background component
struct EmojiBackgroundView: View {
    let emojis: [String]
    let isAnimating: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.purple.opacity(0.8),
                        Color.blue.opacity(0.8),
                        Color.indigo.opacity(0.8)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // Static emojis in a grid pattern
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 40), count: 5), spacing: 40) {
                    ForEach(0..<25, id: \.self) { index in
                        Text(emojis[index % emojis.count])
                            .font(.system(size: 40))
                            .opacity(0.2)
                    }
                }
                .padding(40)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StartScreen()
}

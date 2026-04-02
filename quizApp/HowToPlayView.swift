//
//  HowToPlayView.swift
//  quizApp
//
//  Created by Robin Eliasson on 2026-03-29.
//

import SwiftUI

struct HowToPlayView: View {
    // Array of quiz-related emojis
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸", 
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]
    
    var body: some View {
        ZStack {
            // Background
            EmojiBackgroundView(emojis: emojis, isAnimating: false)
            
            
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
            
            // Content
            ScrollView {
                VStack(spacing: 30) {
                    // Title
                    Text("how_to_play_title")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    
                    // Instructions
                    VStack(spacing: 20) {
                        InstructionStep(number: "1", emoji: "👀", text: String(localized: "instruction_1"))
                        
                        InstructionStep(number: "2", emoji: "🤔", text: String(localized: "instruction_2"))
                        
                        InstructionStep(number: "3", emoji: "✍️", text: String(localized: "instruction_3"))
                        
                        InstructionStep(number: "4", emoji: "➡️", text: String(localized: "instruction_4"))
                        
                        InstructionStep(number: "5", emoji: "📊", text: String(localized: "instruction_5"))
                        
                        InstructionStep(number: "6", emoji: "🏆", text: String(localized: "instruction_6"))
                    }
                    .padding(.horizontal, 20)
                    
                    // Example
                    VStack(spacing: 15) {
                        Text("example_title")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        
                        VStack(spacing: 10) {
                            Text("🦁👑")
                                .font(.system(size: 60))
                            
                            Text("example_answer")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer(minLength: 40)
                }
            }
        }
        .navigationTitle("how_to_play_title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Simple instruction step component
struct InstructionStep: View {
    let number: String
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 15) {
            // Step number circle
            ZStack {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Text(number)
                    .font(.headline.bold())
                    .foregroundStyle(.white)
            }
            
            // Emoji
            Text(emoji)
                .font(.system(size: 30))
            
            // Instruction text
            Text(text)
                .font(.body)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    NavigationStack {
        HowToPlayView()
    }
}

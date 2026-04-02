//
//  SettingsView.swift
//  quizApp
//
//  Created by Robin Eliasson on 2026-03-29.
//

import SwiftUI

struct SettingsView: View {
    // Array of quiz-related emojis
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸",
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]

    @AppStorage("selectedLanguage") private var selectedLanguage: String = "en"
    @State private var confirmationMessage: String = ""
    @State private var showConfirmation: Bool = false

    var body: some View {
        ZStack {
            // Background
            EmojiBackgroundView(emojis: emojis, isAnimating: false)

            // Gradient overlay
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

            VStack(spacing: 32) {
                Text("Settings")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                // Language selection
                VStack(spacing: 12) {
                    Text("Välj ditt föredragna språk\nChoose your preferred language")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white.opacity(0.85))

                    VStack(spacing: 16) {
                        // Svenska button
                        Button {
                            selectedLanguage = "sv"
                            confirmationMessage = "Bytte språk till svenska"
                            showConfirmation = true
                            Task {
                                try? await Task.sleep(for: .seconds(2.5))
                                showConfirmation = false
                            }
                        } label: {
                            HStack {
                                Text("🇸🇪")
                                Text("Svenska")
                                    .font(.title3.bold())
                                if selectedLanguage == "sv" {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.white)
                                }
                            }
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

                        // English button
                        Button {
                            selectedLanguage = "en"
                            confirmationMessage = "Changed language to english"
                            showConfirmation = true
                            Task {
                                try? await Task.sleep(for: .seconds(2.5))
                                showConfirmation = false
                            }
                        } label: {
                            HStack {
                                Text("🇬🇧")
                                Text("English")
                                    .font(.title3.bold())
                                if selectedLanguage == "en" {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.white)
                                }
                            }
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
                    }
                    .padding(.horizontal, 32)
                }
            }

            // Confirmation toast
            if showConfirmation {
                VStack {
                    Spacer()
                    Text(confirmationMessage)
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 14)
                        .background(.ultraThinMaterial, in: Capsule())
                        .padding(.bottom, 48)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .animation(.spring, value: showConfirmation)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}

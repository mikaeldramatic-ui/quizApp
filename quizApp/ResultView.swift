//
//  ResultView.swift
//  quizApp
//
//  Created by Jaime Lavalle on 4/1/26.
// Updated by Mikael Engvall on 4/2/26.
 
import SwiftUI
 
struct ResultView: View {
    let score: Int
    let results: [(QuizQuestion, String, Bool)]
    
    private let emojis = ["🎯","🎮","🎲","🎪","🎨","🎭","🎬","🎤","🎧","🎸",
                          "🎹","🎺","🎻","🎼","🎵","🎶","🏆","🥇","🥈","🥉",
                          "💯","✨","⭐️","🌟","💫","🔥","🎉","🎊","🎈","🎁"]
    
    var body: some View {
        
        ZStack {
            
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
            
            VStack(spacing: 20) {
                //  Score
                Text("Your Score")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("\(score) / \(results.count)")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.green)
                
                //  Feedback
                Text(feedbackText)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Divider()
                
                ScrollView {
                    
                    VStack(spacing: 16) {
                        ForEach(results, id: \.0.id) { question, userAnswer, isCorrect in
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                HStack {
                                    
                                    Text(question.emojis)
                                        .font(.largeTitle)
                                    
                                    Spacer()
                                    
                                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                        .foregroundColor(isCorrect ? .green : .red)
                                        .font(.title2)
                                }
                                
                                Text ("Your answer: \(userAnswer)")
                                    .foregroundColor(isCorrect ? .green : .red)
                                
                                if !isCorrect {
                                    Text("Right answer is: \(question.correctAnswer)")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.subheadline)
                                }
                            }
                            .padding()
                            .background(.white.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                //  Play again
                NavigationLink{
                    QuizView()
                } label: {
                    Label("Play Again", systemImage: "arrow.clockwise")
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
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .green.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(.plain)
                
                NavigationLink {
                    StartScreen()
                } label: {
                    Label("Back to Main", systemImage: "house.fill")
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
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(.plain)
            }
                .padding()
            }
            .navigationTitle("Results")
            .navigationBarBackButtonHidden()
        }
        //  Feedback
        var feedbackText: String {
            let percentage = Double(score) / Double(results.count)
            
            switch percentage {
            case 0.8...:
                return "Extraordinary!"
            case 0.5...:
                return "Good job!"
            default:
                return "Keep working!"
            }
        }
    }
    
    


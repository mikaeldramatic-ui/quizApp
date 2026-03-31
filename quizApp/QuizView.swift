//
//  QuizView.swift
//  quizApp
//
//  Created by Mikael Engvall on 2026-03-29.
//
 
import SwiftUI
 
struct QuizView: View {
    
    @State private var questions: [QuizQuestion] = []
    init() {
        _questions = State(initialValue: Array (quizQuestions.shuffled().prefix(10)))
    }
    // Array of quiz-related emojis for background
    private let emojis = ["🎯", "🎮", "🎲", "🎪", "🎨", "🎭", "🎬", "🎤", "🎧", "🎸",
                          "🎹", "🎺", "🎻", "🎼", "🎵", "🎶", "🏆", "🥇", "🥈", "🥉",
                          "💯", "✨", "⭐️", "🌟", "💫", "🔥", "🎉", "🎊", "🎈", "🎁"]
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var showQuitAlert = false
    //Väntar på Jaimes resultatVy
    //@State private var goToResultView = false
    @State private var answeredQuestions: [(QuizQuestion, Bool)] = []
    @State private var showAnswerAlert = false
    
    var body: some View {
        NavigationStack {
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
                //UI quiz
                VStack(spacing: 30) {
                    Spacer()
                    Text("Question \(currentQuestionIndex + 1) / \(questions.count)")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(questions[currentQuestionIndex].emojis)
                        .font(.system(size: 100))
                        .padding(.bottom, 20)
                    TextField("Write answer...", text: $userAnswer)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .frame(height: 80)
                    //Spacer()
                    
                    VStack(spacing: 15) {
                        Button {
                            if userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                showAnswerAlert = true
                            } else {
                                checkAnswer()
                                nextQuestion()
                            }
                        } label: {
                            Label("Next", systemImage: "arrow.right.circle.fill")
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
                        
                        Button {
                            nextQuestion()
                        } label: {
                            Label("Skip", systemImage: "forward.fill")
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
                        
                        Button("Cancel") {
                            showQuitAlert = true
                        }
                        .font(.headline)
                        .foregroundStyle(.red)
                        .padding(.top, 10)
                    }
                    Spacer()
                }
                .padding()
            }
            .alert("Are you sure you want to quit?", isPresented: $showQuitAlert) {
                Button("Yes", role: .destructive) {
                    endQuiz()
                }
                Button("No", role: .cancel) { }
            }
            .alert("Please write an answer", isPresented: $showAnswerAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Enter an answer before pressing Next, or press Skip.")
            }
            
            //Väntar på Jaime
            //.navigationDestination(isPresented: //$goToResultView){
                //ResultView(score: score,
            //results: answeredQuestions
            //)
            //}
        }
        
    }
        func checkAnswer() {
            let question = questions[currentQuestionIndex]
            
            let answer = userAnswer
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
            
            let isCorrect =
            answer == question.correctAnswer.lowercased() ||
            question.alternateAnswers.contains { $0.lowercased() == answer }
            
            if isCorrect{
                score += 1
            }
            answeredQuestions.append((question, isCorrect))
        }
        func nextQuestion () {
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
                userAnswer = ""
            } else {
                //Väntar på Jaime
                //goToResultView = true
            }
        }
        func endQuiz() {
            //goToResultView = true
        }
    
    }


#Preview {
    QuizView()
}

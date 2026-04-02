//
//  ResultView.swift
//  quizApp
//
//  Created by Jaime Lavalle on 4/1/26.
//
 
import SwiftUI
 
struct ResultView: View {
    let score: Int
    let results: [(QuizQuestion, Bool)]
    var body: some View {
        VStack(spacing: 20) {
            //  Score
            Text("Your Score")
                .font(.title)
            Text("\(score) / \(results.count)")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.green)
            //  Feedback
            Text(feedbackText)
                .font(.title2)
            Divider()
            //  List with answer
            List(results, id: \.0.id) { item in
                let question = item.0
                let isCorrect = item.1
                HStack {
                    Text(question.emojis)
                    Spacer()
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(isCorrect ? .green : .red)
                }
            }
            //  Play again
            NavigationLink("Play Again") {
                QuizView()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Results")
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



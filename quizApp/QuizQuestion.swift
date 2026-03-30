import Foundation

struct QuizQuestion: Identifiable {
    let id = UUID()
    let emojis: String
    let correctAnswer: String
    let alternateAnswers: [String]
    let category: QuizCategory
}

enum QuizCategory: String {
    case film = "Film"
    case music = "Music"
}

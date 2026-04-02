import Foundation

struct QuizQuestion: Identifiable {
    let id = UUID()
    let emojis: String
    let correctAnswer: String
    let alternateAnswers: [String]
    let category: QuizCategory
}

enum QuizCategory: String {
    case film
    case music
    
    var localizedName: String {
        switch self {
        case .film:
            return String(localized: "category_film")
        case .music:
            return String(localized: "category_music")
        }
    }
}

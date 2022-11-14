//
//  Question.swift
//  Quiz
//
//  Created by MacBook Air 13 on 13.11.2022.
//

import Foundation

struct Question {
    let title: String
    let responceType: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐕"
    case cat = "🐈"
    case rabbit = "🐇"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Дружелюбный волк на минималках"
        case .cat:
            return "Домашняя пародия на льва, одиночка по жизни"
        case .rabbit:
            return "Трусливый травоед"
        case .turtle:
            return "Толстокожий тормоз от природы"
        }
    }
}

extension Question {
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Что вы едите?",
                responceType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба, свежая.", animal: .cat),
                    Answer(title: "Морковка, и много!", animal: .rabbit),
                    Answer(title: "Ем раз в неделю", animal: .turtle)
                ]
            ),
            
            Question(
                title: "Что вам больше нравится?",
                responceType: .multiple,
                answers: [
                    Answer(title: "Беситься", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Прыгать", animal: .rabbit),
                    Answer(title: "Ничего не делать", animal: .turtle)
                ]
            ),
            Question(
                title: "Как вы относитесь к поездке на машине",
                responceType: .ranged,
                answers: [
                    Answer(title: "Отлично", animal: .dog),
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "А что это?", animal: .rabbit),
                    Answer(title: "Индиферентно", animal: .turtle)
                ]
            )
        ]
    }
}

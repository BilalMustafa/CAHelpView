//
//  Model.swift
//  CAHelpView
//
//  Created by Bilal Mustafa on 5/8/20.
//  Copyright © 2020 Content Arcade. All rights reserved.
//

import Foundation

struct Help {
    var sections : [Section] = []
}

struct Section {
    var key: String = ""
    var questions: [Question] = []
    init(key: String) {
        self.key = key
    }
}

struct Question {
    var questionKey: String = ""
    var questionDictionary: [String: [String]] = [:]
}


extension Help {
    init(json: [String: Any]) throws {
        for (key, value) in json {
            var section = Section(key: key)
            guard let sectionArray = value as? Array<Any> else {return}
            for infoObjects in sectionArray {
                guard let infoObjs = infoObjects as? [String: [String]] else {return}
                for (key, value) in infoObjs {
                    var question = Question()
                    question.questionKey = key
                    question.questionDictionary = [key: value]
                    section.questions.append(question)
                }
            }
            self.sections.append(section)
        }
    }
}







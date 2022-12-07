//
//  NYCSchoolM.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation

struct NYCSchoolM: Codable {
    let dbn: String
    let schoolName: String
    let overviewParagraph: String?
    var satInfo: SchoolSATM?
    
    enum CodingKeys: String, CodingKey {
        case dbn, satInfo
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
    }
}

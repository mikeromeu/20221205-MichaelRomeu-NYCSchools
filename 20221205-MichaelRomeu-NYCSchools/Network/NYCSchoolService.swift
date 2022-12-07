//
//  NYCSchoolService.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation

enum NYCSchoolServiceError: Error {
    case invalidURL
    case missingData
}

protocol NYCSchoolServiceable {
    func getSchoolsData() async throws -> [NYCSchoolM]
    func getSchoolSATData(_ dbn: String) async throws -> SchoolSATM?
}

struct NYCSchoolService: NYCSchoolServiceable {
    
    func getSchoolsData() async throws -> [NYCSchoolM] {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            throw NYCSchoolServiceError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode([NYCSchoolM].self, from: data)
        print("response: \(response)")
        return response
    }
    
    func getSchoolSATData(_ dbn: String) async throws -> SchoolSATM? {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else {
            throw NYCSchoolServiceError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode([SchoolSATM].self, from: data)
        print("response: \(response)")
        return response.first
    }
}


//
//  SchoolListViewModel.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation


class SchoolListViewModel {
    
    let serviceManager: NYCSchoolServiceable
    
    @Published private(set) var nycSchools: [NYCSchoolM] = []
    
    init(serviceManager: NYCSchoolServiceable = NYCSchoolService()) {
        self.serviceManager = serviceManager
    }
    
    func getSchools() {
        Task {
            do {
                self.nycSchools = try await serviceManager.getSchoolsData()
            }catch {
                self.nycSchools = []
            }
        }
    }
    
}

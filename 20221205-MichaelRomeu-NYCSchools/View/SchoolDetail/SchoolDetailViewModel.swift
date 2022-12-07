//
//  SchoolDetailViewModel.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation

class SchoolDetailViewModel {
    let serviceManager: NYCSchoolServiceable
    
    let nycSchool: NYCSchoolM
    
    @Published private(set) var nycSchoolStats: SchoolSATM?

    init(serviceManager: NYCSchoolServiceable = NYCSchoolService(), nycSchool: NYCSchoolM) {
        self.serviceManager = serviceManager
        self.nycSchool = nycSchool
    }
    
    func getSchoolDetails() {
        Task {
            do {
                self.nycSchoolStats =  try await serviceManager.getSchoolSATData(nycSchool.dbn)
            }catch {
                self.nycSchoolStats = nil
            }
        }
    }
}

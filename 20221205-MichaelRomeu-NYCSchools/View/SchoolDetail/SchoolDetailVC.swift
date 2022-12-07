//
//  SchoolDetailVC.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation
import UIKit
import Combine

final class SchoolDetailVC: UIViewController {
    
    @IBOutlet weak var testTakers: UILabel!
    @IBOutlet weak var SATMath: UILabel!
    @IBOutlet weak var SATReading: UILabel!
    @IBOutlet weak var SATWriting: UILabel!
    var viewModel: SchoolDetailViewModel?
    private var disposeBag: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewModel?.getSchoolDetails()
        disposeBag = viewModel?.$nycSchoolStats.sink { _ in
            DispatchQueue.main.async {
                self.refreshUI()
            }
        }
    }
    
    func refreshUI() {
        guard let states = viewModel?.nycSchoolStats else { return }
        self.testTakers.text = "Number Of Sat Test Takers :  \(states.numOfSatTestTakers)"
        self.SATMath.text = "SAT Math Average Scores :  \(states.satMathAvgScore)"
        self.SATReading.text = "SAT Reading Average Scores :  \(states.satCriticalReadingAvgScore)"
        self.SATWriting.text = "SAT Writing Average Scores :  \(states.satWritingAvgScore)"
        
    }
}


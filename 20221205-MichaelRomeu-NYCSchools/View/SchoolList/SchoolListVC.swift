//
//  SchoolListVC.swift
//  20221205-MichaelRomeu-NYCSchools
//
//  Created by Michael Romeu  on 12/5/22.
//

import Foundation
import UIKit
import Combine

final class SchoolListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SchoolListViewModel()
    private var disposeBag: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.getSchools()
        
        disposeBag = viewModel.$nycSchools.sink { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension  SchoolListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nycSchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let nycSchool = viewModel.nycSchools[indexPath.row]
        cell.textLabel?.text = nycSchool.schoolName
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}

extension  SchoolListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nycSchool = viewModel.nycSchools[indexPath.row]
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        guard let schoolDetailVC = sb.instantiateViewController(withIdentifier: "SchoolDetailVC") as?  SchoolDetailVC else { return }
        
        schoolDetailVC.viewModel = SchoolDetailViewModel(nycSchool: nycSchool)
        
        self.navigationController?.pushViewController(schoolDetailVC, animated: true)
    }
}

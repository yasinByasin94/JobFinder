//
//  ViewController.swift
//  jopFinder
//
//  Created by Yasin on 3/5/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import UIKit

class JobList: BaseController{
    
    @IBOutlet weak var tableList: UITableView!
    var selectedUrl:String!
    
    private var _searchParameters:SearchParameters!
    
    var jobs = [Job]()
    var github = Github()
    var searchGov = SearchGov()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigationController()
        self._searchParameters = SearchController.parameters
        getJobs()
    }
    
    // get all jobj
    func getJobs() {
        if _searchParameters.provider == .github{
            getJobsFromGithub()
        }else if _searchParameters.provider == .searchGov{
            getJobsFromSearchGov()
        }
    }
    
    // get job from Github Api
    func getJobsFromGithub() {
        github.description = _searchParameters.title
        github.lat = _searchParameters.latitude
        github.long = _searchParameters.longitude
        
        github.get { (JobList , error) in
            if error! {
                self.alert(message: "Unexpected Error")
            }else{
                self.jobs = JobList!
                if self.jobs.isEmpty {
                    self.alert(message: "Can't find any jobs")
                    return
                }
                self.tableList.reloadData()
            }
            
        }
    }
    
    // get job from SearchGov Api
    func getJobsFromSearchGov() {
        searchGov.query = _searchParameters.title
        searchGov.lat = _searchParameters.latitude
        searchGov.long = _searchParameters.longitude
        
        searchGov.get { (JobList , error) in
            if error! {
                self.alert(message: "Unexpected Error")
            }else{
                self.jobs = JobList!
                if self.jobs.isEmpty {
                    self.alert(message: "Can't find any jobs")
                    return
                }
                self.tableList.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailsSegue {
            (segue.destination as! DetailsController).url = selectedUrl
        }
    }

}

extension JobList:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:JobCell = tableView.dequeueReusableCell(withIdentifier: Constants.jobCell) as! JobCell
        cell.setup(job: jobs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if jobs[indexPath.row].companyUrl != nil {
            selectedUrl = jobs[indexPath.row].companyUrl!
        }
        performSegue(withIdentifier: Constants.detailsSegue, sender: self)
    }
}


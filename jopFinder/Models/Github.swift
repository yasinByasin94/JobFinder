//
//  Github.swift
//  jopFinder
//
//  Created by Yasin on 3/5/19.
//  Copyright © 2019 Yasin. All rights reserved.
//
import Foundation

class Github:Api{
    
    var description:String!
    var lat:Double?
    var long:Double?
    // methode get to get data from githup Api's
    func get(done: @escaping (_ jobs: [Job]? , _ error: Bool?) -> ()) {
        //set networking header as Github URL
        Api.baseURL = Constants.githubURL
        let latString = self.lat == nil ? "" : "\(self.lat!)"
        let longString = self.long == nil ? "" : "\(self.long!)"
        Github.networking.get("/positions.json?search=\(self.description!)&lat=\(latString)&long=\(longString)") { (result) in
            var jobs = [Job]()
            switch result{
            case .success(let response):
                let json = response.arrayBody
                for jobRow in json {
                    let job = Job()
                    job.companyLogo = jobRow["company_logo"] as? String ?? ""
                    job.companyName = jobRow["company"] as? String ?? ""
                    job.jobTitle = jobRow["title"] as? String ?? ""
                    job.location = jobRow["location"] as? String ?? ""
                    job.postDate = (jobRow["created_at"] as? String ?? "").convertDateFormatter(format: Constants.githupDateFormated)
                    job.companyUrl = jobRow["company_url"] as? String ?? ""
                    jobs.append(job)
                }
                done(jobs , false)
            case .failure(let response):
                done(nil , true)
                print(response.statusCode)
            }
        }
    }
}

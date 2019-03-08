//
//  SearchGov.swift
//  jopFinder
//
//  Created by Yasin on 3/6/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import Foundation
class SearchGov:Api{
    
    var query:String!
    var lat:Double!
    var long:Double!
    var page:Int!
    
    // methode get to get data from SearchGov Api's
    func get(done: @escaping (_ jobs: [Job]? , _ error:Bool?) -> ()) {
        //set networking header as Github URL
        Api.baseURL = Constants.searchGovURL
        let latString = self.lat == nil ? "" : "\(self.lat!)"
        let longString = self.long == nil ? "" : "\(self.long!)"
        SearchGov.networking.get("/jobs/search.json?query=\(self.query!)&lat_lon=\(latString),\(longString)") { (result) in
            var jobs = [Job]()
            switch result{
            case .success(let response):
                let json = response.arrayBody
                for jobRow in json {
                    let job = Job()
                    job.companyLogo = jobRow["company_logo"] as? String ?? ""
                    job.companyName = jobRow["organization_name"] as? String ?? ""
                    job.jobTitle = jobRow["position_title"] as? String ?? ""
                    job.location = (jobRow["locations"] as? [String] ?? []).first
                    job.postDate = (jobRow["start_date"] as? String ?? "").convertDateFormatter(format: Constants.searchGovDateFormated)
                    job.companyUrl = jobRow["url"] as? String ?? ""
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

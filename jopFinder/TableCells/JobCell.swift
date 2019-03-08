//
//  JobCell.swift
//  jopFinder
//
//  Created by Yasin on 3/6/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import UIKit

class JobCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var contener: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(job:Job) {
       
        name.text = job.companyName
        title.text = job.jobTitle
        Location.text = job.location
        createdDate.text = job.postDate
        if job.companyLogo.isEmpty{
            logo.image = #imageLiteral(resourceName: "default-logo")
        }else{
            logo.loadImage(urlString: job.companyLogo)
        }
        
    }
}

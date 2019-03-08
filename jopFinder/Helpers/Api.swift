//
//  Api.swift
//  jopFinder
//
//  Created by Yasin on 3/5/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import Foundation
import Networking

class Api {
    static private var _networking: Networking? = nil
    static var baseURL:String!
    static var networking: Networking {
        get {
            _networking = Networking(baseURL:baseURL!)
            return _networking!
        }
    }
}



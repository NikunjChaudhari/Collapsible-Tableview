//
//  Datamodel.swift
//  CollapsableTableview
//
//  Created by macos on 28/07/20.
//  Copyright © 2020 macos. All rights reserved.
//

import Foundation
class Datamodel
{
    var headerName = ""
    var subType = [String]()
    var isExpandable = false
    
    init(headerName:String,subType:[String],isExpandable:Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}

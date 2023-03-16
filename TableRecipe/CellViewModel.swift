//
//  CellViewModel.swift
//  TableRecipe
//
//  Created by Prof. Dr. Nunkesser, Robin on 16.03.23.
//  Copyright © 2023 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class CellViewModel : NSObject {
    
    @objc dynamic let title : String
    let subtitle : String
    
    init(title : String, subtitle : String) {
        self.title = title
        self.subtitle = subtitle
    }
    
}

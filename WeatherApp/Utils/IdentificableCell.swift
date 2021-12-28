//
//  IdentificableCell.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 28/12/21.
//

import UIKit

protocol IdentificableCell {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension IdentificableCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}

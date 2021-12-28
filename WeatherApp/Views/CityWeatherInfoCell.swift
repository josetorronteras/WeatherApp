//
//  CityWeatherInfoCell.swift
//  WeatherApp
//
//  Created by Jose Torronteras on 28/12/21.
//

import UIKit

struct CityWeatherInfoCellData {
    var title: String
    var icon: String
    var value: String
}

class CityWeatherInfoCell: UICollectionViewCell, IdentificableCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!

    // MARK: - Life Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Variables
    var data: CityWeatherInfoCellData? {
        didSet {
            guard let title = self.data?.title,
                  let icon = self.data?.icon,
                  let value = self.data?.value else { return }
            
            self.titleLabel.text = title.capitalizingFirstLetter()
            self.valueLabel.text = value
            self.iconImageView.image = UIImage(systemName: icon)
        }
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        self.layer.cornerRadius = CGFloat(30.0)
    }
}

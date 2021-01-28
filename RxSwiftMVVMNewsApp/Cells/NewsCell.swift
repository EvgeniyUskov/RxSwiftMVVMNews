//
//  NewsCell.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup() {
        setupCellUI()
    }

    private func setupCellUI() {
        titleLabel.textColor = Constants.textColor
        descriptionLabel.textColor = Constants.textColor
    }
}

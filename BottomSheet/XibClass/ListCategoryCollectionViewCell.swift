//
//  ListCategoryCollectionViewCell.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 05/04/22.
//

import UIKit

class ListCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var introLbl: UILabel!
    @IBOutlet weak var calenderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        introLbl.sizeToFit()
        introLbl.preferredMaxLayoutWidth  = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        layoutAttributes.bounds.size.height = introLbl.frame.height + 10
        return layoutAttributes
    }
}

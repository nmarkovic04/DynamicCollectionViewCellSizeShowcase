//
//  BackingCellLayouter.swift
//  BackingCellLayouterApp
//
//  Created by Nikola Markovic on 3/17/16.
//  Copyright © 2016 XD. All rights reserved.
//

import UIKit

class BackingCellLayouter<T: UICollectionViewCell>: NSObject {

    let cell: T
    let setupCallback: (cell: T, indexPath: NSIndexPath) -> Void
    
    init(cell: T, setupCallback: (cell: T, indexPath: NSIndexPath) -> Void){
        self.cell = cell
        self.setupCallback = setupCallback
    }
    
    func sizeForCellAtIndexPath(indexPath: NSIndexPath) -> CGSize{
        setupCallback(cell: self.cell, indexPath: indexPath)

        self.updateCellLayout()
        
        let size = self.cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize) 
        return size
    }
    
    func updateCellLayout(){
        self.cell.layoutIfNeeded()
        self.cell.contentView.layoutIfNeeded()
    }
    
    
}

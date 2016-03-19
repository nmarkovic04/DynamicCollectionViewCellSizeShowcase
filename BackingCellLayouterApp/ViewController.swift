//
//  ViewController.swift
//  BackingCellLayouterApp
//
//  Created by Nikola Markovic on 3/17/16.
//  Copyright © 2016 XD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var layouter: BackingCellLayouter<DynamicCell>!
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [ "iOS", "A long oneeeeeeeeeeeeeeee", "Twee twee", "Swift", "Dynamic collectionView cells", "sboJ evetS", "hehe", "a", "BIG TEXT"]
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = true
        self.edgesForExtendedLayout = .None
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let cellNib = UINib(nibName: "DynamicCell", bundle: nil)
        self.collectionView.registerNib(cellNib, forCellWithReuseIdentifier: cellID)
        
        self.collectionView.backgroundColor = UIColor.whiteColor()
        // init the layouter
        let cell = cellNib.instantiateWithOwner(nil, options: nil).first as! DynamicCell
        self.layouter = BackingCellLayouter<DynamicCell>(cell: cell, setupCallback: { [weak self] (cell: DynamicCell, indexPath: NSIndexPath) in
            self?.setupCell(cell, indexPath: indexPath)
        })
    }
    
    // MARK: CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! DynamicCell
        self.setupCell(cell, indexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return self.layouter.sizeForCellAtIndexPath(indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    // We encapsulate the cell setup so we can reuse it when we actually dequeue the cell to be displayed as well as 
    // when we're laying the cell out in the background
    func setupCell(cell: DynamicCell, indexPath: NSIndexPath){
        cell.labelText.text = self.items[indexPath.row]
    }

}


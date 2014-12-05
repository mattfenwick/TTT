//
//  TTTViewController.swift
//  TTT
//
//  Created by MattF on 12/5/14.
//  Copyright (c) 2014 MattF. All rights reserved.
//

import UIKit

class TTTViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView : UICollectionView!
    
    // constructors
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // don't want rotations
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    // what about supportedInterfaceOrientations
    //   and preferredInterfaceOrientationForPresentation ?
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "TTTCell", bundle: nil)
        self.collectionView.registerNib(cellNib, forCellWithReuseIdentifier: "TTTCell")

        let width = UIScreen.mainScreen().bounds.width
        let height = UIScreen.mainScreen().bounds.height
        let length = (width < height) ? width : height
        self.setCellSizeAndSpacing(length)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCellSizeAndSpacing(length: CGFloat) {
        let edge : CGFloat = 10
        let middle : CGFloat = 20
        let space : CGFloat = length - 2 * edge - 2 * middle
        let cellLength = space / 3 // what about rounding?
        let layout = self.collectionView.collectionViewLayout as UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(cellLength, cellLength)
        // TODO these don't need to be re-set each time
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsetsMake(30, 10, 0, 10)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator:
            UIViewControllerTransitionCoordinator) {
        let length = (size.width < size.height) ? size.width : size.height
        self.setCellSizeAndSpacing(length)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // collectionview data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : TTTCell = collectionView.dequeueReusableCellWithReuseIdentifier("TTTCell", forIndexPath: indexPath) as TTTCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9;
    }
    
    // collectionview delegate

}

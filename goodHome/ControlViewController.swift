//
//  ControlViewController.swift
//  goodHome
//
//  Created by 羽田 健太郎 on 2014/09/20.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//
// Accessory の表示
import UIKit


class ControlViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,HMHomeManagerDelegate,HMAccessoryBrowserDelegate{

    @IBOutlet var collectionView:UICollectionView!
    var accessories = [HMAccessory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyHomeManager.sharedInstance
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"setMyHome", name: NOTIF_MYHOME_UPDATE, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.collectionView.registerClass(AccessoryCollectionViewCell.self, forCellWithReuseIdentifier: ACCESSORY_IDENTIFER_NAME)
        var layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var cell_width:CGFloat = self.collectionView.frame.size.width / 2 - 4
        var cell_height:CGFloat = cell_width
        print(cell_width)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cell_width, height: cell_height)
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 5;
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO - reload collection from set accessory
    func setMyHome()
    {
        self.accessories = MyHomeManager.sharedInstance.primaryHome.accessories as [HMAccessory]
    }

    
    // - collection view delegate
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(ACCESSORY_IDENTIFER_NAME, forIndexPath: indexPath) as AccessoryCollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }


    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    
    
}


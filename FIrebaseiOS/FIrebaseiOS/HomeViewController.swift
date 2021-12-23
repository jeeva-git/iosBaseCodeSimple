//
//  HomeViewController.swift
//  FirebaseSetup
//
//  Created by Infosys on 17/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnsignIn:UIButton!
    @IBOutlet weak var btnProfile:UIButton!
    @IBOutlet weak var collectionviewHighlights:UICollectionView!
    @IBOutlet weak var tblItems:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblItems.delegate = self
        self.tblItems.dataSource = self
        self.tblItems!.register(UINib.init(nibName: "ItemDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        self.collectionviewHighlights.dataSource = self
        self.collectionviewHighlights.delegate = self
        self.collectionviewHighlights!.register(UINib.init(nibName: "HLCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HLCell")
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 300, height: 200)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.scrollDirection = .horizontal
        self.collectionviewHighlights.collectionViewLayout = flowLayout

//        self.tblItems!.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
        // Do any additional setup after loading the view.
        
        self.btnProfile.setTitle("", for: .normal)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemDetailsTableViewCell
        cell.lbl.text = "Hello"
        return cell
    }
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let highlightsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HLCell", for: indexPath) as! HLCollectionViewCell
        highlightsCell.lblHL.text = "Welcome"
        highlightsCell.layer.cornerRadius = 10.0
        return highlightsCell
    }
    
    
}

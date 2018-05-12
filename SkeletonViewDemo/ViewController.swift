//
//  ViewController.swift
//  SkeletonViewDemo
//
//  Created by 曹冲 on 2018/5/2.
//  Copyright © 2018年 曹冲. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    var tableView = UITableView()
    let cellID = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.showAnimatedSkeleton()
//        view.showAnimatedSkeleton()
//        view.showGradientSkeleton()
//        view.showAnimatedGradientSkeleton()
    }
    
    func createTableView() {
        self.tableView = UITableView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(self.tableView)
        self.tableView.isSkeletonable = true
        self.tableView.estimatedRowHeight = 120
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: "SkeletonCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SkeletonCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.hideSkeleton()
    }
    
}


extension ViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdenfierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return cellID
    }
    
}

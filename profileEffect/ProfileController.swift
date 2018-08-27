//
//  ProfileController.swift
//  profileEffect
//
//  Created by Luis Castillo on 26/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileController: UITableViewController {

    private var comment:[Comments] = [Comments]()
    
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    private let Headerheight : CGFloat = 420
    private let Headercut : CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comment.append( Comments(user: "Luis Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Jim Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Rott Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Luis Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Jim Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Rott Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Luis Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Jim Castillo", comment: "este es un comentario para esta prueba del perfil"))
        comment.append( Comments(user: "Rott Castillo", comment: "este es un comentario para esta prueba del perfil"))
        self.UpdateView()
    }
    
    
    func UpdateView() {
        tableView.backgroundColor = UIColor.white
        Headerview = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.addSubview(Headerview)
        
        NewHeaderLayer = CAShapeLayer()
        NewHeaderLayer.fillColor = UIColor.black.cgColor
        Headerview.layer.mask = NewHeaderLayer
        
        let newheight = Headerheight - Headercut / 2
        tableView.contentInset = UIEdgeInsets(top: newheight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newheight)
        
        self.Setupnewview()
    }
    
    func Setupnewview() {
        let newheight = Headerheight - Headercut / 2
        var getheaderframe = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: Headerheight)
        if tableView.contentOffset.y < newheight
        {
            getheaderframe.origin.y = tableView.contentOffset.y
            getheaderframe.size.height = -tableView.contentOffset.y + Headercut / 2
        }
        
        Headerview.frame = getheaderframe
        let cutdirection = UIBezierPath()
        cutdirection.move(to: CGPoint(x: 0, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: getheaderframe.height))
        cutdirection.addLine(to: CGPoint(x: 0, y: getheaderframe.height - Headercut))
        NewHeaderLayer.path = cutdirection.cgPath
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.Setupnewview()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let data = self.comment[indexPath.row]
        cell.txtUserName.text = data.user
        cell.txtComment.text = data.comment
        return cell
    }

}

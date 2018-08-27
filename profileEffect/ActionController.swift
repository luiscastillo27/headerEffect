//
//  ActionController.swift
//  profileEffect
//
//  Created by Luis Castillo on 26/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ActionController: UITableViewController {

    private var comment:[Comments] = [Comments]()
    
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    private let Headerheight : CGFloat = 300
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
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
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
        var offset = scrollView.contentOffset.y / 150
        if offset > -0.5{
            UIView.animate(withDuration: 0.2, animations: {
                offset = 1
                let color = UIColor.init(red: 1, green: 1, blue: 1, alpha: offset)
                let navigationcolor = UIColor.init(hue: 0, saturation: offset, brightness: 1, alpha: 1)
                
                self.navigationController?.navigationBar.tintColor = navigationcolor
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navigationcolor]
                self.navigationController?.navigationBar.barStyle = .default
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                let color = UIColor.init(red: 1, green: 1, blue: 1, alpha: offset)
                self.navigationController?.navigationBar.tintColor = UIColor.white
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
                self.navigationController?.navigationBar.barStyle = .black
            })
        }
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

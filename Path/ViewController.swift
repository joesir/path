//
//  ViewController.swift
//  Path
//
//  Created by 蒋志礼 on 2016/11/26.
//  Copyright © 2016年 higgses. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class PathView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isMultipleTouchEnabled = false
    }
    
    var  path = UIBezierPath()
    var  path1 = UIBezierPath()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dice1 = arc4random_uniform(10) + 1;
        path.lineWidth = 0.5;
        path1.lineWidth = 0.5;

        path.lineCapStyle = .round
        path1.lineCapStyle = .round
        
        let p = touches.first?.location(in: self)
        
        path.move(to: p!)
        path1.move(to: (CGPoint(x: (p?.x)!, y: (p?.y)! + CGFloat(dice1))))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var dice1 = arc4random_uniform(10) + 1;
        dice1 = 3;
        let p = touches.first?.location(in: self)
        path.addLine(to: p!)
        
        let p1 = CGPoint(x: (p?.x)! + CGFloat(dice1), y: (p?.y)! + CGFloat(dice1))
        path1.addLine(to: p1)
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dice1 = arc4random_uniform(10) + 1;
        let p = touches.first?.location(in: self)
        path.addLine(to: p!)
        path1.addLine(to: (CGPoint(x: (p?.x)!, y: (p?.y)! + CGFloat(dice1))))

//        pathFinnal.close()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
//        pathFinnal.stroke()
//        pathFinnal.fill()
        path1.stroke()
        path.stroke()
    }
}

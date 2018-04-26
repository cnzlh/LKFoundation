//
//  ViewController.swift
//  LKFoundation
//
//  Created by zhulinhua on 04/12/2018.
//  Copyright (c) 2018 zhulinhua. All rights reserved.
//

import UIKit
import LKFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "abcde"
        print(str.array)
        
        let num = "123"
        print(num.character(at: 0))
        print(num.substring(with: 0..<2))
        print(num.reversed(preserveFormat: true))
        print(num.appendingPathComponent("d"))
        
        var image = UIColor.gray.toImage()
        image = image.scale(toSize: CGSize(width: 200, height: 200))
        image = image.crop(in: CGRect(x: 0, y: 0, width: 100, height: 100))
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


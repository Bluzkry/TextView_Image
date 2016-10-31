//
//  ViewController.swift
//  Change Picture
//
//  Created by Alexander Zou on 10/30/16.
//  Copyright © 2016 Alexander Zou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let imageView = UIImageView(image: UIImage(named: "Image"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attach = NSTextAttachment()
        attach.image = imageView.image
        let attachString = NSAttributedString(attachment: attach)
        let currentText = textView.attributedText
        var mutable = NSAttributedString(attributedString: currentText!)
        textView.textStorage.insert(attachString, at: 1000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        let imagePath = UIBezierPath(rect:imageView.frame)
        textView.textContainer.exclusionPaths = [imagePath]

    }

}

////
////  ViewController.swift
////  Change Picture
////
////  Created by Alexander Zou on 10/30/16.
////  Copyright © 2016 Alexander Zou. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var textView: UITextView!
//    let imageView = UIImageView(image: UIImage(named: "Image"))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
//        view.addSubview(imageView)
//        let convertedPath = view.layer.convert(imageView.frame, to: textView.layer)
//        let imagePath = UIBezierPath(rect:convertedPath)
//        textView.textContainer.exclusionPaths = []
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//    }
//    
//}
//

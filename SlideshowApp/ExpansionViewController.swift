//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 溝越啓介 on 2018/12/05.
//  Copyright © 2018 Keisuke Mizogoshi. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var expimageview: UIImageView!
    @IBOutlet weak var backbutton: UIButton!
    
    var image_name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        expimageview.image = UIImage(named: image_name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 溝越啓介 on 2018/12/05.
//  Copyright © 2018 Keisuke Mizogoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stdimageview: UIImageView!
    @IBOutlet weak var gobutton: UIButton!
    @IBOutlet weak var returnbutton: UIButton!
    @IBOutlet weak var playstopbutton: UIButton!
    
    var timer:Timer!
    var timer_sec: Float = 0.0
    var image_no:Int = 0
    
    let image_group = [
        "image01.jpg",
        "image02.jpg",
        "image03.jpg",
        ]
    
    //  進むボタン
    @IBAction func gobutton(_ sender: Any) {
        image_no += 1
        display()
    }
    //  戻るボタン
    @IBAction func returnbutton(_ sender: Any) {
        image_no -= 1
        display()
    }
    //  再生／停止ボタン
    @IBAction func playstopbutton(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            playstopbutton.setTitle("再生", for: .normal)
            gobutton.isEnabled = true
            returnbutton.isEnabled = true
        } else {
            playstopbutton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true)
            gobutton.isEnabled = false
            returnbutton.isEnabled = false
        }
    }
    //  表示画像をタップした時
    @IBAction func tapgesture(_ sender: Any) {
 //       performSegue(withIdentifier: "result", sender: nil)
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            playstopbutton.setTitle("再生", for: .normal)
            gobutton.isEnabled = true
            returnbutton.isEnabled = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display()     //  初期画像表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  イメージファイルを画面に表示
    func display() {
        if image_no < 0 {
            image_no = 2
        } else if image_no > 2 {
                image_no = 0
        }
        stdimageview.image = UIImage(named: image_group[image_no])
    }
    //  タイマー起動で次画像を表示
    @objc func slideshow(_ timer: Timer) {
        image_no += 1
        display()
    }
    
    //  拡大画面へ遷移する直前に、現在の画像ファイル名を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のexpansionViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        // 遷移先のexpansiontViewControllerで宣言しているimage_nameに画像ファイル名を代入して渡す
        expansionViewController.image_name = image_group[image_no]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}


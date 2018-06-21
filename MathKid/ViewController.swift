//
//  ViewController.swift
//  MathKid
//
//  Created by Le Quy Nam on 2/8/18.
//  Copyright © 2018 LeQuyNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_num1: UILabel!
    @IBOutlet weak var lbl_num2: UILabel!
    @IBOutlet weak var btn_num1: UIButton!
    @IBOutlet weak var btn_num2: UIButton!
    @IBOutlet weak var btn_num3: UIButton!
    @IBOutlet weak var lbl_score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNumber()
    }
    @IBAction func btn_action(_ sender: Any) {
        let number1 = btn_num1.titleLabel!.text!
        setNumber()
    }
    @IBAction func btn_action2(_ sender: Any) {
        print(btn_num2.titleLabel!.text!)
        setNumber()
    }
    @IBAction func btn_action3(_ sender: Any) {
        print(btn_num3.titleLabel!.text!)
        setNumber()
    }
    
    // Tính tổng
    func sum(a:Int, b:Int) -> Int {
        return a + b
    }
    
    // Tạo số ngẫu nhiên cho phép toán
    func setNumber() {
        let number1:Int = Int(arc4random_uniform(4) + 1)
        let number2:Int = Int(arc4random_uniform(4) + 1)
        lbl_num1.text = String(number1)
        lbl_num2.text = String(number2)
        
        //Hiển thị kết quả
        setResult(result: sum(a: number1, b: number2))
    }
    
   // Tạo số ngẫu nhiên ở kết quả
    func setResult(result:Int) {
        let number1:Int = Int(arc4random_uniform(4) + 1)
        let number2:Int = Int(arc4random_uniform(4) + 1)
        let number3:Int = result
        
        var arrNum:[Int] = [number1, number2, number3]
        var newArray:[Int] = []
        //Cho result vào 1 trong 3 vị trí bất kỳ
        for _ in 0...2{
            let randomIndex = Int(arc4random_uniform(UInt32(arrNum.count)))
            let result = arrNum[randomIndex]; arrNum.remove(at: randomIndex)
            newArray.append(result)
        }
        //Kiểm tra sự trùng lặp 3 số ở kết quả
        let result1 = newArray[0]; let result2 = newArray[1]; let result3 = newArray[2]
        if result3 == result1 || result3 == result2 || result1 == result2{
            setResult(result: result)
        }
        else {
            btn_num1.setTitle(String(result1), for: .normal)
            btn_num2.setTitle(String(result2), for: .normal)
            btn_num3.setTitle(String(result3), for: .normal)
        }
        
    }
    
    //IN ra số điểm nếu trả lời đúng
    
}



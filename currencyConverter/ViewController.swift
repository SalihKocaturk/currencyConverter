//
//  ViewController.swift
//  currencyConverter
//
//  Created by salih kocatürk on 8.06.2023.
//

import UIKit

class ViewController: UIViewController {
    var selectedMNY = ""
   var oldValueArray = [Double](repeating: 0.1, count: 6)
    var a:Double = 0.0
    var calculateButton = 0
    var b:Double = 0.0
    var c:Double = 0.0
    var d:Double = 0.0
    var e:Double = 0.0
    var f:Double = 0.0
    var v1:Double = 0.0
    @IBOutlet weak var enterValue: UITextField!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cadlabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var trylabel: UILabel!
    var testButton = 0
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var eurLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }

    @IBAction func getRates(_ sender: Any) {
        //1) request& session //internet adresine ulaşma ve istek yollama
        //2) Response & Data // yolladığımız isteği alma
        //3)Parsing& json serialization //datayı işlemek
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                
                                if let cad = newrates["CAD"] {
                                                                    self.cadlabel.text = "CAD: \(cad)"
                                                                }
                                                                
                                if let chf = newrates["CHF"] {
                                                                    self.chfLabel.text = "CHF: \(chf)"
                                                                }
                                                                
                                if let gbp = newrates["GBP"] {
                                                                    self.gbpLabel.text = "GBP: \(gbp)"
                                                                }
                                                                
                                if let jpy = newrates["JPY"] {
                                                                    self.jpyLabel.text = "JPY: \(jpy)"
                                                                }
                                                                
                                if let usd = newrates["USD"] {
                                                                    self.usdLabel.text = "USD: \(usd)"
                                                                }
                                                                
                                if let turkish = newrates["TRY"] {
                                                                    self.trylabel.text = "TRY: \(turkish)"
                                                                }

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
      
        }
        task.resume()
    }
    
    @IBAction func Try(_ sender: Any) {
        if button1.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let turkish = newrates["TRY"] {
                                    self.f = 1
                                                                    self.trylabel.text = "TRY: \(1)"
                                    self.selectedMNY = "TRY"
                                    if let cad = newrates["CAD"] {
                                        self.a = cad
                                                                        self.cadlabel.text = "CAD: \(cad/turkish)"
                                                                    }
                                                                    
                                    if let chf = newrates["CHF"] {
                                        self.b = chf
                                                                        self.chfLabel.text = "CHF: \(chf/turkish)"
                                                                    }
                                                                    
                                    if let gbp = newrates["GBP"] {
                                        self.c = gbp
                                                                        self.gbpLabel.text = "GBP: \(gbp/turkish)"
                                                                    }
                                                                    
                                    if let jpy = newrates["JPY"] {
                                        self.d = jpy
                                                                        self.jpyLabel.text = "JPY: \(jpy/turkish)"
                                                                    }
                                                                    
                                    if let usd = newrates["USD"] {
                                        self.e = usd
                                                                        self.usdLabel.text = "USD: \(usd/turkish)"
                                                                    }
                                                                }
                               
                                                                
                               

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
     
        }
        task.resume()
    }
    
    @IBAction func USD(_ sender: Any) {
        if button2.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let usd = newrates["USD"] {
                                    self.selectedMNY = "USD"
                                    self.e = 1

                                                                    self.usdLabel.text = "USD: 1"
                                    if let cad = newrates["CAD"] {
                                        self.a = cad
                                                                        self.cadlabel.text = "CAD: \(cad/usd)"
                                                                    }
                                                                    
                                    if let chf = newrates["CHF"] {
                                        self.b = chf
                                                                        self.chfLabel.text = "CHF: \(chf/usd)"
                                                                    }
                                                                    
                                    if let gbp = newrates["GBP"] {
                                        self.c = gbp
                                                                        self.gbpLabel.text = "GBP: \(gbp/usd)"
                                                                    }
                                                                    
                                    if let jpy = newrates["JPY"] {
                                        self.d = jpy
                                                                        self.jpyLabel.text = "JPY: \(jpy/usd)"
                                                                    }
                                                                    
                                  
                                                                    
                                    if let turkish = newrates["TRY"] {
                                                                        self.trylabel.text = "TRY: \(turkish/usd)"
                                        self.f = turkish
                                                                    }
                                                                }
                           

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
         
        }
        task.resume()
    }
    
    @IBAction func CAD(_ sender: Any) {
        if button3.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let cad = newrates["CAD"] {
                                    self.selectedMNY = "CAD"
                                    self.a = 1
                                                                    self.cadlabel.text = "CAD: 1"
                                    if let chf = newrates["CHF"] {
                                        self.b = chf
                                                                        self.chfLabel.text = "CHF: \(chf/cad)"
                                                                    }
                                                                    
                                    if let gbp = newrates["GBP"] {
                                        self.c = gbp
                                                                        self.gbpLabel.text = "GBP: \(gbp/cad)"
                                                                    }
                                                                    
                                    if let jpy = newrates["JPY"] {
                                        self.d = jpy
                                                                        self.jpyLabel.text = "JPY: \(jpy/cad)"
                                                                    }
                                                                    
                                    if let usd = newrates["USD"] {
                                        self.e = usd

                                                                        self.usdLabel.text = "USD: \(usd/cad)"
                                                                    }
                                                                    
                                    if let turkish = newrates["TRY"] {
                                                                        self.trylabel.text = "TRY: \(turkish/cad)"
                                        self.f = turkish
                                                                    }
                                                                }
                                                                
                              

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
               
                
            }
         
        }
        task.resume()
    }
    
    @IBAction func CHF(_ sender: Any) {
        if button4.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let chf = newrates["CHF"] {
                                    self.b = 1
                                    self.selectedMNY = "CHF"
                                                                    self.chfLabel.text = "CHF: 1 "
                                    if let cad = newrates["CAD"] {
                                        self.a = cad
                                                                        self.cadlabel.text = "CAD: \(cad/chf)"
                                                                    }
                                                                    
                                                                    
                                    if let gbp = newrates["GBP"] {
                                        self.c = gbp
                                                                        self.gbpLabel.text = "GBP: \(gbp/chf)"
                                                                    }
                                                                    
                                    if let jpy = newrates["JPY"] {
                                        self.d = jpy
                                                                        self.jpyLabel.text = "JPY: \(jpy/chf)"
                                                                    }
                                                                    
                                    if let usd = newrates["USD"] {
                                        self.e = usd

                                                                        self.usdLabel.text = "USD: \(usd/chf)"
                                                                    }
                                                                    
                                    if let turkish = newrates["TRY"] {
                                                                        self.trylabel.text = "TRY: \(turkish/chf)"
                                        self.f = turkish
                                                                    }
                                                                }

                              

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
          
            
            
        }
        task.resume()
    }
    
    @IBAction func GBP(_ sender: Any) {
        if button5.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let gbp = newrates["GBP"] {
                                    self.selectedMNY = "GBP"
                                    self.c = 1
                                                                    self.gbpLabel.text = "GBP: 1"
                                    if let cad = newrates["CAD"] {
                                        self.a = cad
                                                                        self.cadlabel.text = "CAD: \(cad/gbp)"
                                                                    }
                                                                    
                                    if let chf = newrates["CHF"] {
                                        self.b = chf
                                                                        self.chfLabel.text = "CHF: \(chf/gbp)"
                                                                    }
                                                                    
                                  
                                                                    
                                    if let jpy = newrates["JPY"] {
                                        self.d = jpy
                                                                        self.jpyLabel.text = "JPY: \(jpy/gbp)"
                                                                    }
                                                                    
                                    if let usd = newrates["USD"] {
                                        self.e = usd

                                                                        self.usdLabel.text = "USD: \(usd/gbp)"
                                                                    }
                                                                    
                                    if let turkish = newrates["TRY"] {
                                                                        self.trylabel.text = "TRY: \(turkish/gbp)"
                                        self.f = turkish
                                                                    }
                                                                }
                               

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
         
        }
        task.resume()
    }
    
    @IBAction func JPY(_ sender: Any) {
        if button6.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let jpy = newrates["JPY"] {
                                    self.d = 1
                                    self.selectedMNY = "JPY"
                                                                    self.jpyLabel.text = "JPY: 1"
                                    if let cad = newrates["CAD"] {
                                        self.a = cad
                                                                        self.cadlabel.text = "CAD: \(cad/jpy)"
                                                                    }
                                    if let chf = newrates["CHF"] {
                                        self.b = chf
                                                                        self.chfLabel.text = "CHF: \(chf/jpy)"
                                                                    }

                                    if let gbp = newrates["GBP"] {
                                        self.c = gbp
                                                                        self.gbpLabel.text = "GBP: \(gbp/jpy)"
                                                                    }
                                    if let usd = newrates["USD"] {
                                        self.e = usd

                                                                        self.usdLabel.text = "USD: \(usd/jpy)"
                                                                    }
                                    if let turkish = newrates["TRY"] {
                                                                        self.trylabel.text = "TRY: \(turkish/jpy)"
                                        self.f = turkish
                                                                    }
                                }
                                                                
                                                                
                              
                                                                
                                
                                                                
                               
                                                                
                                

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
        
        }
        task.resume()
    }
    
    @IBAction func EUR(_ sender: Any) {
        if button7.isTouchInside == true {
            self.testButton += 1
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c63e87429f35ab8daeaf81804326bec2")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){
            (data,response,error) in
            if error != nil{
                let alert = UIAlertController(title: "error", message: "didnt work", preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                               //değiştirilebilir sözlük kullanmak için
                        DispatchQueue.main.async{
                            self.selectedMNY = "EUR"
                            self.eurLabel.text = "EUR: 1"
                            if let newrates = jsonResponse["rates"] as? [String:Double]{
                                if let cad = newrates["CAD"] {
                                    self.a = cad
                                                                    self.cadlabel.text = "CAD: \(cad)"
                                                                }
                                                                
                                if let chf = newrates["CHF"] {
                                    self.b = chf
                                                                    self.chfLabel.text = "CHF: \(chf)"
                                                                }
                                                                
                                if let gbp = newrates["GBP"] {
                                    self.c = gbp
                                                                    self.gbpLabel.text = "GBP: \(gbp)"
                                                                }
                                                                
                                if let jpy = newrates["JPY"] {
                                    self.d = jpy
                                                                    self.jpyLabel.text = "JPY: \(jpy)"
                                                                }
                                                                
                                if let usd = newrates["USD"] {
                                    self.e = usd

                                                                    self.usdLabel.text = "USD: \(usd)"
                                                                }
                                                                
                                if let turkish = newrates["TRY"] {
                                    self.f = turkish
                                    
                                                                    self.trylabel.text = "TRY: \(turkish)"
                                                                }

                                
                            }
                                                        
                        }
                    }catch{
                        print("error")
                    }
                }
                
            }
     
            
        }
        task.resume()
        
    }
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        self.calculateButton += 1

        if self.testButton >= self.calculateButton{
                        if let value = self.enterValue.text {
                if let an = Double(value){
                    print(an)
                    var usdValue = self.usdLabel.text!
                    if usdValue != nil{
                        print(usdValue)
                        print("11")
                    }
                    var usdResult = usdValue.split(separator: " ")
                    var gbpValue = self.gbpLabel.text!
                    var gbpResult = gbpValue.split(separator: " ")
                    var jpyValue = self.jpyLabel.text!
                    var jpyResult = jpyValue.split(separator: " ")
                    var tryValue = self.trylabel.text!
                    var tryResult = tryValue.split(separator: " ")
                    var cadValue = self.cadlabel.text!
                    var cadResult = cadValue.split(separator: " ")
                    var chfValue = self.chfLabel.text!
                    var chfResult = chfValue.split(separator: " ")
                    var value1 = Double(gbpResult[1])!
                    print(value1)
                    var value2 = Double(chfResult[1])!
                    print(value2)
                    print("öneml")
                    var value3 = Double(cadResult[1])!
                    var value4 = Double(tryResult[1])!
                    var value5 = Double(jpyResult[1])!
                    var value6 = Double(usdResult[1])!
                    self.oldValueArray[0] = value1
                    self.oldValueArray[1] = value2
                    self.oldValueArray[2] = value3
                    self.oldValueArray[3] = value4
                    self.oldValueArray[4] = value5
                    self.oldValueArray[5] = value6
                    self.jpyLabel.text = "JPY:\(an*value5)"
                    self.cadlabel.text = "CAD:\(an*value3)"
                    self.usdLabel.text = "USD:\(an*value6)"
                    self.gbpLabel.text = "GBP:\(an*value1)"
                    self.trylabel.text = "TRY:\(an*value4)"
                    self.chfLabel.text = "CHF:\(an*value2)"
                    self.a = 0
                    self.b = 0
                    self.c = 0
                    self.d = 0
                    self.e = 0
                    self.f = 0
                    print(a)
                    print(an)
                    
                    
                }else{
                    self.makealert(titleInput: "enter a number", messageInput: "or i fck ur mom :)")
                }
            }else{
                self.makealert(titleInput: "enter a number", messageInput: "or i fck ur mom :)")
            }
            
            
            
        }else{
            if testButton >= 1 {
                if let value = self.enterValue.text {
                    if let an = Double(value){
                        self.gbpLabel.text = "GBP:\(an*self.oldValueArray[0])"
                        self.chfLabel.text = "CHF:\(an*self.oldValueArray[1])"
                        self.cadlabel.text = "CAD:\(an*self.oldValueArray[2])"
                        self.trylabel.text = "TRY:\(an*self.oldValueArray[3])"
                        self.jpyLabel.text = "JPY:\(an*self.oldValueArray[4])"
                        self.usdLabel.text = "USD:\(an*self.oldValueArray[5])"
                        self.calculateButton -= 1
                    }
                }
                
                
            }else{
                makealert(titleInput: "select  a money to convert", messageInput: "xx")
                self.calculateButton -= 1
            }
        }
        
        
    }
    func makealert(titleInput:String, messageInput: String ){
        let alert1 = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title:"okbutton", style: UIAlertAction.Style.default, handler: nil)
        alert1.addAction(button)
        self.present(alert1,animated: true, completion: nil)
        
    }
}


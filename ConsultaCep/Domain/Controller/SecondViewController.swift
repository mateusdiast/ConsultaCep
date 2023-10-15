

import UIKit



class SecondViewController:UIViewController {
    
    @IBOutlet weak var addressInput: UITextField!
    
    var addressStore = AddressStore()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        }
    
    @IBAction func searchAddress(_ sender: UIButton) {
        
    
        let validadeAddress = validadeAddress(address: addressInput.text)
        
        if validadeAddress{
            
            addressStore.fetchDataFromAPI(cep: addressInput.text ?? "") { result in
                switch result {
                case let .failure(error):
                    print(error)
                    let alertZipcodeWrong = UIAlertController(title: "Error", message: "Cep invalido! Tente outra vez!", preferredStyle: UIAlertController.Style.alert)
                    alertZipcodeWrong.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alertZipcodeWrong, animated: true, completion: nil)
                case let .success(data):
                    print(data)
                    self.performSegue(withIdentifier: "ThirdVc", sender: self)
                }
            }
            
        }
            
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "ThirdVc" {
           let destinationVc = segue.destination as! ThirdViewController
           destinationVc.zipCodeValue = addressStore.getZipcodeData()
           destinationVc.addressValue = addressStore.getAddressData()
           destinationVc.cityValue = addressStore.getCityData()
           destinationVc.ufValue = addressStore.getUfData()
       }
    }
    
    func validadeAddress(address: String?) -> Bool {
        
        if address?.count == 8{
            return true
        }else{
            let alertWrongNumberOfCharacters = UIAlertController(title: "Error", message: "Número de caracteres errado. Insira 8 números!", preferredStyle: UIAlertController.Style.alert)
            alertWrongNumberOfCharacters.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertWrongNumberOfCharacters, animated: true, completion: nil)
            return false
        }
    }
    
}

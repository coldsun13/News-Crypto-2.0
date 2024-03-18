import UIKit

protocol SettingsRoutingLogic {
    func revealAlertController(_ title: String)
    func showImagePicker()
}

class SettingsRouter: NSObject, SettingsRoutingLogic {
    
    weak var viewController: SettingsViewController?
    
    // MARK: Routing
    
    func revealAlertController(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Surname"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "E-mail"
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {_ in
            
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        presentFrom(source: viewController!, destination: alert)
    }
    
    func showImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = viewController
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            presentFrom(source: viewController!, destination: imagePicker)
        } else {
            let alert = UIAlertController(title: "Warning!",
                                          message: "You don't have permission to access gallery.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            presentFrom(source: viewController!, destination: alert)
        }
    }
}

private extension SettingsRouter {
    
    func presentFrom(source: UIViewController, destination: UIViewController) {
        source.present(destination, animated: true)
    }
}

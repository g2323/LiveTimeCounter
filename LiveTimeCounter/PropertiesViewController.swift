//
//  ViewController.swift
//  LiveTimeCounter
//
//  Created by Dr. Nürnberg on 02.03.18.
//  Copyright © 2018 G2323. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class PropertiesViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var datePickerDate: UIDatePicker!
    @IBOutlet weak var datePickerTime: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var eventMessageText: UITextField!
    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBAction func photoButton(_ sender: UIButton) {
        if (accessPhotos) {
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            present(imagePickerController, animated: true) {
                // nil
            }
        }
    }
    
    @IBAction func messageTextEndEdit(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func eventMessageTextEndEdit(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func urlTextDidEndOnExit(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    
    var imagePickerController = UIImagePickerController()
    var selectedImage: UIImage? = nil
    var accessPhotos = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePickerDate.date = CounterModel.shared().anchorDate
        datePickerTime.date = CounterModel.shared().anchorDate
        
        messageText.text = CounterModel.shared().message
        eventMessageText.text = CounterModel.shared().messageZero
        urlText.text = CounterModel.shared().url.absoluteString
        
        checkPhotoLibraryPermission()
        
        imagePickerController.modalPresentationStyle = .currentContext
        imagePickerController.delegate = self
        
        
       
      
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let cal = Calendar(identifier: .gregorian);
        
        let components = cal.dateComponents([.hour, .minute], from: datePickerTime.date)
        
        let date1 = cal.date(bySetting: .hour, value: components.hour ?? 0, of: datePickerDate.date)
        let date2 = cal.date(bySetting: .minute, value: components.minute ?? 0, of: date1!)
        
        CounterModel.shared().anchorDate = date2!
        CounterModel.shared().message = messageText.text ?? ""
        CounterModel.shared().messageZero = eventMessageText.text ?? ""
        CounterModel.shared().url = URL(string: urlText.text ?? "www.psilogistics.com")!
        
        if (selectedImage != nil) {
            CounterModel.shared().image = selectedImage
            //print("set new image");
        }
        
        CounterModel.shared().persist()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
            // nil
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage?
        imageView.contentMode = .scaleAspectFit
        if (selectedImage != nil) {
            imageView.image = selectedImage
        }
        dismiss(animated: true) {
            // nil
        }
    }
    
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            self.enableImagePicker()
        case .denied, .restricted :
            self.disableImagePicker()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization() { status in
                switch status {
                case .authorized:
                    self.enableImagePicker()
                case .denied, .restricted:
                    self.disableImagePicker()
                case .notDetermined:
                    print("this won't happen")
                }
            }
        }
    }
    
    func enableImagePicker() {
        accessPhotos = true
        DispatchQueue.main.async {
            self.photoButton.isEnabled = true
            self.photoButton.alpha = 1.0
        }
        
    }
    
    func disableImagePicker() {
        accessPhotos = false
        DispatchQueue.main.async {
            self.photoButton.isEnabled = false
            self.photoButton.alpha = 0.3
        }
    }

}


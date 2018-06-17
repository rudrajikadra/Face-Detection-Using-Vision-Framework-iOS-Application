//
//  ViewController.swift
//  Face Detection
//
//  Created by Rudra Jikadra on 09/12/17.
//  Copyright © 2017 Rudra Jikadra. All rights reserved.
//

import UIKit
import Vision

var imageView1: UIImageView = UIImageView()

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
/*        guard let image = UIImage(named: "family") else
        { return }

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit

        let scaleHeigth = view.frame.width / image.size.width * image.size.height

        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scaleHeigth)

        view.addSubview(imageView)

        let request = VNDetectFaceRectanglesRequest { (req, err) in
            if let err = err {
                print("Failed to detect faces : ", err)
                return
            }

            req.results?.forEach({ (res) in

                DispatchQueue.main.async {

                    guard let faceObservation = res as? VNFaceObservation else { return }

                    let width = self.view.frame.width * faceObservation.boundingBox.width
                    let heigth = scaleHeigth * faceObservation.boundingBox.height

                    let x = self.view.frame.width * faceObservation.boundingBox.origin.x
                    let y = scaleHeigth * (1 - faceObservation.boundingBox.origin.y) - heigth



                    let facefound = UIView()
                    facefound.backgroundColor = .red
                    facefound.alpha = 0.3
                    facefound.frame = CGRect(x: x, y: y, width: width, height: heigth)
                    self.view.addSubview(facefound)

                    print(faceObservation.boundingBox)
                }

            })
        }

        guard let cgImage = image.cgImage else { return }
        DispatchQueue.global(qos: .background).async {

            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            } catch let reqErr {
                print("Failed to perform request : ", reqErr)
            }
        } */
        
        
        
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photolibrary", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image2 = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView1.removeFromSuperview()
        
                imageView1 = UIImageView(image: image2)
                imageView1.contentMode = .scaleAspectFit
        
                let scaleHeigth = view.frame.width / image2.size.width * image2.size.height
        
                imageView1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scaleHeigth)
        
                view.addSubview(imageView1)
        
     
        let request = VNDetectFaceRectanglesRequest { (req, err) in
            if let err = err {
                print("Failed to detect faces : ", err)
                return
            }
            
            req.results?.forEach({ (res) in
                
                DispatchQueue.main.async {
                    
                    guard let faceObservation = res as? VNFaceObservation else { return }
                    
                    let width = self.view.frame.width * faceObservation.boundingBox.width
                    let heigth = scaleHeigth * faceObservation.boundingBox.height
                    
                    let x = self.view.frame.width * faceObservation.boundingBox.origin.x
                    let y = scaleHeigth * (1 - faceObservation.boundingBox.origin.y) - heigth
                    
                    
                    
                    let facefound = UIView()
                    facefound.backgroundColor = .red
                    facefound.alpha = 0.3
                    facefound.frame = CGRect(x: x, y: y, width: width, height: heigth)
                    self.view.addSubview(facefound)
                    
                    print(faceObservation.boundingBox)
                }
                
            })
        }
        
        guard let cgImage = image2.cgImage else { return }
        DispatchQueue.global(qos: .background).async {
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            } catch let reqErr {
                print("Failed to perform request : ", reqErr)
            }
        }
        
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


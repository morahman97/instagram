//
//  CreatePostViewController.swift
//  instagram
//
//  Created by Mo on 2/24/18.
//  Copyright © 2018 Mo. All rights reserved.
//

import UIKit
import Parse

class CreatePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let vc = UIImagePickerController()
    var image = UIImage()
    
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet var postImage: UIButton!
    
    @IBAction func setImage(_ sender: Any) {
        // Get the image captured by the UIImagePickerController
        
        //present(vc, animated : true, completion : nil)
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        present(vc, animated: true, completion: nil)
        print("Gets in present")
    }
    
    @IBAction func onShare(_ sender: Any) {
        
        // Upload post
        let upload = Post()
        upload.media = Post.getPFFileFromImage(image: image)!
        upload.author = PFUser.current()!
        upload.caption = captionTextField.text!
        upload.likesCount = 0
        upload.commentsCount = 0
        
        upload.saveInBackground()
        
        // Go back to main view
        self.performSegue(withIdentifier: "shareSegue", sender: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        
        // Go back to main view
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
       /* print("Gets in imagePickerController")
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)*/
        print("calls present in imagePickerController")
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        postImage.setImage(editedImage, for: UIControlState.normal)
        print("Sets image properly")
        self.image = editedImage
        
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
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

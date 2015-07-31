//
//  PhotoEditingViewController.swift
//  PhotoEditExtension
//
//  Created by Di Chen on 7/29/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class PhotoEditingViewController: UIViewController, PHContentEditingController {
    
    /* Original
    var input: PHContentEditingInput?
    */
    
    @IBOutlet weak var imageView: UIImageView!
    var output: PHContentEditingOutput!
    var input: PHContentEditingInput!
    let filterName = "CIColorPosterize"
    let editFormatIdentifier = NSBundle.mainBundle().bundleIdentifier!
    let editFormatVersion = "0.1"
    let operationQueue = NSOperationQueue()
    
    func dataFromCIImage(image: CIImage) -> NSData{
        
        let glContext = EAGLContext(API: .OpenGLES2)
        let context = CIContext(EAGLContext: glContext)
        let imageRef = context.createCGImage(image, fromRect: image.extent())
        let image = UIImage(CGImage: imageRef, scale: 1.0, orientation: .Up)
        
        return UIImageJPEGRepresentation(image, 1.0)
    }
    
    /* This takes the input and converts it to the output. The output has our posterized content saved inside it */
    func posterizedImageForInput(input: PHContentEditingInput) -> PHContentEditingOutput{
            
            /* Get the required information from the asset */
            let url = input.fullSizeImageURL
            let orientation = input.fullSizeImageOrientation
            
            /* Retrieve an instance of CIImage to apply our filter to */
            let inputImage = CIImage(contentsOfURL: url, options: nil).imageByApplyingOrientation(orientation)
            
            /* Apply the filter to our image */
            let filter = CIFilter(name: filterName)
            filter.setDefaults()
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage = filter.outputImage
            
            /* Get the data of our edited image */
            let editedImageData = dataFromCIImage(outputImage)
            
            /* The results of editing our image are encapsulated here */
            let output = PHContentEditingOutput(contentEditingInput: input)
            /* Here we are saving our edited image to the URL that is dictated by the content editing output class */
            editedImageData.writeToURL(output.renderedContentURL, atomically: true)
            
            output.adjustmentData = PHAdjustmentData(formatIdentifier: editFormatIdentifier,
                formatVersion: editFormatVersion, data: filterName.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false))
            
            return output
    }
    
    func editingOperation(){
                
      output = posterizedImageForInput(input)
      
      dispatch_async(dispatch_get_main_queue(), {[weak self] in
                let strongSelf = self!
      
                let data = NSData(contentsOfURL: strongSelf.output.renderedContentURL, options: .DataReadingMappedIfSafe, error: nil)
      
                let image = UIImage(data: data!)
      
                strongSelf.imageView.image = image
      
      })
                
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PHContentEditingController
    
    func canHandleAdjustmentData(adjustmentData: PHAdjustmentData?) -> Bool {
                // Inspect the adjustmentData to determine whether your extension can work with past edits.
                // (Typically, you use its formatIdentifier and formatVersion properties to do this.)
                return false
    }
    
    func startContentEditingWithInput(contentEditingInput: PHContentEditingInput?, placeholderImage: UIImage) {
        // Present content for editing, and keep the contentEditingInput for use when closing the edit session.
        // If you returned YES from canHandleAdjustmentData:, contentEditingInput has the original image and adjustment data.
        // If you returned NO, the contentEditingInput has past edits "baked in".
        
        imageView.image = placeholderImage
        input = contentEditingInput
        /* Start the editing in the background */
        let block = NSBlockOperation(block: editingOperation)
        operationQueue.addOperation(block)
    }
    
    func finishContentEditingWithCompletionHandler(completionHandler: ((PHContentEditingOutput!) -> Void)!) {
//        // Update UI to reflect that editing has finished and output is being rendered.
//        
//        // Render and provide output on a background queue.
//        dispatch_async(dispatch_get_global_queue(CLong(DISPATCH_QUEUE_PRIORITY_DEFAULT), 0)) {
//        // Create editing output from the editing input.
//        let output = PHContentEditingOutput(contentEditingInput: self.input)
//        
//        // Provide new adjustments and render output to given location.
//        // output.adjustmentData = <#new adjustment data#>
//        // let renderedJPEGData = <#output JPEG#>
//        // renderedJPEGData.writeToURL(output.renderedContentURL, atomically: true)
//        
//        // Call completion handler to commit edit to Photos.
//        completionHandler?(output)
//        
//        // Clean up temporary files, etc.
//        }
                    completionHandler?(output)
    }
    
    var shouldShowCancelConfirmation: Bool {
        // Determines whether a confirmation to discard changes should be shown to the user on cancel.
        // (Typically, this should be "true" if there are any unsaved changes.)
        return false
    }
    
    func cancelContentEditing() {
            // Clean up temporary files, etc.
            // May be called after finishContentEditingWithCompletionHandler: while you prepare output.
    operationQueue.cancelAllOperations()
    }
    
    
    
}

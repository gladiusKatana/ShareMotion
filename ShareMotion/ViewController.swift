//  ViewController.swift
//  MotionRecorder  ∙  1st commit May 18, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
//import Foundation
import UIKit
import CoreMotion
//import simd

class ViewController: UIViewController {
    @IBOutlet weak var status: UITextField!
    var count: Int!
    //var fileURL: URL!
    var data: SensorData! = SensorData()
    var motionManager: CMMotionManager? = CMMotionManager()
    var scalarAcceleration = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        status.text = "Status Bar"
        count = 0
    }
    
    @IBAction func share(_ sender: UIButton) {  //print("sharing")
        
        let fileName = "MotionData.csv"
        guard let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) else {
            print("failed to create url")
            return
        }
        var csvText = ""
        
        for item in scalarAcceleration {
            csvText.append("\(item)\n")
        }
        
//        for item in self.data.userAccelerationX {
//            csvText.append("\(item)\n")
//        }
        
        do {
            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
        
        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(vc, animated: true, completion: nil)
        
        vc.excludedActivityTypes = [
//            UIActivity.ActivityType.assignToContact,// is this applicable here anyway?
//            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.postToFacebook,
//            UIActivity.ActivityType.openInIBooks
        ]
    }
    
    @IBAction func start(_ sender: UIButton) {
        status.text = "Running..."
        resetSensorData()
        startQueuedUpdates()
    }
    @IBAction func stop(_ sender: UIButton) {
        stopQueueUpdates()
        let msg = String(format: "Stopped. count: %i", self.count)
        status.text = msg
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// original function from Lan, Rick (close enough)
/*@IBAction func share(_ sender: UIButton) {
 status.text = "Sharing..."
 writeSensorData()           ; print("after writeSenorData()")
 //print(fileURL.path)
 
 let documentToShare = NSData(contentsOfFile: fileURL.path)
 //let documentToShare = NSData(contentsOfFile: fileURL) // expects a string
 //let documentToShare = fileURL // Box app failed
 //let documentToShare = NSURL.fileURL(withPath: fileURL.path)
 let activityViewController = UIActivityViewController(activityItems: [documentToShare!], applicationActivities: nil)
 // Completion handler for SWIFT 3 AND 4, iOS 10 AND 11 :
 activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
 if !completed {
 // User canceled
 self.status.text = "Sharing cancelled"
 return
 }
 // User completed activity
 self.status.text = "Sharing completed"
 }
 activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
 // exclude some activity types from the list (optional)
 //activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
 // present the view controller
 self.present(activityViewController, animated: true, completion: nil)
 //status.text = "Sent"
 }
 */

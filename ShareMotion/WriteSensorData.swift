//  WriteSensorData.swift
//  MotionRecorder  ∙  1st commit May 18, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
//import Foundation
//import UIKit
import CoreMotion
//import simd

extension ViewController {
    
//    func writeSensorData() {
//        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMddHHmmss"
//
//        let dateString = dateFormatter.string(from: Date())
//        print("dateString: " + dateString)
//        //let file = "data" + dateString + ".txt" // Keep extension as .txt. If .csv, sharing doesn't work
//        
//        let file_name = "data" + dateString + ".txt" // File name with numbers -> Can not create FileHandle
//        print("file name: " + file_name + "\n")
//
//        let file = "data.txt"
//        //let file = file_name
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            fileURL = dir.appendingPathComponent(file)
//            print(fileURL.path)
//            do {
//                let file: FileHandle? = try FileHandle(forWritingTo: fileURL)
//                print("Count: " + String(format:"%i", count))
//                let header = "roll, pitch, yaw, rotation rate X, rotation rate Y, rotation rate Z, user acceleration X, user acceleration Y, user acceleration Z, heading\n"
//                file!.write(header.data(using: .utf8, allowLossyConversion: false)!)
//                for i in 0 ..< count {
//                    let msg1 = String(format:"%.20g,%.20g,%.20g",
//                                      data.roll[i],
//                                      data.pitch[i],
//                                      data.yaw[i])
//                    let msg2 = String(format:"%.20g,%.20g,%.20g",
//                                      data.rotationRateX[i],
//                                      data.rotationRateY[i],
//                                      data.rotationRateZ[i])
//                    let msg3 = String(format:"%.20g,%.20g,%.20g",
//                                      data.userAccelerationX[i],
//                                      data.userAccelerationY[i],
//                                      data.userAccelerationZ[i])
//                    let msg4 = String(format:"%.20g", data.heading[i])
//                    let line = msg1 + "," + msg2 + "," + msg3 + "," + msg4 + "\n"
//                    file!.write(line.data(using: .utf8, allowLossyConversion: false)!)
//                }
//                file!.closeFile()
//            } catch {
//                print("Error when creating FileHandle")
//            }
//        }
//    }
}

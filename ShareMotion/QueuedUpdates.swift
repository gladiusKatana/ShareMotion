//  ShareData.swift
//  MotionRecorder  ∙  1st commit May 18, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
//import Foundation
import UIKit
//import CoreMotion
//import simd

extension ViewController {
    
    func startQueuedUpdates() {
        guard let motion = motionManager, motion.isDeviceMotionAvailable else {
            status.text = "Device motion NOT available"
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {   // 3 second head start for setup
            motion.deviceMotionUpdateInterval = 1.0 / 60.0      // went as high as 1/360
            motion.showsDeviceMovementDisplay = true
            motion.startDeviceMotionUpdates(
                using: .xMagneticNorthZVertical,    // Get the attitude relative to the magnetic north reference frame.
                to: .main, withHandler: { (data, error) in      // TODO: main queue not recommended, self.queue
                    if let validData = data {                           // Make sure the data is valid before accessing it.
                        self.data.roll.append(validData.attitude.roll)
                        self.data.pitch.append(validData.attitude.pitch)
                        self.data.yaw.append(validData.attitude.yaw)
                        
                        self.data.rotationRateX.append(validData.rotationRate.x)
                        self.data.rotationRateY.append(validData.rotationRate.y)
                        self.data.rotationRateZ.append(validData.rotationRate.z)
                        
                        let aX = validData.userAcceleration.x
                        let aY = validData.userAcceleration.y
                        let aZ = validData.userAcceleration.z
                        
                        self.data.userAccelerationX.append(aX)                              //; print("a.x = \(aX)")
                        self.data.userAccelerationY.append(aY)
                        self.data.userAccelerationZ.append(aZ)
                        
                        self.data.heading.append(validData.heading)
                        
                        self.count = self.count + 1                                         //; print(self.count as Int)
                        
                        let aXSquared = self.square(aX)
                        let aYSquared = self.square(aY)
                        let aZSquared = self.square(aZ)
                        let magnitudeOfAccelerationSquared = Double(aXSquared + aYSquared + aZSquared)
                        let magnitudeOfAcceleration = sqrt(magnitudeOfAccelerationSquared)
                        
                        self.scalarAcceleration.append(magnitudeOfAcceleration)             ; print("a = \(magnitudeOfAcceleration)")
                    }
            })
        }
    }
    
    func square(_ x: Double) -> Double {
        return x * x
    }
    
    func stopQueueUpdates() {
        guard let motion = motionManager, motion.isDeviceMotionAvailable else { return }
        motion.stopDeviceMotionUpdates()
    }
}

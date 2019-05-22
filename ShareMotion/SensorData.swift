//  SensorData.swift
//  MotionRecorder  ∙  1st commit May 18, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
//import Foundation
//import UIKit
//import CoreMotion
//import simd

struct SensorData {
    var roll: [Double] = []
    var pitch: [Double] = []
    var yaw: [Double] = []
    var rotationRateX: [Double] = []
    var rotationRateY: [Double] = []
    var rotationRateZ: [Double] = []
    var userAccelerationX: [Double] = []
    var userAccelerationY: [Double] = []
    var userAccelerationZ: [Double] = []
    var heading: [Double] = []
}

extension ViewController {
    func resetSensorData() {
        count = 0
        data.roll.removeAll()
        data.pitch.removeAll()
        data.yaw.removeAll()
        data.rotationRateX.removeAll()
        data.rotationRateY.removeAll()
        data.rotationRateZ.removeAll()
        data.userAccelerationX.removeAll()
        data.userAccelerationY.removeAll()
        data.userAccelerationZ.removeAll()
        data.heading.removeAll()
    }
}

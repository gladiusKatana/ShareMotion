//  Notes.swift
/*  MotionRecorder  ∙  1st commit May 18, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

 
        Adapted from:

 Rick Lan's MotionRecorder (https://github.com/rlan/MotionRecorder)
 
 Justin Doan's "CREATING AND EXPORTING A CSV FILE IN SWIFT"  (http://www.justindoan.com/tutorials/2016/9/9/creating-and-exporting-a-csv-file-in-swift)
 
 
 
        Upcoming:
 
 Continue to refine the Mac Numbers spreadsheet template containing numerical integration/differentiation/graphing
 
 More testing with a higher sampling frequency (probably 200 Hz)
 
 Perform basic error analysis on acceleration values measured (based on accuracy of iPhone 7's accelerometer, etc)
 
 Add narrow bandpass filtering to slightly reduce noise
 
 Use high values of jerk (time rate of change of acceleration) to help identify meaningful events (e.g., shifting gears in a manual transmission car; obvious preliminary testing events such as the phone bouncing on a mattress after it's dropped from the ceiling)

 Perform graphing automatically in the app, with some of above described techniques*/

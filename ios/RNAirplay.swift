//
//  RNAirplay.swift
//  RNAirplay
//
//  Created by Mantas Kaveckas on 23/08/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import MediaPlayer

@objc(RNAirplay)
class RNAirplay: RCTEventEmitter {
    func methodQueue() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    @objc func startScan() -> Void {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(RNAirplay.airplayChanged(sender:)),
            name: AVAudioSession.routeChangeNotification,
            object: AVAudioSession.sharedInstance()
        )
        self.isConnected()
    }
    
    @objc func endScan() -> Void {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func airplayChanged(sender: NSNotification) {
        self.isConnected()
    }
    
    @objc func isConnected() -> Void {
        var isConnected = false
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        for output in currentRoute.outputs {
            if output.portType == AVAudioSession.Port.airPlay {
                isConnected = true
                break;
            }
        }
        self.sendEvent(withName: "airplayConnected", body: ["connected": isConnected])
    }

    @objc func isAvailable() -> Void {
        var isAvailable = false
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        let routeCount = currentRoute.outputs.count
        let isSpeaker = currentRoute.outputs[0].portName == "Speaker"
        if (routeCount > 0 && !isSpeaker) {
            isAvailable = true
        }
        self.sendEvent(withName: "airplayAvailable", body: ["available": isAvailable])
    }
    
    override func supportedEvents() -> [String]! {
        return ["airplayConnected", "airplayAvailable"]
    }
}

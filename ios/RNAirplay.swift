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
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        var isConnected = false
        for output in currentRoute.outputs {
            if output.portType == AVAudioSession.Port.airPlay {
                isConnected = true
                break;
            }
        }
        self.sendEvent(withName: "airplayConnected", body: ["connected": isConnected])
    }
    
    override func supportedEvents() -> [String]! {
        return ["airplayConnected"]
    }
}

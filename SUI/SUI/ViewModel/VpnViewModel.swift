//
//  VpnViewModel.swift
//  SUI


import Foundation

/// ViewModel для вью с vpn
final class VpnViewModel: ObservableObject {
    
    @Published public var countSentMb = 0
    @Published public var countMb = 0
    var timer: Timer?
    
    public func start(load: Bool) {
        timer = Timer(
            timeInterval: 1,
            target: self,
            selector: #selector(setupMb),
            userInfo: nil,
            repeats: true
        )
        
        guard let timer = timer else { return }
        
        if load {
            RunLoop.main.add(timer, forMode: .default)
        } else {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    /// Установка актуального кол-ва мб
    @objc private func setupMb() {
        guard (timer != nil) else { return }
        self.countMb += 43
        print(countMb)
    }
    
}
    

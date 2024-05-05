//
//  VpnViewModel.swift
//  SUI


import Foundation

/// ViewModel для вью с vpn
final class VpnViewModel: ObservableObject {
    
    @Published public var countMb = 0
    @Published public var countSentMb = 0
    private var timerRecived: Timer?
    private var timerSent: Timer?
    
    
    public func start(load: Bool) {
        timerRecived = Timer(
            timeInterval: 1,
            target: self,
            selector: #selector(setupMb),
            userInfo: nil,
            repeats: true
        )
        
        guard let timer = timerRecived else { return }
        
        if load {
            RunLoop.main.add(timer, forMode: .default)
        } else {
            timer.invalidate()
            self.timerRecived = nil
        }
    }
    
    public func startSent(load: Bool) {
        timerSent = Timer(
            timeInterval: 1,
            target: self,
            selector: #selector(setupSentMb),
            userInfo: nil,
            repeats: true
        )
        
        guard let timer = timerSent else { return }
        
        if load {
            RunLoop.main.add(timer, forMode: .default)
        } else {
            timer.invalidate()
            self.timerSent = nil
        }
    }
    
    /// Установка актуального кол-ва мб
    @objc private func setupSentMb() {
        guard (timerSent != nil) else { return }
        self.countSentMb += 26
        print(countSentMb)
    }
    
    /// Установка актуального кол-ва мб
    @objc private func setupMb() {
        guard (timerRecived != nil) else { return }
        self.countMb += 43
        print(countMb)
    }
    
}
    

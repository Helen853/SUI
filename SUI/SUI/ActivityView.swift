//
//  ActivityView.swift
//  SUI


import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    public var activityItem: [Any]
    public var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activity = UIActivityViewController(
            activityItems: activityItem,
            applicationActivities: applicationActivities
        )
        return activity
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
    
    
}

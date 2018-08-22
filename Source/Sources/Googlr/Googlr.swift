//
//  Googlr.swift
//  Googlr
//
//  Created by Cameron Ingham on 8/21/18.
//

import Foundation
import Rainbow

public final class Googlr {
    
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        if arguments.count == 2 {
            let search = "\(arguments[1].replacingOccurrences(of: " ", with: "+").utf8)"
            guard let baseURL = URL(string: "https://www.google.com/search") else {
                print(" Error ".black.onRed + " Try again later".red)
                return
            }
            
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            
            let searchQuery = URLQueryItem(name: "q", value: search)
            
            components?.queryItems = [searchQuery]
            
            guard let searchableURL = components?.url else {
                print(" Error ".black.onRed + " Try again later".red)
                return
            }
            
            let _ = shell(launchPath: "/usr/bin/open", arguments: [searchableURL.absoluteString])
            
        } else {
            help()
        }
    }
    
    private func help() {
        print(" Usage ".black.onWhite + " googlr \"<your search here>\"".white)
        print("\n" + " Example ".black.onYellow + " googlr \"How to be awesome?\"".white)
    }
    
    private func shell(launchPath: String, arguments: [String]) -> String? {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)
        
        return output
    }
    
}

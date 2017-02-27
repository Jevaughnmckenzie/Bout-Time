//
//  HistoricalEvents.swift
//  Bout Time App
//
//  Created by Jevaughn McKenzie on 2/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Event {
    let year: Int
    let event: String
    let info: URL
    
    init(year: Int, event: String, info: URL) {
        self.year = year
        self.event = event
        self.info = info
    }
}
let eventList: [Event] = [
    Event(year: 1969, event: "Jay-z is born.", info: URL(string: "https://en.wikipedia.org/wiki/Jay_Z")!),
    Event(year: 1971, event: "Details of the secret FBI program, COITELPRO, are discovered.", info: URL(string:"https://en.wikipedia.org/wiki/COINTELPRO")!),
    Event(year: 1976, event: "Apple is founded", info: URL(string: "https://en.wikipedia.org/wiki/Apple_Inc.")!),
    Event(year: 1977, event: "Kanye West is born.", info: URL(string: "https://en.wikipedia.org/wiki/Kanye_West")!),
    Event(year: 1985, event: "The original Air Jordan 1 is released to the public", info: URL(string:"https://en.wikipedia.org/wiki/Air_Jordan")!),
    Event(year: 1989, event: "Dragon Ball Z is aired in Japan", info: URL(string: "https://en.wikipedia.org/wiki/dragon_ball_z")!),
    Event(year: 1994, event: "the original Playstation is released", info: URL(string: "https://en.wikipedia.org/wiki/PlayStation")!),
    Event(year: 1995, event: "The original Toy Story film aires in the United States", info: URL(string: "https://en.wikipedia.org/wiki/Toy_Story")!),
    Event(year: 1996, event: "Tupac is murdered", info: URL(string: "https://en.wikipedia.org/wiki/Tupac_Shakur")!),
    Event(year: 1997, event: "Netflix is founded", info: URL(string: "https://en.wikipedia.org/wiki/Netflix")!),
    Event(year: 1998, event: "Google is founded", info: URL(string: "https://en.wikipedia.org/wiki/Google")!),
    
    Event(year: 1999, event: "Game Boy Colour released",  info: URL(string: "https://en.wikipedia.org/wiki/Game_Boy_Color")!),
    Event(year: 2000, event: "Playstation 2 is released", info: URL(string: "https://en.wikipedia.org/wiki/PlayStation_2")!),
    Event(year: 2002, event: "Nintendo Gamecube released", info: URL(string: "https://en.wikipedia.org/wiki/GameCube")!),
    Event(year: 2003, event: "Finding Nemo is premiered in the Uited States", info: URL(string: "https://en.wikipedia.org/wiki/Finding_Nemo")!),
    Event(year: 2004, event: "Facebook is founded", info: URL(string: "https://en.wikipedia.org/wiki/Facebook")!),
    Event(year: 2005, event: "'Naruto' the anime series begins airing in the the United States", info: URL(string: "https://en.wikipedia.org/wiki/Naruto")!),
    Event(year: 2006, event: "Nintendo Wii released", info: URL(string: "https://en.wikipedia.org/wiki/Wii")!),
    Event(year: 2007, event: "The first iPhone is released", info: URL(string: "https://en.wikipedia.org/wiki/IPhone")!),
    Event(year: 2008, event: "Barack Obama becomes president", info: URL(string: "https://en.wikipedia.org/wiki/Barack_Obama")!),
    Event(year: 2009, event: "Uber founded", info: URL(string: "https://en.wikipedia.org/wiki/Uber_(company)")!),
    Event(year: 2010, event: "Apple iPad is released", info: URL(string: "https://en.wikipedia.org/wiki/IPad")!),
    Event(year: 2011, event: "Snapchat is first released as 'Pictaboo'", info: URL(string: "https://en.wikipedia.org/wiki/Snapchat")!),
    Event(year: 2012, event: "Kendrick Lamar drops the highly anticipated album good kid, m.A.A.d city", info: URL(string: "https://en.wikipedia.org/wiki/Good_Kid,_M.A.A.D_City")!),
    Event(year: 2014, event: "The Swift programming language first appears", info: URL(string: "https://en.wikipedia.org/wiki/Swift_(programming_language)")!)
    
]



























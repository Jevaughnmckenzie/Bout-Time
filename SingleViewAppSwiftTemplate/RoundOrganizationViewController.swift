//
//  EventOrganization.swift
//  Bout Time App
//
//  Created by Jevaughn McKenzie on 2/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit


// places events from any array of events in a random order for round
// also makes sure no event repeats in a single round

let eventsListedPerRound = 4

func randomizeEvents(for question: [Event]) -> [Int] {
    var eventsInRound = [Int]()
    var counter = 0
    while counter < eventsListedPerRound{
        let indexOfEvent = GKRandomSource.sharedRandom().nextInt(upperBound: eventList.count)
        if eventsInRound.contains(indexOfEvent) {
            continue
        } else {
            eventsInRound.append(indexOfEvent)
            counter += 1
        }
    }
    
    return eventsInRound
}









//
//  Colors.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/26/17.
//
//

import Foundation


public class Colors {
    
    static let BloodyMary = ["#FF512F", "#DD2476"]
    static let MangoPulp = ["#F09819", "#EDDE5D"]
    static let Frozen = ["#403B4A", "#E7E9BB"]
    static let RoseWater = ["#E55D87", "#5FC3E4"]
    static let Horizon = ["#003973", "#E5E5BE"]
    static let LemonTwist = ["#3CA55C", "#B5AC49"]
    static let EmeraldWater = ["#348F50", "#56B4D3"]
    static let IntuitivePurple = ["#DA22FF", "#9733EE"]
    static let GreenBeach = ["#02AAB0", "#00CDAC"]
    static let HarmonicEnergy = ["#16A085", "#F4D03F"]
    static let CoolBrown = ["#603813", "#b29f94"]
    static let YouTube = ["#e52d27", "#b31217"]
    static let SeaBlue = ["#2b5876", "#4e4376"]
    static let Orca = ["#44A08D", "#093637"]
    static let CosmicFusion = ["#ff00cc", "#333399"]
    static let Mauve = ["#42275a", "#734b6d"]
    static let Politics = ["#2196f3", "#f44336"]
    static let Blush = ["#B24592", "#F15F79"]
    static let Mystic = ["#757F9A", "#D7DDE8"]
    static let ShroomHaze = ["#5C258D", "#4389A2"]
    static let Moss = ["#134E5E", "#71B280"]
    static let VeniceBlue = ["#085078", "#85D8CE"]
    static let ElectricViolet = ["#4776E6", "#8E54E9"]
    static let Kashmir = ["#614385", "#516395"]
    static let SteelGray = ["#1F1C2C", "#928DAB"]
    static let Mirage = ["#16222A", "#3A6073"]
    static let JuicyOrange = ["#FF8008", "#FFC837"]
    static let Mojito = ["#1D976C", "#93F9B9"]
    static let Cherry = ["#EB3349", "#F45C43"]
    static let Pinky = ["#DD5E89", "#F7BB97"]
    static let SeeWeed = ["#4CB8C4", "#3CD3AD"]
    static let PurpleParadise = ["#1D2B64", "#F8CDDA"]
    static let Sunrise = ["#FF512F", "#F09819"]
    static let AquaMarine = ["#1A2980", "#26D0CE"]
    static let Aubergine = ["#AA076B", "#61045F"]
    static let Miaka = ["#FC354C", "#0ABFBC"]
    static let Army = ["#414d0b", "#727a17"]
    static let Shrimpy = ["#e43a15", "#e65245"]
    static let Influenza = ["#C04848", "#480048"]
    static let CalmDarya = ["#5f2c82", "#49a09d"]
    static let Bourbon = ["#EC6F66", "#F3A183"]
    static let Stellar = ["#7474BF", "#348AC7"]
    static let Clouds = ["#ECE9E6", "#FFFFFF"]
    static let Moonrise = ["#DAE2F8", "#D6A4A4"]
    static let Peach = ["#ED4264", "#FFEDBC"]
    static let Dracula = ["#DC2424", "#4A569D"]
    static let Mantle = ["#24C6DC", "#514A9D"]
    static let Titanium = ["#283048", "#859398"]
    static let Opa = ["#3D7EAA", "#FFE47A"]
    static let SeaBlizz = ["#1CD8D2", "#93EDC7"]
    static let MidnightCity = ["#232526", "#414345"]
    
    static public func randomPair() -> [UIColor] {
        let allColorPairs =
            [BloodyMary,
             MangoPulp,
             Frozen,
             RoseWater,
             Horizon,
             LemonTwist,
             EmeraldWater,
             IntuitivePurple,
             GreenBeach,
             HarmonicEnergy,
             CoolBrown,
             YouTube,
             SeaBlue,
             Orca,
             CosmicFusion,
             Mauve,
             Politics,
             Blush,
             Mystic,
             ShroomHaze,
             Moss,
             VeniceBlue,
             ElectricViolet,
             Kashmir,
             SteelGray,
             Mirage,
             JuicyOrange,
             Mojito,
             Cherry,
             Pinky,
             SeeWeed,
             PurpleParadise,
             Sunrise,
             AquaMarine,
             Aubergine,
             Miaka,
             Army,
             Shrimpy,
             Influenza,
             CalmDarya,
             Bourbon,
             Stellar,
             Clouds,
             Moonrise,
             Peach,
             Dracula,
             Mantle,
             Titanium,
             Opa,
             SeaBlizz,
             MidnightCity]
        
        let random = Int(arc4random_uniform(UInt32(allColorPairs.count)))
        return allColorPairs[random].map({ UIColor(hex: $0) })
    }
    
    static public func randomColors(numberOfColors count: Int) -> [UIColor] {
        var colors = [UIColor]()
        
        let degreeIncrement: Int = 360 / count - 1
        for degree in stride(from: 0, to: 360, by: degreeIncrement) {
            let hue: CGFloat = 1.0 * (CGFloat(degree) / 360.0)
            let color = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            colors.append(color)
        }
        
        if let first = colors.first {
            colors.append(first)
        }
        return colors
    }
}

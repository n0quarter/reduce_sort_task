import Foundation

let champs : [Int: String] = [
  1980 : "Ukraine",
  1981 : "Germany",
  1982 : "Italy",
  1983 : "Ukraine",
]

// v1. trivial
var winners2 = [String:Int]()
for (year, country) in champs {
  winners2[country] = (winners2[country] ?? 0) + 1
}
winners2

let winnersArray2 = winners2.map { ($0, $1) }.sort{$1.1 < $0.1}
print(winnersArray2)


// v2, reduce with named parameters
let winnersDict1 = champs.reduce([String: Int]()) { (var winners, pair) in
  winners[pair.1] = (winners[pair.1] ?? 0) + 1
  return winners
}

// just for fun: reduce without named parameters
let winnersDict = champs.reduce([String: Int]()) {
  var winners = $0
  winners[$1.1] = (winners[$1.1] ?? 0) + 1
  return winners
}

let winnersArray = winnersDict.map { ($0, $1) }.sort{$1.1 < $0.1}
print(winnersArray)



// super trivial version
//var winners : [String:Int] = [String:Int]()
//for (year, country) in champs {
//  if let previousVal = winners[country] {
//    winners[country] = previousVal+1
//  }
//  else {
//    winners[country] = 1
//  }
//}
//winners



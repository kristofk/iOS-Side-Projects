
/*
 
 An = 20 -- last row
 d = -2 -- each row has 2 extra seats
 Sn = 510 -- altogether there are 510 seats
 
 */

var currentRowSeats = 20
var seatsLeft = 510
let diff = 2



var counter = 0
while seatsLeft > 0 {
    counter += 1
    
    seatsLeft -= currentRowSeats
    currentRowSeats += diff
}


print("There are \(counter) rows in the theater.\nThe remainder is: \(seatsLeft)")



























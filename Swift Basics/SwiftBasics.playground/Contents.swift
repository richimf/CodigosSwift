//: Playground - noun: a place where people can play

import UIKit

//*----------------------| BITWISE OPERATIONS |----------------------*//

//-----------> NOT OPERATOR ~ <-----------//
// Inverts all bits in a number
let myBits: UInt8 = 0b00001111 //8 bits integer
let inverted = ~myBits //inverted = 0b11110000

//-----------> AND OPERATOR & <-----------//
// Combines the bits of two numbers
let firstNumbers: UInt8 = 0b11111100
let lastNumbers: UInt8  = 0b00111111
let numberInBoth = firstNumbers & lastNumbers  // equals 00111100

//-----------> OR OPERATOR | <-----------//
// Combines the bits of two numbers
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110

//-----------> XOR OPERATOR ^ <-----------//
// Compares the bits of two numbers.
// If both numbers are the same, put zero, else, put one.
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001


//-----------> SHIT OPERATIONS <-----------//
//It shifts the binary digits left or fight, after that, it returns to its decimal number.
/* For example, the decimal number 14 in binary, padded to 8 digits, is 00001110.
   Shifting this left by two places results in 00111000, which is 56 in decimal.
 */

//SHIFT LEFT: [value] << [number of positions to move]
//SHIFT RIGHT:        >>

1 << 3
32 >> 2

//EXAMPLE:
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153







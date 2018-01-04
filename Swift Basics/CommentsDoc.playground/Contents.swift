

//*----------------------| HOW TO COMMENT |----------------------*//

/**
 General description
 
    - More details

 - Parameter parameter1: one description
 
 - Parameter parameter2: two description
 
 - Parameter parameter3: three description
 
 @param parameter1:Int
 
 @param parameter2:Double
 
 @param parameter3:String
 
 @return String
 */
func myMethod(parameter1:Int, parameter2:Double, parameter3:String)->String{
    return "\(parameter1)"+"\(parameter2)"+"\(parameter3)"
}

/**
Set String in minutes format, "5 min"

- Parameter time: Int time value

@param time:Int

@return String
*/
func setminutes(_ time:Int)->String{
    return "\(time)"+" min"
}

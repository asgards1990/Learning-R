rankall <- function(outcome, num = "best") {
        
        ## Read outcome data
        database<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that outcome is valid
        
        if (outcome=="heart attack") {
                nameOutcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        } 
        else if (outcome=="heart failure") {
                nameOutcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        } 
        else if (outcome == "pneumonia") {
                nameOutcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        } 
        else stop("invalid outcome")
        
        ## For each state, find the hospital of the given rank  
        ## list of states
        states <- sort(unique(database[,7]))
        
        ## list of hospitals with 3 columns and NA trimmed for the column Rate
        hospitals <- database[,c("Hospital.Name",nameOutcome,"State")]
        hospitals[,nameOutcome] <- suppressWarnings(
                as.numeric(hospitals[,nameOutcome])) 
        
        ## The to be returned end result, initiate by giving the wo columns and 
        ## corresponding names (rows + cols)
        listRanking = data.frame(row.names = states,
                                 hospital=rep(NA,length(states)),state=states)
        
        for (state in states) {           
                ## Creating the list of hospital by state
                hospitalsTemp <- hospitals[hospitals[,"State"]==state,
                                           c("Hospital.Name",nameOutcome)]
                ## Sorting accordingly, first by rate then by name.
                
                result <- hospitalsTemp[
                        order(hospitalsTemp[,nameOutcome],
                              hospitalsTemp[,"Hospital.Name"]),]
                
                ## Eliminating "NA"s.
                result <- result[!is.na(result[,nameOutcome]),"Hospital.Name"]
                
                if (num=="best") {
                        listRanking[state, "hospital"]  <- result[1]
                }
                else if (num=="worst") {
                        listRanking[state, "hospital"]  <- result[length(result)]
                }
                else if (num <= length(result)) {
                        listRanking[state, "hospital"]  <- result[num]
                }
        }
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        return(listRanking)
}
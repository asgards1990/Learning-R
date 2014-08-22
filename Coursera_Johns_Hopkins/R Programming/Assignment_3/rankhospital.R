rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        database<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
                
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
                
        if (state %in% database[,7])  {
                hospitals <- database[database[,7]==state,c("Hospital.Name",
                                                            nameOutcome)]
        }
        else { 
                stop("invalid state") 
        }
                
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        
        ## Transform the class of Rate into numeric
        hospitals[,nameOutcome] <- suppressWarnings(as.numeric(hospitals[,nameOutcome])) 
        
        ## Sorting accordingly, first by rate then by name.
        result <- hospitals[
                order(hospitals[,nameOutcome],hospitals[,"Hospital.Name"]),
                ]
        
        ## Eliminating "NA"s.
        result <- result[!is.na(result[,nameOutcome]),"Hospital.Name"]
        
        if (num=="best") {
                return(result[1])
        }
        else if (num=="worst") {
                return(result[length(result)])
        }
        if (num > length(result)) {
                return("NA")
        }
        
        return(result[num])
}

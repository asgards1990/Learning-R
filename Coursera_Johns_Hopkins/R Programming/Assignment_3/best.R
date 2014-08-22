best <- function(state, outcome) {
        ## Read outcome data
        database<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        possibleOutcomes = c("heart attack","heart failure", "pneumonia")
        
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
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        sortedHospitalsByName <- hospitals[
                unlist(sort(hospitals[,"Hospital.Name"],index.return=TRUE)["ix"],use.names=FALSE),]
        ## suppress the warning regarding "NA introduced by coercion"
        result <- suppressWarnings(sortedHospitalsByName[
                which.min(sortedHospitalsByName[,nameOutcome]),"Hospital.Name"])
        
        return(result)
        
       
}
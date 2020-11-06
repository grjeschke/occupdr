#' Read iDigBio Raw Data
#' 
#' reads a csv file from iDigBio.org with [fread()]
#' @param input a comma-delimited csv
#' @param output tb df a tibble or dataframe
#' @keywords parse, csv
#' @export
#' @examples
#' idigfread("filename.csv") 


idigfread <- function(x){fread(x, sep=",", header=TRUE, stringsAsFactors=FALSE)}
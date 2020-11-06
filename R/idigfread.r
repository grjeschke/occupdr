#' Read iDigBio
#' 
#' reads a csv file from iDigBio.org
#' @param input a comma-delimited csv
#' @param output tb df a tibble or dataframe
#' @keywords parse, csv
#' @export
#' @examples
#' idigfread() 


idigfread <- function(x){as_tibble(fread(x,
                                         sep=",", 
                                         header=TRUE, 
                                         stringsAsFactors=FALSE))}
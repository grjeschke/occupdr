#' Read GBIF
#' 
#' reads a csv file from GBIF.org
#' @param  input a tab-delimited csv
#' @return  tbl_df a tibble or dataframe
#' @keywords  parse, tsv
#' @export
#' @examples 
#' gbifread() see vignette



gbifread <- function(x){fread(x, sep="\t", 
                              header=TRUE, stringsAsFactors=FALSE, quote="")}
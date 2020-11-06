#' Read GBIF Raw Data
#' 
#' reads a csv file from GBIF.org with [fread()]
#' @param  input a tab-delimited csv
#' @return  tbl_df a tibble or dataframe
#' @importFrom data.table fread
#' @keywords  parse, tsv
#' @export
#' @examples 
#' gbifread("tsvfilename.csv")


gbifread <- function(x){fread(x, sep="\t", 
                              header=TRUE, stringsAsFactors=FALSE, quote="")}
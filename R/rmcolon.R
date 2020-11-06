#' Remove Colon
#' 
#' replaces colon with dot in column names
#' @param input df, a dataframe
#' @param output df, the dataframe 
#' @keywords header, replacement
#' @export
#' @examples 
#' rmcolon()

rmcolon <- function(df){names(df)<-gsub(x=names(df), pattern=":", replacement="."); return(df)}
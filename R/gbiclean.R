#' GBI clean
#' 
#' tidies and selects some variables from GBIF.org data
#' 
#' @param  input df, or tbl a dataframe
#' @return  smaller df or tbl
#' @keywords  tidy, select
#' @seealso [gbifread()]
#' @importFrom dplyr %>%
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @export
#' @examples 
#' gbiclean(data)


gbiclean <- function(x){x %>% filter(eventDate != "", !is.na(eventDate)) %>%
        dplyr::filter(species != "", species != " ", !is.na(species)) %>%
        dplyr::mutate(doy = as.numeric(strftime(eventDate, format="%j"))) %>% 
        dplyr::mutate(family=str_to_sentence(family), 
           species=str_to_sentence(species)) %>%
        dplyr::filter(basisOfRecord %in% c("HUMAN_OBSERVATION", "PRESERVED_SPECIMEN"))%>%
        dplyr::select(family, species, decimalLatitude, decimalLongitude, 
           basis=basisOfRecord, doy, year)}
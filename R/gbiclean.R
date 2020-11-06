#' GBI clean
#' 
#' tidies and selects some variables from GBIF.org data
#' 
#' @param  input df, or tbl a dataframe
#' @return  smaller df or tbl
#' @keywords  tidy, select
#' @seealso [gbifread()]
#' @export
#' @examples 
#' gbiclean()


gbiclean <- function(x){x %>% filter(eventDate != "", !is.na(eventDate)) %>%
    filter(species != "", species != " ", !is.na(species)) %>%
    mutate(doy = as.numeric(strftime(eventDate, format="%j"))) %>% 
    mutate(family=str_to_sentence(family), 
           species=str_to_sentence(species)) %>%
    filter(basisOfRecord %in% c("HUMAN_OBSERVATION", "PRESERVED_SPECIMEN"))%>%
    select(family, species, decimalLatitude, decimalLongitude, 
           basis=basisOfRecord, doy, year)}
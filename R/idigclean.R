#' Clean iDigBio Data
#' 
#' Tidies and selects some variables from iDigBio data
#' @param  input tbl_df a dataframe
#' @return  smaller tbl_df
#' @keywords  tidy, select
#' @seealso [idigfread()] [rmcolon()]
#' @export
#' @examples  
#' idigclean()
#' 
#' @details  # Warning: 
#' this function must be used after [rmcolon()]




idigclean <- function(x){x %>%
    filter(!grepl(dwc.specificEpithet, pattern="[.,]"), 
           !is.na(dwc.specificEpithet), dwc.specificEpithet!="",
           dwc.specificEpithet!=" ") %>% # grab only species-level IDs
    mutate(dwc.specificEpithet = word(dwc.specificEpithet, -1)) %>% # forget subspp.
    mutate(species=paste(dwc.genus, dwc.specificEpithet)) %>%
    mutate(extractDate = as.Date(substr(dwc.eventDate, start=1, stop=10))) %>%
    mutate(doy = as.numeric(strftime(extractDate, format="%j"))) %>% # get DOY
    dplyr::select(dwc.family, species, decimalLatitude=dwc.decimalLatitude, 
                  decimalLongitude=dwc.decimalLongitude, 
                  year=dwc.year, basis=dwc.basisOfRecord, doy) %>%
    mutate(family=str_to_sentence(dwc.family), species=str_to_sentence(species)) %>%
    dplyr::select(-dwc.family)}
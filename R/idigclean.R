#' Clean iDigBionData
#' 
#' Tidies and selects some variables from iDigBio data
#' @param  input tbl_df a dataframe
#' @return  smaller tbl_df
#' @keywords  tidy, select
#' @seealso [idigfread()] [rmcolon()]
#' @export
#' @examples  
#' idigclean(data)
#' 
#' @details  # Warning: 
#' this function must be used after [rmcolon()]




idigclean <- function(x){x %>%
    dplyr::filter(!grepl(dwc.specificEpithet, pattern="[.,]"), 
           !is.na(dwc.specificEpithet), dwc.specificEpithet!="",
           dwc.specificEpithet!=" ") %>% 
        dplyr::mutate(dwc.specificEpithet = word(dwc.specificEpithet, -1)) %>%
        dplyr::mutate(species=paste(dwc.genus, dwc.specificEpithet)) %>%
        dplyr::mutate(extractDate = as.Date(substr(dwc.eventDate, start=1, stop=10))) %>%
        dplyr::mutate(doy = as.numeric(strftime(extractDate, format="%j"))) %>% 
    dplyr::select(dwc.family, species, decimalLatitude=dwc.decimalLatitude, 
                  decimalLongitude=dwc.decimalLongitude, 
                  year=dwc.year, basis=dwc.basisOfRecord, doy) %>%
        dplyr::mutate(family=str_to_sentence(dwc.family), species=str_to_sentence(species)) %>%
    dplyr::select(-dwc.family)}
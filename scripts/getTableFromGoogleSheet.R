extractFileIdFromURL <- function(url) {
  return(stringr::str_extract(url, '[[:alnum:]_-]{30,}'))
}

buildDownloadURL <- function(url, format, sheetid){
  address <- paste0(
    'https://docs.google.com/spreadsheets/export?id=',
    extractFileIdFromURL(url),
    '&format=',
    format
    )
  return(address)
}

tableFromGoogleSheet <- function(url, sheetid){
  suppressMessages(table <- readr::read_csv(file = buildDownloadURL(url, format='csv', sheetid)))
  return(table)
}
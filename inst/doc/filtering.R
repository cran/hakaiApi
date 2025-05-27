## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval = FALSE------------------------------------------------------
# library(hakaiApi)
# 
# # Initialize the client
# #   follow link in console and paste auth. code in console
# #   (ignore alignment issue)
# client <- hakaiApi::Client$new()

## ----filter, eval = FALSE-----------------------------------------------------
# # First return some chl data with no filters
# endpoint <- "/eims/views/output/chlorophyll"
# all_chl <- client$get(paste0(client$api_root, endpoint))
# # by default only 20 rows are returned
# str(all_chl) # Look at what columns are available to filter on
# 
# # Narrow it down to QU39
# query <- "?site_id=QU39"
# client$get(paste0(client$api_root, endpoint, query))
# 
# #Get back only accepted values
# query <- "?site_id=QU39&chla_flag=AV"
# client$get(paste0(client$api_root, endpoint, query))
# 
# # Get values from 2017
# query <- "?site_id=QU39&chla_flag=AV&date.year=2017"
# client$get(paste0(client$api_root, endpoint, query))
# 
# # Include only GF/F from the surface
# # It may be useful to split up the queries and rejoin them over multiple lines
# # Using the paste() or paste0() functions
# query <- paste(
#   "site_id=QU39",
#   "chla_flag=AV",
#   "date.year=2017",
#   "filter_type=GF/F",
#   "line_out_depth=0",
#   sep = "&"
# )
# client$get(paste0(client$api_root, endpoint, "?", query))
# 
# # Select only the columns I'm interested in
# query <- paste(
#   "site_id=QU39",
#   "chla_flag=AV",
#   "date.year=2017",
#   "filter_type=GF/F",
#   "line_out_depth=0",
#   "fields=date,chla,lab_technician",
#   sep = "&"
# )
# client$get(paste0(client$api_root, endpoint, "?", query))
# 
# # This looks good so now you can assign a variable and remove the limit
# query <- paste(
#   "site_id=QU39",
#   "chla_flag=AV",
#   "date.year=2017",
#   "filter_type=GF/F",
#   "line_out_depth=0",
#   "fields=date,chla,lab_technician",
#   "limit=-1",
#   sep = "&"
# )
# a_great_chl_query <- client$get(paste0(client$api_root, endpoint, "?", query))
# 
# plot(
#   a_great_chl_query$date,
#   a_great_chl_query$chla,
#   xlim = as.Date(c("2017-01-01", "2018-01-01")),
#   ylim = c(0, 5)
# )
# 

## ----sort, eval = FALSE-------------------------------------------------------
# endpoint <- "/eims/views/output/chlorophyll"
# query <- paste(
#   "fields=date,chla,site_id,line_out_depth",
#   "chla>0", # Note: added chla>0 to remove NA values
#   "date.year=2017",
#   "sort=-chla",
#   "limit=10",
#   sep = "&"
# )
# top_10_chl <- client$get(paste0(client$api_root, endpoint, "?", query))


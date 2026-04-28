# Fetch CKAN metadata for an ATO dataset

Returns structured metadata for any ATO dataset on data.gov.au: title,
notes, licence, last-modified timestamp, resource count, and all
resource URLs. Useful for detecting silent updates before clearing the
cache, or for auditing what version of data you have.

## Usage

``` r
ato_meta(x)
```

## Arguments

- x:

  Either an `ato_tbl` (as returned by any `ato_*` data function) or a
  character CKAN package ID / slug (e.g.
  `"taxation-statistics-2022-23"`, `"corporate-transparency"`).

## Value

A list with elements:

- `id`: CKAN package slug

- `title`: human-readable title

- `notes`: dataset description (truncated to 400 chars)

- `licence`: licence title

- `metadata_modified`: ISO timestamp of last CKAN update

- `n_resources`: number of downloadable files

- `resource_urls`: character vector of all resource URLs

## See also

Other configuration:
[`ato_cache_info()`](https://charlescoverdale.github.io/ato/reference/ato_cache_info.md),
[`ato_clear_cache()`](https://charlescoverdale.github.io/ato/reference/ato_clear_cache.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  # By package ID
  m <- ato_meta("taxation-statistics-2022-23")
  m$metadata_modified

  # From an ato_tbl
  tbl <- ato_individuals(year = "2022-23")
  ato_meta(tbl)
})
#> $id
#> [1] "taxation-statistics-2022-23"
#> 
#> $title
#> [1] "Taxation Statistics 2022-23"
#> 
#> $notes
#> [1] "Taxation statistics: an overview of the income and tax status of Australian individuals, companies, partnerships, trusts and funds for 2022-23.\r\n\r\nFor more info see: https://www.ato.gov.au/About-ATO/Research-and-statistics/In-detail/Taxation-statistics/Taxation-statistics-2022-23/"
#> 
#> $licence
#> [1] "Creative Commons Attribution 2.5 Australia"
#> 
#> $metadata_modified
#> [1] "2026-04-22T01:04:01.567536"
#> 
#> $n_resources
#> [1] 96
#> 
#> $resource_urls
#>  [1] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/09f7e9cf-d14e-4b48-a84b-bb94e16f2437/download/taxstats2023index.xlsx"                                                      
#>  [2] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5931887-8d4f-48a8-89ab-571ca0d56bc7/download/ts23snapshot01historicalratesofpersonalincometax.xlsx"                       
#>  [3] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4da5ecec-3d93-4454-9a56-6d998895452d/download/ts23snapshot02historicalratesofcompanyincometax.xlsx"                        
#>  [4] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f0de2ae5-07fa-4b0b-8091-6b6c90b617ff/download/ts23snapshot03selectedtaxationitemsbyindustry.xlsx"                          
#>  [5] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a25c5633-a13b-44d5-ad83-3f692a6b09f8/download/ts23snapshot04allsummarytables.xlsx"                                         
#>  [6] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0776de48-d58f-42da-b97c-04aeaf6c5a35/download/ts23snapshot05indexofchartdata.xlsx"                                         
#>  [7] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/564ffe56-ec58-4ebc-a004-bc618a32e8e3/download/ts23snapshot06entitycounts.xlsx"                                             
#>  [8] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/1dfcc611-9f62-4679-a4cb-d4c3df8af4b4/download/ts23snapshot07stateindividualsstatepostcodeoccupationstats.xlsx"             
#>  [9] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a42a1acc-0eba-48f1-af87-6d147dbfa8f1/download/how-we-calculate-industry-benchmarks.xlsx"                                   
#> [10] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b4edf378-84cd-4685-8978-338d3d453250/download/ts23financialratios1individuals.xlsx"                                        
#> [11] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/5565d6ab-9e53-43c5-b4a7-17d1dd9414b6/download/ts23financialratios2companies.xlsx"                                          
#> [12] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a560da14-2771-4e98-966d-d14b56d48cad/download/ts23financialratios3partnerships.xlsx"                                       
#> [13] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b7dacde3-e0e5-41b7-97f4-e86a9f0b0a61/download/ts23financialratios4trusts.xlsx"                                             
#> [14] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b1308487-883e-407e-af33-6ebdf7a049b4/download/ts23financialratios5allentities.xlsx"                                        
#> [15] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/deb252af-a682-410b-861f-be48a10ff45c/download/ts23activitystatementratios1individuals.xlsx"                                
#> [16] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/46cdff78-a46d-4e0c-bd15-d2f7feb0f442/download/ts23activitystatementratios2companies.xlsx"                                  
#> [17] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a0fc81a1-b46d-49e2-b905-36482b560e01/download/ts23activitystatementratios3partnerships.xlsx"                               
#> [18] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/e4110319-a2d6-4f30-a68c-d439f372f0cf/download/ts23activitystatementratios4trusts.xlsx"                                     
#> [19] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/59ca5523-0c66-4026-9067-1725c3febbd0/download/ts23activitystatementratios5allentities.xlsx"                                
#> [20] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f4a2a02f-92ca-49b4-bf4f-990e2226b687/download/ts23individual01byyear.xlsx"                                                 
#> [21] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5730d59-1bee-4b74-a8d1-85602230f4e9/download/ts23individual02lodgmentmethodsextaxablestatusstateageyear.xlsx"             
#> [22] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a7f8226a-af03-431a-80f3-cdca85a9d63e/download/ts23individual03sextaxablestatusagerangetaxableincomerange.xlsx"             
#> [23] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/2f1a3673-e9ef-445c-9534-9ef8fb09f97c/download/ts23individual04sextaxablestatusstatetaxableincomerange.xlsx"                
#> [24] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/299f24c6-c270-4081-96c3-433f81361752/download/ts23individual05sexstatebroadindustry.xlsx"                                  
#> [25] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/9ab2e787-6447-468f-9d83-c6294d4ec919/download/ts23individual06taxablestatusstatesa4postcode.xlsx"                          
#> [26] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/6a80da31-8f46-4b09-bb88-6a3361b43e11/download/ts23individual07statesa4postcodetaxableincomerangeagerangeoccupation.xlsx"   
#> [27] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/e4b8c6b4-1185-4be6-9bd7-cf4385934d00/download/ts23individual08medianaveragetaxableincomestatepostcode.xlsx"                
#> [28] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/bb57e491-48bd-41f2-b89a-fee7c1157fbe/download/ts23individual09broadindustryfineindustryentitysize.xlsx"                    
#> [29] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f6ba6059-de8f-45a9-adb2-5aadd778e2a2/download/ts23individual10taxableincometotalincome.xlsx"                               
#> [30] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/dc3df075-0386-4df5-9d55-49fa7986b014/download/ts23individual11residencylodgmentmethod.xlsx"                                
#> [31] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a1c89d52-a772-4b2c-836e-cdd2ba47de54/download/ts23individual12taxablestatusresidencytaxableincome.xlsx"                    
#> [32] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/cac45d1c-389b-44d4-a39d-b0fc97b7ddbc/download/ts23individual13sexageresidencytaxassessmentrange.xlsx"                      
#> [33] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/93c814d6-30f9-488c-bd39-0f25ab5477b3/download/ts23individual14occupationsextaxableincomerange.xlsx"                        
#> [34] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/bc151e9e-8475-4d22-a0c4-c0f88242850e/download/ts23individual15occupationsex.xlsx"                                          
#> [35] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/3338e94c-d3b8-433f-84ea-ce10debac47a/download/ts23individual16percentiledistributionontaxableincomebysexstate.xlsx"        
#> [36] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/af5d7196-b172-4775-aa92-7b238498e729/download/ts23individual17withtotalbusincomebysexstateagetaxableincome.xlsx"           
#> [37] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/efc5bf3a-64c4-4cb2-b30f-a57c4f9cb35a/download/ts23individual18deductionclaimedstateoccupationgender.xlsx"                  
#> [38] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/08c9609d-8ed3-4fc5-87a4-134655132a6c/download/ts23individual19onehundredpeople.xlsx"                                       
#> [39] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4228eb8a-8f2a-416f-8d1e-da50e3152047/download/ts23individual20contributionsttoaprafundsbyyear.xlsx"                        
#> [40] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/19d31fad-dd39-47c7-b0b4-3a494669c777/download/ts23individual21contributionstosmsfsbyyear.xlsx"                             
#> [41] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4476280e-63e1-4e4d-b7b1-60aed4e2f281/download/ts23individual22contributionsbytotalaccountbalancetaxableincomeage.xlsx"     
#> [42] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0bec4bc1-79f5-4c56-94ba-7f250b360256/download/ts23individual23contributionsbyagesextaxableincome.xlsx"                     
#> [43] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b00a5b3d-e531-4da0-90a7-af88a45e9aef/download/ts23individual24contributionsbystatesexage.xlsx"                             
#> [44] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/2b6e0599-ad64-4663-ac5b-518f39487823/download/ts23individual25countaveragemedianbypostcode.csv"                            
#> [45] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/348ce605-5c2b-45fe-a862-b4c77923288b/download/ts23individual26rentalpropertyschedules.xlsx"                                
#> [46] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/bf075e6e-3ee2-4472-8764-7d65df285bc5/download/ts23individual27rentalpropertyinterestsbytxblincmstateterritoryageyear.xlsx" 
#> [47] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/efa462e1-988c-427f-8d46-9e9fab1978c9/download/variables-in-2022-23-sample-file.xlsx"                                       
#> [48] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f5167274-f2b8-432f-b444-c6b0fc176e9a/download/ts23company01selecteditemsbyyear.xlsx"                                       
#> [49] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/35488171-3598-41af-b97f-b281158e9027/download/ts23company02nettaxandcompanytype.xlsx"                                      
#> [50] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0613cf2d-4015-48bb-afc8-4b7559ea26f5/download/ts23company03taxableincometaxablestatuscompanytype.xlsx"                     
#> [51] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/9c343469-7fa4-450c-8e96-b7fcee2eaad8/download/ts23company04industry.xlsx"                                                  
#> [52] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/2a2b576d-a59a-4889-96ff-9d03df834a6d/download/ts23company05keyitembyindustrybyyear.xlsx"                                   
#> [53] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/dbaee032-aa1f-4802-a53d-c69e7db72902/download/ts23company06financialratioscompanysizetaxablestatusprofitbroadindustry.xlsx"
#> [54] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/9427c486-5fbc-4d55-8b3e-d2b10aa50a88/download/ts23company07taxablestatuscompanytypecompanysize.xlsx"                       
#> [55] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/d99deaff-2473-4626-b584-3b8558b828af/download/ts23company08companysizeandtaxableincome.xlsx"                               
#> [56] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b66408ab-6d1c-47e3-a546-eb272de513a9/download/ts23company09internationalrelatedpartydealingsmultiyear.xlsx"                
#> [57] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a286ac7c-9adb-444b-9bb1-ef2814552f21/download/ts23fund01aprasbyyear.xlsx"                                                  
#> [58] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/e3cf6026-4241-496a-8eb7-19dc7a7c1f09/download/ts23fund02smsfbyyear.xlsx"                                                   
#> [59] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/2de18b4e-ac37-43b3-a6c6-b3f18efefd49/download/ts23fund03taxableincome.xlsx"                                                
#> [60] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/7182f994-0b9b-4ae6-8e58-f4d5a25a9aec/download/ts23fund04totalincome.xlsx"                                                  
#> [61] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/75666a6e-052b-4b6d-be4a-de66e78317c9/download/ts23partnerships01byyear.xlsx"                                               
#> [62] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/d6a4a533-8c1e-4cd0-a92c-08d6db56a5c2/download/ts23partnerships02netincome.xlsx"                                            
#> [63] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0d0d1ad5-6bf7-4962-84f1-72f8050fef61/download/ts23partnerships03industry.xlsx"                                             
#> [64] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0c58c9c0-02f4-45f9-86b7-2c4580a5dbfc/download/ts23partnerships04sizeindustry.xlsx"                                         
#> [65] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/3e2cfa28-bf60-4592-bf67-6bd645849740/download/ts23partnerships05rentalpropertyschedule.xlsx"                               
#> [66] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/69579c51-2a92-49f1-befd-74366ab2dcfb/download/ts23trusts01byyear.xlsx"                                                     
#> [67] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/6b667234-1763-48de-a532-7e301988d483/download/ts23trusts02netincomerange.xlsx"                                             
#> [68] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/d063a25d-2e13-44cd-a71a-a04814a4febd/download/ts23trusts03industry.xlsx"                                                   
#> [69] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/e1693662-f571-4707-97c3-267f7c18016c/download/ts23trusts04truststype.xlsx"                                                 
#> [70] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/717ceac5-eaf1-4fca-9533-7dccde120acf/download/ts23trusts05sizeindustry.xlsx"                                               
#> [71] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/ff37a722-b813-47a2-b492-ce6a4e565d56/download/ts23trusts06rentalpropertyschedule.xlsx"                                     
#> [72] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/62880995-be92-4adf-883b-cd6023f263e0/download/ts23trusts07amit.xlsx"                                                       
#> [73] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/933a123c-d1a2-478d-81d3-929099972f3a/download/ts23cgt01selecteditemsmultiyearbyentity.xlsx"                                
#> [74] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/8ebcc9a7-9b4d-4f51-9228-eb75def9bf32/download/ts23cgt02netcapitalgainsbyentitytaxstatusgains.xlsx"                         
#> [75] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/b73b6ab3-41f7-49c1-ae76-c4290f61d862/download/ts23gst01gstwetlctbyyearmonth.xlsx"                                          
#> [76] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/692c0673-e14b-48f9-80a1-aa54e1a536a5/download/ts23gst02netgstamountbyyear.xlsx"                                            
#> [77] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4e58cf53-1b43-4904-84f5-2afb0ecf9380/download/ts23gst03wetlctbyrangeofliability.xlsx"                                      
#> [78] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/678e9689-38b9-49ae-b149-58378e5bf8f1/download/ts23gst04byindustry.xlsx"                                                    
#> [79] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0986a5c1-dd83-46a6-b665-31b82f854a89/download/ts23gst05prrtbyyear.xlsx"                                                    
#> [80] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f955281b-8ff6-45a9-a804-bad1b79e7817/download/ts23fbt01selecteditemsbyyear.xlsx"                                           
#> [81] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/ad979e11-80a2-4491-be4e-4814c167cfaf/download/ts23fbt02selecteditemsbyindustrytaxablestatus.xlsx"                          
#> [82] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4fbe04ab-815c-4a0c-aeed-b9efd540b2b6/download/ts23fbt03selecteditemsbyrangesoffbt.xlsx"                                    
#> [83] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/1e8aff9a-231b-4f0c-b1aa-8df226ff6a9b/download/ts23excise01liabilitiesbyyear.xlsx"                                          
#> [84] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f52750a3-0069-4e0e-b423-4f4d49672e7b/download/ts23excise02monthlybeerexcisebyyear.xlsx"                                    
#> [85] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/89194735-49e3-4889-bc67-88ff5a198a2a/download/ts23excise03beerexcisablequantitiesbyyear.xlsx"                              
#> [86] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/15d2e3e2-d881-4a24-bc9f-86768e09c03d/download/ts23excise04ftcbyindustryyear.xlsx"                                          
#> [87] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/4732092e-dfc9-429c-999d-a84e54b25d48/download/ts23excise05psobyyear.xlsx"                                                  
#> [88] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/db302f15-59e7-409f-807a-82c808e1d04e/download/ts23payg01payasyougowitholding.xlsx"                                         
#> [89] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/59775abd-dd9e-4f8a-ad3e-cbb97c699637/download/ts23payg02payasyougoinstalments.xlsx"                                        
#> [90] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/174388af-e74e-4539-a989-67b17eb60712/download/ts23coc01allformsbyincomeyear.xlsx"                                          
#> [91] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/8b57f57c-f079-49f0-befe-052480f6701a/download/ts23coc02lodgmentmethodbusinessincome.xlsx"                                  
#> [92] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/8226223f-8493-4535-8575-031417eb4d35/download/ts23coc03fbtandbasstatements.xlsx"                                           
#> [93] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/5f1ade59-b0ce-439c-9ce3-eaea6eed4957/download/ts23charities01refundablefrankingcredits.xlsx"                               
#> [94] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/47a1f082-b991-436f-a087-bb873c73feb6/download/ts23charities02employeesoftaxconcessioncharities.xlsx"                       
#> [95] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/76dc7674-56be-4a8c-b01e-a3daefdd4f77/download/ts23charities03deductiblegiftrecipients.xlsx"                                
#> [96] "https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/10145889-8e82-4093-9620-fce2672fc34a/download/ts23charities04privatepublicancillaryfunds.xlsx"                             
#> 
options(op)
# }
```

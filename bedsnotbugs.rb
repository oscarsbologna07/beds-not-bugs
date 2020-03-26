require "net/http"
require "json"
require "csv"
require "date"

uri = URI("https://services1.arcgis.com/CY1LXxl9zlJeBuRZ/arcgis/rest/services/Florida_Hospital_Services_March_2020/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=standard&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=standard&f=pjson&token=")
raw = Net::HTTP.get(uri)
json = JSON.parse(raw)

total_bed_count = json["features"].sum { _1["attributes"]["Licensed_Beds"] }

counties = json["features"].group_by { _1["attributes"]["Street_County"] }

beds_per_county = counties.each_with_object({}) do |(key, value), store|
  key = "Dade" if key == "Miami-Dade"
  store["#{key}"] = { beds: value.sum { _1["attributes"]["Licensed_Beds"] } }
end

indiv_uri = URI "https://services1.arcgis.com/CY1LXxl9zlJeBuRZ/arcgis/rest/services/Florida_COVID19_Case_Line_Data/FeatureServer/0/query?where=1%3D1&objectIds=&time=&resultType=none&outFields=*&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&sqlFormat=none&f=pjson&token="
indiv_raw = Net::HTTP.get(indiv_uri)
indiv_json = JSON.parse(indiv_raw)

county_grouped_individuals = indiv_json["features"].group_by { _1["attributes"]["County"] }
hospitalized_by_county = county_grouped_individuals.each_with_object({}) do |(key, value), store|
  store["#{key}"] = { hospitalized: value.select { _1["attributes"]["Hospitalized"] == "Yes" }.count }
end
total_beds_used = hospitalized_by_county.sum { |county, data| data[:hospitalized] }

utilization = hospitalized_by_county.merge(beds_per_county) do |key, hospitalized, beds|
  hospitalized.merge(beds)
end

percentage = utilization.each_with_object({}) do |(county, data), store|
  if data[:beds].nil? or data[:hospitalized].nil?
    store["#{county}"] = data
  else
    percentage = (data[:hospitalized].fdiv(data[:beds]) * 100).round(2)
    store["#{county}"] = data.merge(percentage: percentage)
  end
end

puts "Total hospitalizations in Florida: #{total_beds_used}"
pp percentage



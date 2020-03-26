# Beds Not Bugs

Calculate hospital bed utilization by comparing state-level hospital bed
data to COVID-19 hospitalization data from FDOH.

## Installation

You'll need the Ruby version listed in `.ruby-version` to be installed for
this script to run.

## Usage

- `ruby bedsnotbugs.rb`


## Output (as of 2020-03-26)

```ruby
$ ruby bedsnotbugs.rb
Total hospitalizations in Florida: 372
{"Orange"=>{:hospitalized=>25, :beds=>4751, :percentage=>0.53},
 "St. Lucie"=>{:hospitalized=>0, :beds=>873, :percentage=>0.0},
 "Dade"=>{:hospitalized=>55, :beds=>9455, :percentage=>0.58},
 "Palm Beach"=>{:hospitalized=>24, :beds=>4332, :percentage=>0.55},
 "Alachua"=>{:hospitalized=>5, :beds=>1635, :percentage=>0.31},
 "Hillsborough"=>{:hospitalized=>12, :beds=>4326, :percentage=>0.28},
 "Broward"=>{:hospitalized=>63, :beds=>6816, :percentage=>0.92},
 "Hernando"=>{:hospitalized=>0, :beds=>740, :percentage=>0.0},
 "Okaloosa"=>{:hospitalized=>3, :beds=>470, :percentage=>0.64},
 "Manatee"=>{:hospitalized=>10, :beds=>895, :percentage=>1.12},
 "Pasco"=>{:hospitalized=>4, :beds=>1469, :percentage=>0.27},
 "Escambia"=>{:hospitalized=>0, :beds=>1648, :percentage=>0.0},
 "Leon"=>{:hospitalized=>2, :beds=>1208, :percentage=>0.17},
 "Santa Rosa"=>{:hospitalized=>5, :beds=>355, :percentage=>1.41},
 "St. Johns"=>{:hospitalized=>9, :beds=>335, :percentage=>2.69},
 "Highlands"=>{:hospitalized=>1, :beds=>306, :percentage=>0.33},
 "Sumter"=>{:hospitalized=>7, :beds=>347, :percentage=>2.02},
 "Volusia"=>{:hospitalized=>8, :beds=>1563, :percentage=>0.51},
 "Osceola"=>{:hospitalized=>12, :beds=>1027, :percentage=>1.17},
 "Seminole"=>{:hospitalized=>12, :beds=>944, :percentage=>1.27},
 "Lake"=>{:hospitalized=>6, :beds=>872, :percentage=>0.69},
 "Collier"=>{:hospitalized=>8, :beds=>1055, :percentage=>0.76},
 "Pinellas"=>{:hospitalized=>16, :beds=>3939, :percentage=>0.41},
 "Clay"=>{:hospitalized=>9, :beds=>503, :percentage=>1.79},
 "Lee"=>{:hospitalized=>18, :beds=>2074, :percentage=>0.87},
 "Duval"=>{:hospitalized=>16, :beds=>3871, :percentage=>0.41},
 "Nassau"=>{:hospitalized=>1, :beds=>62, :percentage=>1.61},
 "Citrus"=>{:hospitalized=>2, :beds=>332, :percentage=>0.6},
 "Sarasota"=>{:hospitalized=>14, :beds=>1542, :percentage=>0.91},
 "Polk"=>{:hospitalized=>9, :beds=>1797, :percentage=>0.5},
 "Flagler"=>{:hospitalized=>1, :beds=>99, :percentage=>1.01},
 "Martin"=>{:hospitalized=>0, :beds=>488, :percentage=>0.0},
 "Walton"=>{:hospitalized=>4, :beds=>136, :percentage=>2.94},
 "Brevard"=>{:hospitalized=>2, :beds=>1907, :percentage=>0.1},
 "Marion"=>{:hospitalized=>0, :beds=>1054, :percentage=>0.0},
 "Monroe"=>{:hospitalized=>3, :beds=>196, :percentage=>1.53},
 "Indian River"=>{:hospitalized=>1, :beds=>566, :percentage=>0.18},
 "Putnam"=>{:hospitalized=>0, :beds=>99, :percentage=>0.0},
 "Baker"=>{:hospitalized=>2, :beds=>1163, :percentage=>0.17},
 "Desoto"=>{:hospitalized=>0, :beds=>49, :percentage=>0.0},
 "Gadsden"=>{:hospitalized=>0, :beds=>953, :percentage=>0.0},
 "Columbia"=>{:hospitalized=>0, :beds=>190, :percentage=>0.0},
 "Bay"=>{:hospitalized=>1, :beds=>737, :percentage=>0.14},
 "Charlotte"=>{:hospitalized=>1, :beds=>715, :percentage=>0.14},
 "Jackson"=>{:hospitalized=>0, :beds=>125, :percentage=>0.0},
 "Bradford"=>{:hospitalized=>1, :beds=>49, :percentage=>2.04},
 "Hardee"=>{:beds=>25},
 "Gulf"=>{:beds=>19},
 "Calhoun"=>{:beds=>25},
 "Holmes"=>{:beds=>20},
 "Taylor"=>{:beds=>48},
 "Franklin"=>{:beds=>25},
 "Hendry"=>{:beds=>25},
 "Union"=>{:beds=>145},
 "Madison"=>{:beds=>25},
 "Washington"=>{:beds=>59},
 "Okeechobee"=>{:beds=>100},
 "Suwannee"=>{:beds=>25}}
 ```

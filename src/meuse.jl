# -----------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# -----------------------------------------------------------------

"""
    Meuse

The Meuse dataset is a classic geostatistical dataset used to study 
spatial variation in topsoil heavy metal concentrations. It contains 
155 observations collected in a floodplain of the river Meuse near 
Stein, Netherlands.

## Functions

* [`Meuse.load`](@ref)

## Reference

* Burrough, P.A. and McDonnell, R.A. (1998) Principles of 
  Geographical Information Systems. Oxford University Press.
"""
module Meuse

using GeoIO
using DataDeps

"""
    Meuse.load(; kwargs...)

(Down)load the Meuse dataset and return a `GeoTable`.
`kwargs` are passed to the `GeoIO.load` function.
"""
function load(; kwargs...)
  ID = "Meuse"
  url = "https://raw.githubusercontent.com/mhaffner/data/master/meuse.csv"
  
  dir = try
    @datadep_str ID
  catch
    register(DataDep(
      ID,
      """
      Geographic data from the Meuse river floodplain.
      Source: $url
      """,
      url,
      Any
    ))
    @datadep_str ID
  end

  path = joinpath(dir, "meuse.csv")
  GeoIO.load(path; kwargs...)
end

end

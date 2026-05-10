using GeoArtifacts
using Meshes
using Test

@testset "GeoArtifacts.jl" begin
  @testset "GADM" begin
    gtb = GADM.get("SVN", depth=1)
    @test length(gtb.geometry) == 12

    gtb = GADM.get("QAT", depth=1)
    @test length(gtb.geometry) == 7

    gtb = GADM.get("ISR", depth=1)
    @test length(gtb.geometry) == 7

    @test_throws ArgumentError GADM.download("ZZZ")
    @test_throws ArgumentError GADM.download("BRA"; version=v"9.9")
  end

  @testset "NaturalEarth" begin
    gtb = NaturalEarth.countries()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.countries(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.borders()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1
    gtb = NaturalEarth.borders(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.states()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.states(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.counties()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.populatedplaces()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 0
    gtb = NaturalEarth.populatedplaces(scale="1:50")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 0

    gtb = NaturalEarth.roads()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.railroads()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.airports()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 0

    gtb = NaturalEarth.ports()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 0

    gtb = NaturalEarth.urbanareas()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.urbanareas(scale="1:50")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.usparks()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.timezones()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.coastlines()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1
    gtb = NaturalEarth.coastlines(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.lands()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.lands(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.minorislands()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.reefs()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.oceans()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.oceans(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.rivers()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1
    gtb = NaturalEarth.rivers(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.lakes()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.lakes(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.physicallabels()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.physicallabels(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.playas()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.playas(scale="1:50")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.glaciatedareas()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.glaciatedareas(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.iceshelves()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.iceshelves(scale="1:50")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.bathymetry()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.geographiclines()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1
    gtb = NaturalEarth.geographiclines(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.graticules()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1
    gtb = NaturalEarth.graticules(scale="1:110")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 1

    gtb = NaturalEarth.hypsometrictints()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.hypsometrictints(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.naturalearth1()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.naturalearth1(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.naturalearth2()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.naturalearth2(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.oceanbottom()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.oceanbottom(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.shadedrelief()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.shadedrelief(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.grayearth()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2
    gtb = NaturalEarth.grayearth(scale="1:50")
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.usmanualshadedrelief()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.manualshadedrelief()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    gtb = NaturalEarth.prismashadedrelief()
    @test gtb.geometry isa Grid
    @test paramdim(gtb.geometry) == 2

    @testset "variant validation" begin
      badscale = "1:999"

      @test_throws ArgumentError NaturalEarth.download(badscale, "", "")

      for variant in (
        "nolakes", "iso", "toplevel", "ARG", "BDG", "BRA", "CHN", "EGY",
        "FRA", "DEU", "GRC", "IDN", "IND", "ISO", "ISR", "ITA", "JPN",
        "KOR", "MAR", "NEP", "NLD", "PAK", "POL", "PRT", "PSE", "RUS",
        "SAU", "ESP", "SWE", "TUR", "TWN", "GBR", "USA", "UKR", "VNM"
      )
        @test_throws ArgumentError NaturalEarth.countries(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.countries("unknown")

      for variant in ("mapunit", "maritme", "maritimechn", "pacific")
        @test_throws ArgumentError NaturalEarth.borders(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.borders("unknown")

      for variant in ("ranks", "nolakes", "borders")
        @test_throws ArgumentError NaturalEarth.states(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.states("unknown")

      for variant in ("nolakes", "ranks", "ranksislands")
        @test_throws ArgumentError NaturalEarth.counties(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.counties("unknown")

      @test_throws ArgumentError NaturalEarth.populatedplaces("simple"; scale=badscale)
      @test_throws ArgumentError NaturalEarth.populatedplaces("unknown")

      @test_throws ArgumentError NaturalEarth.roads("northamerica"; scale=badscale)
      @test_throws ArgumentError NaturalEarth.roads("unknown")

      @test_throws ArgumentError NaturalEarth.railroads("northamerica"; scale=badscale)
      @test_throws ArgumentError NaturalEarth.railroads("unknown")

      for variant in ("ranks",)
        @test_throws ArgumentError NaturalEarth.lands(variant; scale=badscale)
        @test_throws ArgumentError NaturalEarth.oceans(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.lands("unknown")
      @test_throws ArgumentError NaturalEarth.minorislands("coastline"; scale=badscale)
      @test_throws ArgumentError NaturalEarth.minorislands("unknown")
      @test_throws ArgumentError NaturalEarth.oceans("unknown")

      for variant in ("ranks", "australia", "europe", "northamerica")
        @test_throws ArgumentError NaturalEarth.rivers(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.rivers("unknown")

      for variant in ("historic", "pluvial", "australia", "europe", "northamerica")
        @test_throws ArgumentError NaturalEarth.lakes(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.lakes("unknown")

      for variant in ("points", "elevationpoints", "marineareas")
        @test_throws ArgumentError NaturalEarth.physicallabels(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.physicallabels("unknown")

      @test_throws ArgumentError NaturalEarth.iceshelves("borders"; scale=badscale)
      @test_throws ArgumentError NaturalEarth.iceshelves("unknown")

      for variant in ("0", "200", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000", "10000")
        @test_throws ArgumentError NaturalEarth.bathymetry(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.bathymetry("unknown")

      for variant in ("1", "5", "10", "15", "20", "30", "boundingbox")
        @test_throws ArgumentError NaturalEarth.graticules(variant; scale=badscale)
      end
      @test_throws ArgumentError NaturalEarth.graticules("unknown")

      for size in ("large", "medium", "small")
        @test_throws ArgumentError NaturalEarth.hypsometrictints(scale=badscale, size=size)
        @test_throws ArgumentError NaturalEarth.naturalearth1(scale=badscale, size=size)
        @test_throws ArgumentError NaturalEarth.naturalearth2(scale=badscale, size=size)
        @test_throws ArgumentError NaturalEarth.shadedrelief(scale=badscale, size=size)
        @test_throws ArgumentError NaturalEarth.grayearth(scale=badscale, size=size)
      end

      for variant in ("relief", "water", "drainages")
        @test_throws ArgumentError NaturalEarth.naturalearth1(variant; scale=badscale)
        @test_throws ArgumentError NaturalEarth.naturalearth2(variant; scale=badscale)
      end

      for variant in ("relief", "water", "drainages", "oceanbottom")
        @test_throws ArgumentError NaturalEarth.hypsometrictints(variant; scale=badscale)
        @test_throws ArgumentError NaturalEarth.grayearth(variant; scale=badscale)
      end

      @test_throws ArgumentError NaturalEarth.hypsometrictints(size="unknown")
      @test_throws ArgumentError NaturalEarth.hypsometrictints("unknown")
      @test_throws ArgumentError NaturalEarth.naturalearth1(size="unknown")
      @test_throws ArgumentError NaturalEarth.naturalearth1("unknown")
      @test_throws ArgumentError NaturalEarth.naturalearth2(size="unknown")
      @test_throws ArgumentError NaturalEarth.naturalearth2("unknown")
      @test_throws ArgumentError NaturalEarth.shadedrelief(size="unknown")
      @test_throws ArgumentError NaturalEarth.grayearth(size="unknown")
      @test_throws ArgumentError NaturalEarth.grayearth("unknown")

      @test NaturalEarth.rreaddir(mktempdir()) == String[]
    end
  end

  @testset "GeoBR" begin
    gtb = GeoBR.state()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = GeoBR.state("RJ")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.municipality()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2
    gtb = GeoBR.municipality("RJ")
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.region()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.country()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.amazon()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.biomes()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.disasterriskarea()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 2

    gtb = GeoBR.healthfacilities()
    @test gtb.geometry isa GeometrySet
    @test paramdim(gtb.geometry) == 0

    # these tests are passing locally but are breaking in CI
    # gtb = GeoBR.indigenousland()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.metroarea()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.neighborhood()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.urbanarea()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.weightingarea("RJ")
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.mesoregion("RJ")
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.microregion("RJ")
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.intermediateregion("RJ")
    # @test gtb.geometry isa SubDomain
    # @test paramdim(gtb.geometry) == 2
    # gtb = GeoBR.intermediateregion(3301)
    # @test gtb.geometry isa SubDomain
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.immediateregion("RJ")
    # @test gtb.geometry isa SubDomain
    # @test paramdim(gtb.geometry) == 2
    # gtb = GeoBR.immediateregion(330001)
    # @test gtb.geometry isa SubDomain
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.municipalseat()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 0

    # gtb = GeoBR.censustract("RJ")
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.statisticalgrid("RJ")
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.conservationunits()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.semiarid()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.schools()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 0

    # gtb = GeoBR.comparableareas()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2
    # gtb = GeoBR.comparableareas(startyear=2000, endyear=2010)
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.urbanconcentrations()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.poparrangements()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    # gtb = GeoBR.healthregion()
    # @test gtb.geometry isa GeometrySet
    # @test paramdim(gtb.geometry) == 2

    @test_throws ArgumentError GeoBR.download("metadata.csv"; version=v"9.9.9")
    @test_throws ArgumentError GeoBR.metadata(version=v"9.9.9")
    @test_throws ArgumentError GeoBR.get("not-a-geobr-entity", 2020)
  end
end

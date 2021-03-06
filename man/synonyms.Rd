% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/synonyms.R
\name{synonyms}
\alias{synonyms}
\title{synonyms}
\usage{
synonyms(species_list, limit = 50, server = getOption("FISHBASE_API",
  FISHBASE_API), fields = c("SynGenus", "SynSpecies", "Valid", "Misspelling",
  "Status", "Synonymy", "Combination", "SpecCode", "SynCode", "CoL_ID", "TSN",
  "WoRMS_ID"))
}
\arguments{
\item{species_list}{A vector of scientific names (each element as "genus species"). If empty, the table will be loaded up to the limit. This makes it possible to load an entire table without knowledge of the species in the table, thus avoiding uneccesary API calls.}

\item{limit}{The maximum number of matches from a single API call (e.g. per species). Function
will warn if this needs to be increased, otherwise can be left as is.}

\item{server}{base URL to the FishBase API (by default). For SeaLifeBase, use https://fishbase.ropensci.org/sealifebase}

\item{fields}{a character vector specifying which fields (columns) should be returned. By default,
all available columns recognized by the parser are returned. This option can be used to limit the amount
of data transfered over the network if only certain columns are needed.}
}
\value{
A table with information about the synonym. Will generally be only a single
row if a species name is given.  If a FishBase SpecCode is given, all synonyms matching
that SpecCode are shown, and the table indicates which one is Valid for FishBase. This may
or may not match the valid name for Catalog of Life (Col), also shown in the table. See examples for details.
}
\description{
Check for alternate versions of a scientific name
}
\details{
For further information on fields returned, see:
http://www.fishbase.org/manual/english/fishbasethe_synonyms_table.htm
}
\examples{
\dontrun{
# Query using a synonym:
synonyms("Callyodon muricatus")
 
 # Check for misspellings or alternate names
 x <- synonyms("Labroides dimidatus") # Species name misspelled
 species_list(SpecCode = x$SpecCode)  # correct: "Labroides dimidiatus"

 # See all synonyms using the SpecCode
 species("Bolbometopon muricatum", fields="SpecCode")[[1]]
 synonyms(5537)
 }
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VCF_Utils.R
\name{addSNPsToAlnDF}
\alias{addSNPsToAlnDF}
\title{Add SNPs and indels to an alignment data frame}
\usage{
addSNPsToAlnDF(aln_df, SNPs, seq_name = Transcript_ID,
  seq_pos = Codon_Number, effect = Effect,
  variant = Amino_Acid_Change, effect_order = SNPeff_order)
}
\arguments{
\item{aln_df}{an alignment data frame resulting from
\link[r1001genomes]{makeAlnDF}}

\item{SNPs}{a data frame of SNPs as returned from \link[r1001genomes]{getCodingDiv}}

\item{effect_order}{a \code{data.frame} containing an integer vector named 'strength' representing the strength of the effect, paired with a character vector named 'effect' of possible effects. This will be used to order single and multiple effects.}

\item{by_aln_SNPs}{a named list of character objects with each equivalency
representing matching columns in `aln_df` (on the LHS) and `SNPs`
(on the RHS), e.g. `"seq_name" = "transcript_id"`}
}
\value{
aln_df with the addition of a `variants` column containing a string
 listing the variant types at each position
}
\description{
Add SNPs and indels to an alignment data frame
}
\examples{
# make an alignment
IDs <- c("AT3G62980.1", "AT3G26810.1")
alignment <- alignCDS(IDs)
# make an alignment data frame
aln_df <- makeAlnDF(alignment[[2]])
# load a VCF list
vcf <- readRDS(file = system.file("shiny-app", "demo_VCFs.rds",
   package = "r1001genomes"))
vcf <- plyr::ldply(.data = vcf, .fun = subset,
  !is.na(Transcript_ID) & gt_GT != "0|0")
coding_vcf <- getCodingDiv(vcf)
addSNPsToAlnDF(aln_df = aln_df, SNPs = coding_vcf, seq_name = Transcript_ID,
seq_pos = Codon_Number)

}

import nimib, nimiSlides

nbInit(theme = revealTheme)
setSlidesTheme(Serif)


# Title Slide
slide:
  bigText: "Single Cell RNA Sequence Data: Quality Control"

# disableVerticalCentering()
nb.addStyle: """
:root {
--r-main-font-size: 36px;
--r-heading1-size: 60px;
--r-heading2-size: 56px;
--r-heading3-size: 52px;
--r-heading3-size: 48px;
--r-heading3-size: 46px;
}
"""

#################################################
# What
slide:
  nbText: "## What is single cell RNA sequencing?"
  # nbText: "# scRNA-seq"
  align("left"):
    nbText:"""
- Associate mRNA with cell of origin
- Which genes are transcribed in a single cell
- How much of a gene is transcribed in a single cell
"""


#################################################
# Why
slide:
  slide:
    nbText: """
# What scRNA can tell us?
- Identify new cell types
- Investigate developmental trajectories
- Understand the basis of tumor progression
- Characterize immune cell types
- Piece together gene regulatory networks
- And more
"""


#################################################
# How
slide:
  nbText: "# How to obtain scRNA?"
  align("left"):
    nbText:"""
1) Dissociate cells
2) Isolate single cells
3) Construct libraries from mRNA
4) Sequence libraries
"""
# Dissociate
slide: 
  nbText: "# Dissociate Cells"
  nbImage("images/dissociation.png")

slide: 
  nbText: "# Isolate Single Cells"
  nbImage("images/scrna-capture.png")

slide: 
  nbText: "# Construct Libraries"
  nbImage("images/scrna-barcode.png")

slide: 
  nbText: "# Sequence Libraries"
  nbImage("images/sequencer.png")
  nbImage("images/map.png")

slide:
  nbText: "# How to obtain scRNA?"
  align("left"):
    nbText:"""
1) Dissociate cells
2) Isolate single cells
3) Construct libraries from mRNA
4) Sequence libraries
"""

#################################################
# The Data 
slide:
  nbText: "# The Data"
  nbImage("images/matrix.png")


#################################################
# Challenges
slide:
  nbText: """
# Challenges
- Data are very noisy
- Prone to technical artifacts
"""


#################################################
# Quality Control
slide:
  nbText: "# Quality Control"
  align("left"):
    nbText: """
### Three primary components:
1. Number of counts per putative cell
    - Reads
    - Unique molecular identifiers (UMIs)
    - In reality may represent 0 cells or more than 1
2. Number genes per putative cell
3. Proportion of mitochondrial genes in putative cell

"""

#################################################
# Why filter mitochondria 
slide:
  nbText: "## Why you **should** filter cells with high mtDNA expression?"
  nbImage: "images/apoptosis.png"


#################################################
# Biological causes of high mt
# Invite audience participation
slide:
  # slide:
  nbText: "### Why you **should not** filter cells with high mtDNA expression?"
  align("left"):
    fragment:
      nbText: """
#### Cells can have high mtDNA expression for several other reasons:
- Larger cells
- High metabolic rate
  - Kidneys, muscles
- Malignant cells
"""


#################################################
# Quality Control
slide: 
  nbText: "# How to filter"
  fitImage("images/fraction-mito-corr.png")

#################################################
# Quality Control
slide: 
  slide:
    nbText: "# High Metabolic Activity"
    fitImage("images/ddqc-umap.png")
  slide:
    nbText: """
# Additional Resources
[Biology-inspired data-driven quality control for scientific discovery in single-cell transcriptomics - Subramanian et al. 2022](https://doi.org/10.1186/s13059-022-02820-w)
"""

#################################################
# Quality Control
slide: 
  slide:
    nbText: "# Malignant Cells"
    fitImage("images/yates.png")
  slide:
    nbText: """
# Additional Resources
[Filtering cells with high mitochondrial content removes viable metabolically altered malignant cell populations in cancer single-cell studies - Yates et al. 2022](https://doi.org/10.1101/2024.10.24.620025)
"""

#################################################
# Quality Control
slide: 
  slide:
    nbText: """
# miQC
- Models cell quality base on counts and proportion of mtDNA
- Estimates probabiliy for cell that can be used for filtering
"""
    fitImage("images/miqc.png")
  slide:
    nbText: """
# Additional Resources
[miQC: An adaptive probabilistic framework for quality control of single-cell RNA-sequencing data - Hippen et al. 2022](https://doi.org/10.1371/journal.pcbi.1009290)
"""

#################################################
# Quality Control
slide: 
  slide:
    nbText: """
# ddqc
- Tool facilitating the application of thresholds to clustered cells
- Iteratively cluster cells and apply thresholds to each cluster
- Requires UMIs

"""
  slide:
    nbText: """
# Additional Resources
[Biology-inspired data-driven quality control for scientific discovery in single-cell transcriptomics - Subramanian et al. 2022](https://doi.org/10.1186/s13059-022-02820-w)
"""

#################################################
# Quality Control
slide: 
  slide:
    nbText: """
# Alternative to proportion mtDNA
- MALAT1
- Intact cells have moderate to high levels MALAT1
- Not consistent across cell types 
"""
    fitImage("images/clark-bader.png")
  slide:
    nbText: """
# Additional Resources
[MALAT1 expression indicates cell quality in single-cell RNA sequencing data - Clark & Bader 2024](https://doi.org/10.1101/2024.07.14.603469)
"""

slide:
  slide:
    nbText: """
# Recommendations
- QC should be iterative
- Start with minimal filtering
- **Do not** select thresholds because they improve outcomes of statistical tests
  - Thre must be some other justification
  - Beware the garden of forking paths
  - Be transparent
- Data driven approaches seem better than simple threshold based approaches in many applications
- Additional evidence beyond mtDNA can be helpful
"""
  slide:
    nbText: """
[The garden of forking paths: Why multiple comparisons can be a problem, even when there is no “fishing expedition” or “p-hacking” and the research
hypothesis was posited ahead of time - Gelman & Loken 2013](http://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf)
"""




nbSave()



# In single-cell RNA-seq analysis, you are provided with a dataset where certain cell clusters are 
# consistently associated with high mitochondrial gene expression, while others show low overall 
# transcript counts. How would you approach identifying whether these patterns reflect true biological 
# signals or technical artifacts? What specific computational techniques and quality control metrics
#  would you apply, and how would you interpret the results in the context of downstream analyses?

# Please prepare your response with the goal of clearly teaching this concept to an audience. You 
# may assume your audience has some familiarity with computational biology but may not have direct 
# experience with this specific application. We are aware that you may not have direct experience 
# with this exact scenario as well, and we will take that into account during the evaluation process.
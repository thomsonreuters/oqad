![Thomson Reuters](http://cdn1.im.thomsonreuters.com/wp-content/themes/Im/images/tr-logo.png)
# Thomson Reuters QA Direct (QAD)

> GENERATE ALPHA FASTER WITH ACCESS TO UNRIVALED CONTENT:
>
> Thomson Reuters quantitative research tools and solutions give you industry-leading content, comprehensive data management capabilities and sophisticated analytical tools to help you identify differentiated insights faster and increase profits
> …
> 
> QA Direct maps information from all data vendors and allows you to access the data through the use of a single, unique identifier. Integration with other software and databases is easy, resulting in efficient data retrieval and analysis.
-- [QA Direct](http://im.thomsonreuters.com/solutions/quantitative-research-tools/qa-direct/)

# Thomson Reuters Open SDKs for QAD
While [QA Direct](http://thomsonreuters.com/products_services/financial/financial_products/a-z/QA_Direct/) does a great job of delivering [Thomson Reuters](http://www.thomsonreuters.com) (and third parties’) content to clients in an integrated yet flexible container, there is still a large amount of work users need to do to get that data into analytics platforms, of which the ["R" language](http://www.r-project.org) commands a large portion of the market.

Behind all the whiz-bang graphics and workflows of a tool like [QA Studio](http://im.thomsonreuters.com/solutions/quantitative-research-tools/qa-studio/) or ClariFI is exactly this sort of data surfacing. The availability of a complete set of R libraries to access the most commonly-used data in QA Direct allows clients to immediately unlock the data’s value. While our shrinkwrap quant desktop is QA Studio, we will still need to serve the market that has a large code base in R or similar tools and languages. It is the hope of this project that OQAD would satisfy that need.

OQAD is an effort to develop, test, and distribute of a set of open libraries, in R, for fundamentals, estimates, securities pricing, and macroeconomic data from QA Direct.  These libraries would lower the cost of entry for accessing QA Direct data.

Thomson Reuters provides the source for this software, as is.  We hope that QA Direct customers will find these libraries useful and that some may even contribute to the project by providing feedback, bug reports, and best of all code additions and improvements. 

This project offers an SDK for R today.  It is possible that other languages could be provided in the future, pending community interest and available resources.

# Getting Started
To work with this project, you can clone it from github, download a versioned archive.  

Alternatively, If you simply wish to use the RQAD R package, you can install it from CRAN.

	> install.packages("rqad")


## Directory Structure

OQAD has the following directory structure:

```
├── LICENSE.txt <- OQAD licnese
├── NOTICE.txt <- OQAD notices
├── R <- RQAD is here
├── README.txt <- OQAD README
├── java <- Not available, contributions welcome!
├── python <- Not available, contributions welcome!
└── sql <- Not available, contributions welcome

```

## Working with RQAD

See the [R/README](R/README.md) for how to get started with OQAD for R.


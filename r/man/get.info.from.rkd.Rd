\name{get.info.from.rkd}
\alias{get.info.from.rkd}
\title{Get Info from RKD}
\author{Ian MacGillivray}
\description{
This generic method will get info of any given description or COA code from RKD (specifically from RKDFndStdFinVal). A number of the most common types of information are abstracted into separate methods for convenience (e.g. Total Sales, Total Assets, Net Profit Margin), but any valid description or code may be passed to this method.
}
\usage{
get.info.from.rkd(dates, seccodes, type, quarterly=TRUE, most.recent=TRUE)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
\item{type}{Any valid description (see below) or COA code.}
\item{quarterly}{TRUE if quarterly data are to be returned, FALSE is annualised data are to be returned.}
\item{most.recent}{TRUE if most recent (as opposed to originally filed) results are required.}
}
\note{
Valid descriptions are as follows:

Accounts Payable
Accounts Receivable
Accounts Receivable - Trade, Gross
Accounts Receivable - Trade, Net
Accrued Expenses
Accumulated Depreciation, Total
Accumulated Intangible Amort, Suppl.
Accumulated Intangible Amortization
Acquisition of Business
Additional Paid-In Capital
Advertising Expense, Supplemental
All Other Fees
Amort of Intangibles, Supplemental
Amortization
Amortization of Intangibles
Audit Fees
Audit-Related Fees
Basic EPS after Stock Based Comp. Exp.
Basic EPS Excluding Extraordinary Items
Basic EPS Including Extraordinary Items
Basic Normalized EPS
Basic Weighted Average Shares
Buildings - Gross
Capital Expenditures
Capital Lease Obligations
Capital Lease Payments Due in 2-3 Years
Capital Lease Payments Due in Year 1
Capital Lease Payments Due in Year 2
Cash
Cash & Equivalents
Cash and Short Term Investments
Cash from Financing Activities
Cash from Investing Activities
Cash from Operating Activities
Cash Interest Paid
Cash Taxes Paid
Changes in Working Capital
Common Stock
Common Stock, Net
Common Stock, Total
Construction in Progress - Gross
Convertible Preferred Stock - Non Rdmbl
Cost of Revenue
Cost of Revenue, Total
Current Port. of  LT Debt/Capital Leases
Current Ratio
Current Tax - Domestic
Current Tax - Foreign
Current Tax - Local
Current Tax - Total
Customer Advances
Defered Income Tax - Long Term Asset
Deferred Income Tax
Deferred Income Tax - Current Asset
Deferred Income Tax - LT Liability
Deferred Revenue - Current
Deferred Revenue - Long Term
Deferred Tax - Domestic
Deferred Tax - Foreign
Deferred Tax - Local
Deferred Tax - Total
Deferred Taxes
Defined Contribution Expense - Domestic
Depreciation
Depreciation, Supplemental
Depreciation/Depletion
Diluted EPS after Stock Based Comp. Exp.
Diluted EPS Excluding ExtraOrd Items
Diluted EPS Including ExtraOrd Items
Diluted Net Income
Diluted Normalized EPS
Diluted Weighted Average Shares
Dilution Adjustment
Dividends per Share - Com Stock Issue 2
DPS - Common Stock Primary Issue
Effect of Special Items on Income Taxes
Effective Tax Rate
Employees
Financing Cash Flow Items
Foreign Exchange Effects
Gain (Loss) on Sale of Assets
Goodwill - Net
Goodwill, Net
Gross Dividends - Common Stock
Gross Margin
Gross Profit
Impairment-Assets Held for Sale
Impairment-Assets Held for Use, Suppl.
Inc Tax Ex Impact of Sp Items
Income Available to Com Excl ExtraOrd
Income Available to Com Incl ExtraOrd
Income Tax - Total
Income Taxes Payable
Intangibles - Gross
Intangibles - Net
Intangibles, Net
Interest Costs
Interest Expense - Non-Operating
Interest Expense, Net Non-Operating
Interest Expense, Supplemental
Interest Inc.(Exp.),Net-Non-Op., Total
Interest Income - Non-Operating
Interest Income(Exp), Net Non-Operating
Interest/Invest Income -  Non-Operating
Inventories
Inventories - Finished Goods
Inventories - Raw Materials
Investment Income - Non-Operating
Investment, Net
Issuance (Retirement) of Debt, Net
Issuance (Retirement) of Stock, Net
Labor & Related Expense
Land/Improvements - Gross
Litigation
Long Term Debt
Long Term Debt Matur. in Year 6 & Beyond
Long Term Debt Maturing in 2-3 Years
Long Term Debt Maturing in Year 2
Long Term Debt Maturing within 1 Year
Long Term Debt Reduction
Long Term Debt, Net
Long Term Investments
LT Investments - Other
Machinery/Equipment - Gross
Net Cash - Beginning Balance
Net Cash - Ending Balance
Net Change in Cash
Net Debt
Net Income
Net Income after Stock Based Comp. Exp.
Net Income After Taxes
Net Income Before Extra. Items
Net Income Before Taxes
Net Income/Starting Line
Net Profit Margin
Net Sales
Non-Cash Items
Non-Recurring Items, Total
Normalized EBIT
Normalized EBITDA
Normalized Inc. Avail to Com.
Normalized Income After Taxes
Normalized Income Before Taxes
Notes Payable/Short Term Debt
Number of Common Shareholders
Oper. Lse. Pymts. Due in Year 6 & Beyond
Operating Income
Operating Lease Payments Due in Year 1
Operating Lease Payments Due in Year 2
Operating Lease Payments Due in Year 3
Operating Lease Payments Due in Year 4
Operating Lease Payments Due in Year 5
Operating Lease Pymts. Due in 2-3 Years
Operating Lease Pymts. Due in 4-5 Years
Operating Margin
Options Exercised
Other Comprehensive Income
Other Current Assets, Total
Other Current liabilities, Total
Other Equity, Total
Other Financing Cash Flow
Other Investing Cash Flow
Other Investing Cash Flow Items, Total
Other Liabilities
Other Liabilities, Total
Other Long Term Assets
Other Long Term Assets, Total
Other Long Term Liabilities
Other Non-Cash Items
Other Non-Operating Income (Expense)
Other Operating Cash Flow
Other Payables
Other Property/Plant/Equipment - Net
Other Unusual Expense (Income)
Other, Net
Preferred Stock - Non Redeemable, Net
Preferred Stock, Net
Prepaid Expenses
Pretax Margin
Pro Forma Stock Compensation Expense
Property/Plant/Equipment, Total - Gross
Property/Plant/Equipment, Total - Net
Provision for Doubtful Accounts
Provision for Income Taxes
Purchase of Fixed Assets
Purchase of Investments
Purchase/Acquisition of Intangibles
Purchased R&D
Quick Ratio
Receivables - Other
Redeemable Convertible Preferred Stock
Redeemable Preferred Stock, Total
Rental Expense, Supplemental
Repurchase/Retirement of Common
Research & Development
Research & Development Exp, Supplemental
Restructuring Charge
Retained Earnings (Accumulated Deficit)
Revenue
Sale/Issuance of Common
Sale/Issuance of Preferred
Sale/Maturity of Investment
Selling/General/Admin. Expenses, Total
Selling/General/Administrative Expense
Shares Outs - Common Stock Primary Issue
Shares Outstanding - Common Issue 2
Short Term Debt Issued
Short Term Debt Reduction
Short Term Debt, Net
Short Term Investments
Stock-Based Compensation, Supplemental
Tangible Book Value
Tangible Book Value per Share
Tax Fees
Taxes Payable
Total Assets
Total Capital Leases, Supplemental
Total Common Shares Outstanding
Total Current Assets
Total Current Assets less Inventory
Total Current Liabilities
Total Debt
Total Equity
Total Equity & Minority Interest
Total Inventory
Total Liabilities
Total Liabilities & Shareholders' Equity
Total Long Term Debt
Total Long Term Debt, Supplemental
Total Operating Expense
Total Operating Leases, Supplemental
Total Pension Expense
Total Receivables, Net
Total Revenue
Total Special Items
Traffic Acquisition Costs (TAC)
Translation Adjustment
Treas Shares - Common Stock Prmry Issue
Treasury Shares - Common Issue 2
Unrealized Gain (Loss)
Unusual Expense (Income)
Unusual Items
Warrants Converted
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.info.from.rkd(dates,seccodes,"Net Sales")
		get.info.from.rkd(dates,seccodes,"Total Liabilities")
		get.info.from.rkd(dates,seccodes,"Tax Fees")
	}
}
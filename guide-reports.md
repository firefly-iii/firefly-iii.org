---
layout: page
title: About reports
show: yes
redirect_from:
  - /reports/
---

Firefly can generate fancy reports that give you a visual impression on how your finances are doing. Each report can be generated for a custom period _and_ for a specific selection of accounts, budgets and/or categories (whatever applies). Each report is generated on-the-fly and you can easily bookmark reports.

## Default financial report

The default report, which is also the first report Firefly III ever featured,
gives you a comprehensive overview of your finances, including gains/losses, an overview per budget per account,
a list of bills and their current state (paid, unpaid) and a quick overview of your largest (or smallest) transactions.

Each table you see in the screenshots can be sorted by name, by amount, in reverse, etc. The charts have little hover-texts
for added clarity and the <i class="fa fa-fw fa-info-circle"></i>-buttons will give show more detailed information.

[![Default financial report](https://i.nder.be/gybbbhnx/300/w)](https://i.nder.be/gybbbhnx) [![Default financial report](https://i.nder.be/cguuk6zs/300/w)](https://i.nder.be/cguuk6zs) [![Default financial report](https://i.nder.be/cpkgynsn/300/w)](https://i.nder.be/cpkgynsn)
## Transaction history overview (audit)

This particular report focuses on an "audit"-like view that gives you a comprehensive overview of how the selected accounts
have been doing. I originally built this because I just couldn't find a mistake I made but it turns out many users actually
use this report to verify their own bank statements.

Each field that is currently available to be set for a transaction (dates, notes, etc) is available in this form as well.

[![Audit](https://i.nder.be/cd8gn0ds/300/w)](https://i.nder.be/cd8gn0ds)

## Budget report

This report shows you a detailed overview for the selected budgets _and_ the selected account, 
allowing you to see how well you're doing for each selected budget. This is especially useful to see where
you're spending your money, what the trend line is and if your budget limits are actually having any effect. 

Part of this information is also available on the default budget pages, and your front page.

[![Audit](https://i.nder.be/hmhwffcq/300/w)](https://i.nder.be/hmhwffcq)

## Category report

This report is the same as the budget report but focuses on your categories. It can also include income, which can be very useful.
Use this report to see on which specific things you unexpectedly spend a lot of money. Likewise, since it includes incomes,
it can also be used to see if that raise you have received actually amounted to anything, after taxes.

[![Audit](https://i.nder.be/h9f93bxv/300/w)](https://i.nder.be/h9f93bxv)


<hr>
### Special URL fields

When you start using reports, you'll see that the URL of the report has some very special values. They look like this:

* `01012017/31012017`
* `01012016/01012017`

These values are the start- and end dates of your reports, in the format `DDMMYYYY`. You can replace these by the following magic words:

* `currentMonthStart`: will always return the start of the current month.
* `currentMonthEnd`: will always return the _end_ of the current month.

Likewise, these values work as well:

* `currentYearStart`: same, but for the current year (January 1st).
* `currentYearEnd`: same, but for the _end_ of the current year (December 31st).

These values depend on what you have set in your preferences as the "fiscal year", which can be useful for tax reasons.
If you set the fiscal year to be from April 1st to April 1st, these will return those dates. 

* `currentFiscalYearStart`
* `currentFiscalYearEnd`

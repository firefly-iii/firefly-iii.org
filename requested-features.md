---
layout: page
title: Often requested features
show: yes
redirect_from:
  - /requested-features/
---

Often people ask for features they wish Firefly III to have. New features are always a bit of a trade-off. If Firefly III has too many features it will feel bloated and complex. But if it has too few, it will feel childish and simple. 

Below is a list of most often requested features and their status.

## Can you allow me to create recurring transactions?
Unfortunately, Firefly III will not feature the ability to automatically create new transactions, such as monthly bills, salary deposits or transfers.

Although I see the convenience of having these transactions created for you, that's not the point of this tool. I believe that if you are serious about changing your financial habits, you should be aware of what happens on your accounts. The money you spend and the money you earn. By entering each transaction manually, you will _feel_ what you spend.

Of course, there are shortcuts. You can import transactions from your online bank account and you can clone transactions so all the fields are pre-filled. But that's it. 

## Can you help me predict the future?

Firefly III will probably not get tools to extrapolate the future from your current records. It's very tricky work and it quickly becomes "advanced guesswork".

## The ability to automatically set the budget amounts

Once you've set budgets for January, you would want to set them for February as well. And March, and April, etc. etc. Firefly does not support the automated creation of new budget amounts each week/month/year, and it will not support them.

As it turns it's pretty complex to create these entries reliably and consistently. It turns out this feature introduces more bugs than it solves problems.

## Often requested import-routine features

Firefly III allows you to import data from other systems but it is not perfect yet.

- Firefly III can only import CSV files. No MT940, HBCI, FinTS, or other formats are currently supported. No other formats will be supported until it is clear what the [PSD2](https://en.wikipedia.org/wiki/Payment_Services_Directive#Revised_Directive_on_Payment_Services_.28PSD2.29) will mean for financial institutions.

In the future, Firefly III will be able to:

- Import from banks that provide a solid API
- Import YNAB files
- Import other file types.

Improvements are coming, but the work is slow.

## Can you implement an API?
This is an attractive feature and would put Firefly III in the middle of a whole "eco system" of financial tools that could write to Firefly's database, through some JSON / XML / WebServices frontend. It's an attractive idea but a lot of work so it does not have much priority. 

If Firefly III will feature an API it'll be when the frontend of the site gets separated from the backend. Then, each request from Firefly would in fact be to it's own API. But it does not have much priority.

## Can we share data amongst users?
This is only possible for users who run Firefly III using Sandstorm.io, which effectively bypasses most user-related security.

For everybody else:

If you would like to share your accounts and transactions with (for example) your partner, you are forced to share account credentials. Due to the way Firefly has been built, it is impossible to change this without introducing significant backwards incompatible database changes. I've run into the same request myself, wanting to share financial data, but there are a number of reasons why it will be very difficult to implement.

Just about every page, every request and every query that refers to user data is secured with a check to see if that data actually belongs to that user. About 95% of Firefly would be affected when the source-code would have to check for (possible) other users who may also have access to the data.

With the links between objects, such as transactions and budgets, accounts and piggy banks and various others, many times the choice will have to be made what to "include" when sharing data. When sharing just the account and transactions, there is still the choice whether or not to share budgets, categories, attachments, etc. etc. This could be all, or nothing, or something in between which would make this very complex.

Related to this question is the question what the other user may do with the data, apart from viewing it. Could the other user attach categories? Their own categories perhaps? Or can the other user access the first user's categories? Would that user have to permit that first?

Security-wise, yes, it would be better to create another user-account instead of sharing a password.

A Firefly III that was built from scratch could use the concept of user groups instead of users: a user would be placed in their very own group. They can't see this group or interact with this group in any way. But all data in Firefly is owned by this group, not by the user.

Then, when the user wants to share data with another user, this other user is simply placed in the same group. Again, nobody needs to know these groups exist. But that is how it could be. Data could be shared among many members, since everybody can join the group. The front end would only talk about "sharing", never about groups.

But such a change, at this point, would effectively mean that the tool needs to be rebuilt from scratch. And that's something that I cannot do.

## Exporting data to the MT940 format
Not at the moment, no. 

## I wish to run my business using this tool
Although there are some data-fields that can be used for business expenses, Firefly III will never move its focus from personal finance to business finance.

## I wish to track stock portfolios using Firefly
Same answer, unfortunately.


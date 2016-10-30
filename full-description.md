---
layout: page
title: Full description
permalink: /description/
show: yes
---

This is the full description of how [Firefly III](https://github.com/JC5/firefly-iii) works. 

Firefly III has been built around how I manage my finances. Please read this carefully so we match on how to do things.

## The general idea

After being a grownup for a while I noticed I was living from paycheck to paycheck. I could not save money. I just waited to get paid.

The first thing I did was simple: I started living from the first day of the month until the last. This meant that I had to do a few things. This is something I still do:

1. On the day I get paid, I move my entire salary to my savings account.
2. On the _last_ day of the month, I think how much money I will need in the next month.
3. On the _first_ day of the month, I put that amount in my checking account.

So if you get paid on the 23rd of the month, your salary sits in your savings account from the 23rd until the first day of the month, when you move (part of it) back to your checking account. If you get paid every week, this routine repeats weekly.

This is quite difficult the first few times, but after a while you'll notice that you have (pretty effectively) moved your routine away from your salary and income. This alone gives you great financial stability. 

This procedure allowed me to program a very simple tool (the original "Firefly") which held very simple things: transactions. Oh and some accounts to keep track of the money. But that was basically it. It showed me where my money went.

In those early, exciting days, all I did was live from the 1st to the 31st of the month. This helped me save a lot of money already. The rest of Firefly's features have been built around this idea. Read below!

## Accounts

There are three kinds of accounts in Firefly III:

* **Asset accounts**
  * Asset accounts hold your own money. Your bank account is an asset account. Your savings account is an asset account. They would be called "Savings account" or "Checking account". These accounts can be created with an initial (negative) balance, which is useful since you won't be entering your entire financial history.
* **Expense accounts**
  * Expense accounts are stores, shops, online things, whatever. For example: "Target", "Thinkgeek", "Walmart" or wherever you buy stuff.
* **Revenue accounts**
  * Revenue accounts are the places you get money from. Ie. "my mom", "my job" or "the gubberment".

This split is there because my Googling into accounting has learned me that you should split these up. Internally too, even accounts with the same name but different types are split up. For example, if you shop at the place you work at, you will have a revenue account called "Albert Heijn" from which your salary is drawn but _also_ an expense account called "Albert Heijn" where you pay your groceries.

## Transactions

A transaction is a very simple thing. Money moves from A to B. It doesn't matter if this is an expense, your salary or you moving money around: money moves from A to B.

``Savings account -> € 200 -> Checking account``

In Firefly and most other systems this is stored using a "[double-entry bookkeeping system](http://en.wikipedia.org/wiki/Double-entry_bookkeeping_system)". You get money and your boss loses it. You spend money and the Albert Heijn "earns" it:

`` Your boss (- €1000) -> You (+ €1000)``

``You (- €15) -> Albert Heijn (+ €15)``

This seems pretty pointless but it is useful when transferring money back and forth between your own accounts. This is the same as spending money. It's all moving money around. This helps maintaining the internal consistency of the database.

Transactions have a few useful fields: a description, the amount (duh), the date, the accounts involved (from and to) and some meta-information.

In Firefly, a transaction can be a withdrawal, a deposit or a transfer. Beyond the obvious, they are slightly different from one another:

- Withdrawals have a dynamic "expense account" which you can fill in freely. If you go to a new store, simply enter the withdrawal with the new store as the expense account, and Firefly will start tracking it automatically.
- Deposits have dynamic "revenue accounts". This works in the same way as withdrawals do.
- Transfers can be linked to piggy banks. So you could move € 200 to your savings account and have it added to your piggy bank "new couch".

Withdrawals can also be assigned a "budget".

## Budgets

Once you start creating transactions you start to realise that in a month, the same kind of stuff always comes back:

* Bills
* Groceries
* Cigarettes
* Going out for drinks
* Clothing

These are budgets. Budgets are a kind of "category" that come back every single month. Bills are returning (rent, water, electricity). You buy groceries every day. You need to pay rent every month. 

In what is called an "[envelope system](http://en.wikipedia.org/wiki/Envelope_system)" you stuff money in envelopes and spend your money from those envelopes.

Firefly III uses this method, which means you can create "envelopes" for any period. Example: € 200,- for "groceries" or € 500,- for "bills" every month. For more details you can also give transactions a category.

## Categories

Categories are slightly different. You might start to notice how some things don't need a budget, but do need some kind of meta-thing. A category might work. "Furniture", "interest", "shoes" and "lunch" are perfect categories. If you create those in combination with budgets you can see exactly where your money is going. Other examples:

* Daily groceries
* Money management
* Lunch
* Car
* Public transport
* House

Firefly III allows you to dynamically create and manage categories. Fancy charts will show you how your money is divided over categories.

### The difference between categories and budgets

If you can save money every month on a certain subject, it's a budget. Groceries are budget. Bills are a budget. If you travel by train occasionally, it's not a budget.

First and foremost: a category is "incidental". You don't buy new furniture every month but you might want to keep track of such expenses. Or you don't care about costs for public traffic (budget-wise) but a category would be nice.

The rule of thumb is: would you make a real life envelope for it? If yes: budget. If no: category.

If you need even more fine-grained control, you can use tags.

## Tags

Tags are an extension of categories and meant to expand on the meta-data included in a transaction. You can add multiple tags to a transaction.

Firefly has implemented tags but they're not really meant to group transactions together, as you might think. This is because I haven't gotten around to it yet. Apart from the "normal" tags, Firefly supports two other types of tags. This is pretty advanced stuff though.

### Advance payments

Let's say you're in a restaurant, and decide to pay the bill for everybody to save the hassle. Still, you agreed to [go Dutch](https://en.wikipedia.org/wiki/Going_Dutch) so everybody should pay there share. Instead of paying you on the spot, they're going to transfer the money to you.

Advance payment tags allow you to join the original expense and any deposits. So if you paid 150,- in advance and get 120,- back from your friends, Firefly III will only show you a 30,- expense. Neat huh?

### Balancing money

Sometimes I use money from my savings account for special expenses. For example, I bought fancy headset. I paid for it like I usually do. 100,- from my checking account. However, I simultaneously transfer 100,- from my savings account. This effectively "nulls" the transaction. It hasn't "cost" me anything, except the money from my savings account.

Using "balancing act" tags I can nullify such transactions so they won't mess up my budgets.

## Piggy banks

If you want to buy something expensive, you might need to save for it. Use piggy banks to save money. You can create piggy banks, set a target amount and start putting money in them. 

The general gist is that saving money is difficult. So you could set a target amount, even set a target date and get reminded of when to add money to a piggy bank. If you have one year to save € 1200,- you could remind yourself monthly and Firefly will tell you to save € 100,- every month.

## Bills

Rent. Comes back every month. Create a bill and Firefly will not only match new withdrawals to bills but also show you which bills are still due and which ones aren't. 

## Reports 

Will show you how you have been doing. You can select the accounts to be included and the period as well.

## Rules

Firefly III can automatically categorize or budgetize your transactions based on rules you can create yourself. Examples include:

* Automatically add the correct budget for groceries;
* Change the description to something generic for specific accounts;
* Choose the correct category based on the amount of the transaction.

These rules can be created by you. You have full control.

---

## Conclusion

So there you have it. An application that can do basically everything. Notable missing stuff is:

- The ability to track stock;
- The ability to track debts, loans and stuff like that;
- The ability to trak mortgages.

All of this is yet to come!




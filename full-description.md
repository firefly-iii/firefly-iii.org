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

1. On the day I get paid, I move my entire salary to my savings account. All of it. Not a penny missing!
2. Then, I try to live the rest of the month on the money I had left. This was *very* hard the first few times.
3. On the _last_ day of the month, I think how much money I will need in the next month.
3. On the _first_ day of the month, I put that amount in my checking account.

So if you get paid on the 23rd of the month, your salary sits in your savings account from the 23rd until the first day of the month, when you move (part of it) back to your checking account. If you get paid every week, this routine repeats weekly.

This is quite difficult the first few times, but after a while you'll notice that you have (pretty effectively) moved your routine away from your salary and income. This alone gives you great financial stability. 

This procedure allowed me to program a very simple tool (the original "Firefly") which held very simple things: transactions. Oh and some accounts to keep track of the money. But that was basically it. It showed me where my money went.

In those early, exciting days, all I did was live from the 1st to the 31st of the month. This helped me save a lot of money already. The rest of Firefly's features have been built around this idea. Read below!

### Accounts

Accounts are the senders or receivers of money. Like you bank account or a store. You can read about them on the [accounts page](/accounts/).

## Transactions

A transaction is a very simple thing. Money moves from A to B. It doesn't matter if this is an expense, your salary or you moving money around: money moves from A to B. To learn about transactions check out [the page about transactions](/transactions/).

## Budgets

To learn more about budgets, and budgeting, check out the [budgets page](/budgets/).

## Categories

To learn more about categories check out the [categories page](/categories/).

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




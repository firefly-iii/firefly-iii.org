---
layout: page
title: About transactions
permalink: /transactions/
show: yes
---

A transaction is a very simple thing. Money moves from A to B. It doesn't matter if this is an expense, your salary or you moving money around: _money moves from A to B_:

``Savings account -> € 200,- -> Checking account``

``Checking account -> € 14.90 -> Supermarket``

In Firefly III and most other systems this is stored using a "[double-entry bookkeeping system](http://en.wikipedia.org/wiki/Double-entry_bookkeeping_system)". You get money and your boss loses it. You spend money and the Supermarket "earns" it:

`` JobGiver Inc. (- €1000) -> You (+ €1000)``

``You (- €15) -> Supermarket (+ €15)``

Each transaction is stored twice. Once as a loss (for one party), and once as a profit (for the other party). This seems pretty pointless, and technically it is. But it was designed back when clerks could be fraudulent and this double-entry system stopped fraud. In these modern days it is useful to check if all records are straight.

It is also useful when transferring money back and forth between your own [accounts](/accounts/). This is the same as spending money. It's all moving money around. This helps maintaining the internal consistency of the database.

Transactions have a few useful fields: a description, the amount (duh), the date, the accounts involved (from and to) and some meta-information.

In Firefly, a transaction can be a withdrawal, a deposit or a transfer. Beyond the obvious, they are slightly different from one another:

## Withdrawals
Withdrawals have a free-format field for the "[expense account](/accounts/)" which you can fill in freely. If you go to a new store, simply enter the withdrawal with the new store as the expense account, and Firefly will start tracking it automatically. Withdrawals can also be assigned a "[budget](/budgets/)".

## Deposits
Deposits have free-format field for the "[revenue account](/accounts/)". This works in the same way as withdrawals do.

## Transfers

Transfers have no free-format field. A transfer can only occur between existing asset accounts. But transfers can also be linked to [piggy banks](/piggy-banks/). So you could move € 200 to your savings account and have it added to your piggy bank "new couch".

# Split transactions

TODO I have to write about those!
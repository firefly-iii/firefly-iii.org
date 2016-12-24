---
layout: page
title: About transactions
permalink: /transactions/
show: yes
---

A transaction is a very simple thing. Money moves from A to B. It doesn't matter if this is an expense, your salary or you moving money around: money moves from A to B:

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
---
layout: page
title: About transactions
show: yes
redirect_from:
  - /transactions/
---

A transaction is a very simple thing. Money moves from A to B. It doesn't matter if this is an expense, your salary or you moving money around: _money moves from A to B_:

<span style="font-family:monospace;">Savings account</span> <i class="fa fa-arrow-right"></i> € 200,- <i class="fa fa-arrow-right"></i> <span style="font-family:monospace;">Checking account</span>

<span style="font-family:monospace;">Checking account</span> <i class="fa fa-arrow-right"></i> € 14.90 <i class="fa fa-arrow-right"></i> <span style="font-family:monospace;">Supermarket</span>

In Firefly III and most other systems this is stored using a "[double-entry bookkeeping system](http://en.wikipedia.org/wiki/Double-entry_bookkeeping_system)". You get money and your boss loses it. You spend money and the Supermarket "earns" it:

<span style="font-family:monospace;">JobGiver Inc.</span> (- €1000) <i class="fa fa-arrow-right"></i> <span style="font-family:monospace;">You</span> (+ €1000)

<span style="font-family:monospace;">You</span> (- €15) -> <span style="font-family:monospace;">Supermarket</span> (+ €15)

Each transaction is stored twice. Once as a loss (for one party), and once as a profit (for the other party). This seems pretty pointless, and technically it is. But it was designed back when clerks could be fraudulent and this double-entry system stopped fraud. In these modern days it is useful to check if all records are straight.

It is also useful when transferring money back and forth between your own [accounts]({{ 'guide-accounts.html' | absolute_url }}). This is the same as spending money. It's all moving money around. This helps maintaining the internal consistency of the database.

Transactions have a few useful fields: a description, the amount (duh), the date, the accounts involved (from and to) and some meta-information.

In Firefly, a transaction can be a withdrawal, a deposit or a transfer. Beyond the obvious, they are slightly different from one another:

### Withdrawals
Withdrawals have a free-format field for the "[expense account]({{ 'guide-accounts.html' | absolute_url }})" which you can fill in freely. If you go to a new store, simply enter the withdrawal with the new store as the expense account, and Firefly will start tracking it automatically. Withdrawals can also be assigned a "[budget]({{ 'guide-budgets.html' | absolute_url }})".

### Deposits
Deposits have free-format field for the "[revenue account]({{ 'guide-accounts.html' | absolute_url }})". This works in the same way as withdrawals do.

### Transfers

Transfers have no free-format field. A transfer can only occur between existing asset accounts. But transfers can also be linked to [piggy banks]({{ 'guide-piggy-banks.html' | absolute_url }}). So you could move € 200 to your savings account and have it added to your piggy bank "new couch".

## Split transactions

What has been described here are called "transaction journals". Firefly III stores each financial transaction in "journals". Each journal contains two "transactions". One takes money (-250 from your bank account) and the other one puts it into another account (+250 for Amazon.com).

You can verify this by counting. There are always twice as many "transactions" as there are "transaction journals" in your database.

This way, Firefly III tries to stay true to what a financial transaction is, which is kind of singular. Money moves from A to B, end of story. Nothing more. 

However, often an expense tells a story. Just take grocery receipts for example. It's one expense sure, but it consists of many parts. And when you buy aspirin and bread at the same time, you might want to split the expense over two budgets, medication and groceries. A single expense would make you lose information.

Likewise, your salary may have multiple components. Your base salary may be 1200. Minus 200 for taxes. Plus 100 bonus. Etc. All that information is lost when you only support singular, unsplitted deposit, like Firefly III usually does.

However, any time you create a deposit, transfer or a withdrawal, Firefly III allows you to **split** a transaction into multiple parts. When you do this, you can:

- Assign part of an expense to a budget;
- Assign different revenue accounts to parts of of a deposit.
- Categorize money differently.

You can split your entire groceries-receipt into small "sub"-transactions. You can specify each component of your salary.

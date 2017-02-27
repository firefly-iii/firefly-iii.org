---
layout: page
title: About bills
show: yes
redirect_from:
  - /bills/
---

Many [withdrawals]({{ 'guide-categories.html' | absolute_url }}) come back every month. Firefly III supports the creation of so-called "Bills" which can help you keep track of which bills to expect. For example your rent, water- or Netflix bills.

Bills are triggered when you create an expense with certain words in the description, with an amount in a pre-set range or going to a specific [expense account]({{ 'guide-categories.html' | absolute_url }}). When triggered, the transaction and the bill are connected and the bill will be marked as "paid". At least, for this period. 

Bills can be set to be expected every week, month or year.

This works in two ways: Firefly checks transactions within a certain range (amount), and it checks for keywords in the description and in the expense account.

For example, you might create a bill with these properties:

* Max amount: 800
* Min amount: 750
* Key words: rent, land, lord,

When you create a transaction with the following properties, it will match to this bill:

* Amount: 780,50
* Expense account: "Land lord"
* Description: "Rent"

The match will be visible in your transaction lists:

![Match of bill](https://i.nder.be/gp5upw7s/600/w)

The front page of Firefly III will also start showing the bills:

![Example of bills](https://i.nder.be/hd5r6uvb/600/w)

Individual bills will end up looking like this picture (under Money Management, then Bills)

![Example of bill](https://i.nder.be/cz8fws8m/600/w)


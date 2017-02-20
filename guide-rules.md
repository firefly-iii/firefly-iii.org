---
layout: page
title: About rules
show: yes
---

Firefly contains a rule engine that can automatically update your transactions when they are created or when they are changed.

It works by combining your custom "triggers" and combining them with "actions".
 
This is especially useful when you're importing data and you wish all transactions to be updated at once.

### Triggers

Notable triggers include the amount of a transaction or the description. Firefly could respond when a transaction is less thant € 5,- and contains the word "Groceries".

### Actions

Firefly can update the description, change accounts, set a budget or a category, etc etc.


<hr>

### Notes

Please note that all triggers are AND. So _all_ triggers must be met before the actions will fire.
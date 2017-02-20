---
layout: page
title: About tags
show: yes
---

Tags are an extension of [categories]({{ 'guide-categories.html' | absolute_url }}) and meant to expand on the meta-data included in a [transaction]({{ 'guide-transactions.html' | absolute_url }}). You can add multiple tags to a transaction.

## Default tags

Regular tags can be useful to group expenses together, possibly in another context than your categories. For examples, tags might include:

* `too-expensive`
* `work-expense`

Or maybe something else entirely. 

Apart from these "normal" tags, Firefly supports two other types of tags. This is pretty advanced stuff though, so continue on your own risk!

## Advance payments

Let's say you're in a restaurant, and decide to pay the bill for everybody to save the hassle. Still, you agreed to [go Dutch](https://en.wikipedia.org/wiki/Going_Dutch) so everybody should pay there share. Instead of paying you on the spot, they're going to transfer the money to you. This is something that happens in my group of friends regularly.

Another example would be that you pay something at your job in advance, for example new staples or printer paper. When your employer pays your expenses claim, your expense (aka: the advance payment) is "corrected".

1. To make this work you would first make a tag called `restaurant bill` and make sure it's of the "advance payment"-type.
2. Then, connect the expense to this tag using the "create withdrawal"-form.
3. Every deposit that you create for when one of your friends pays you back is also connected to this tag.

The end result is a tag which shows you all transactions nicely organised.

### Balancing money

Let's say your just going through your routine like a regular guy. You have budgets and categories and what-not. You've been saving up on your savings account for a new TV, and one day you buy it. This means two transactions will have to be created. One is moving the money you saved to your checking account:

<span style="font-family:monospace;">Savings account</span> (- €1000) <i class="fa fa-arrow-right"></i> <span style="font-family:monospace;">Checking account</span> (+ €1000)

The other one is buying the actual TV:

<span style="font-family:monospace;">Checking account</span> (- €1000) <i class="fa fa-arrow-right"></i> <span style="font-family:monospace;">Buy&amp;Large</span> (+ €1000)

The expense does not fit any of your budgets. Nor is is something you should budget for. Instead, you don't give it a budget at all, but give it a category only. This means your [budget report]({{ 'guide-reports.html' | absolute_url }}) is messed up, because 1000,- is unaccounted for.

The balancing act is meant to remediate this. Give both the transfer and the expense the same tag, and make it a balancing act. The report is now corrected.


<hr>

These tags add extra information to your expenses and income. A 100,- restaurant becomes a 30,- restaurant bill. A large expense becomes "nullified". Most of Firefly III does not actually reflect this. Big expenses still distort your charts. This is intentional.
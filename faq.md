---
layout: page
title: FAQ
permalink: /faq/
show: yes
---

## I have installation problems

[Open an issue](https://github.com/JC5/firefly-iii/issues/new) or send [me a message](mailto:thegrumpydictator@gmail.com).

## The installation is difficult

I know, and I'm sorry. I never intended this tool to be actually used by other people. I put it on Github because it was free. 

## Firefly III is complicated

Same answer, I'm afraid. Let me know what I can do to help!

## I get an error about "ZERO transactions".

This is a rare one, but it happens. To fix it:

1. Open your database, and find the table called ``transaction_journals``.
2. In this table search, for the entry with the ID that is mentioned in the error message.
3. Find the field ``deleted_at`` (it should be empty or NULL).
4. Fill in the date and time of today using the following format: ``2016-04-29 17:19:51``.

This should fix the problem.
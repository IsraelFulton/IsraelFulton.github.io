---
title: "Do Concert Tickets Get Cheaper Before Showtime?"
subtitle: "Concert resale price dynamics"
slug: seatdata
category: "Empirical research"
date: 2026-10-27
featured: true
order: 1
excerpt: "I analyzed concert resale prices and inventory across 632 U.S. concerts, finding wide variation between shows and an increase-risk model that weakened on a separate sample."
summary: "I analyzed repeated observations of resale prices and inventory across 632 U.S. concerts. Small median price changes hid large differences between shows, and a model for later price increases weakened on a separate historical sample."
---

A seller with an unsold concert ticket faces a deadline. That makes waiting for a last-minute discount sound sensible. But buyers are arriving too, and the cheapest available tickets may disappear before sellers cut their prices.

I investigated this tension using [SeatData](https://seatdata.io/). My August sample contains 208,175 historical price and inventory snapshots across 632 U.S. concerts. I aligned the observations by time until showtime, compared each concert with its own baseline roughly two weeks earlier, and gave each event equal weight.

## Small median changes, large differences between shows

In the day-before window, 18–36 hours before showtime, the median change in the cheapest listed ticket was a decline of just 2.1% across 599 matched concerts. The range between the 10th and 90th percentiles stretched from a 40.0% drop to a 42.9% increase. A small change in the middle concealed very different experiences at individual shows.

Inventory fell much faster than typical prices. Active listings declined by a median 48.0% across 608 matched concerts over the same broad baseline-to-day-before comparison. Yet grouping events by how much inventory remained did little to distinguish subsequent discounts. Having plenty of tickets left was not, by itself, a useful reason to wait.

## A prediction that weakened in another sample

I then tested whether prices, inventory, and recent market changes could help predict a subsequent increase of more than 10% in the cheapest listed ticket. I used regularized logistic regression and kept related artists and tours together during validation, so closely connected concerts could not appear on both sides of a split.

The increase-risk model reached an AUC of 0.664 in grouped August validation across 574 usable concerts. AUC measures how well the model ranks concerts with later price increases ahead of those without; 0.5 is chance ranking. I froze the model and evaluation rules before acquiring July outcomes, then tested it on 360 July concerts without an artist or tour connection to the August sample.

AUC fell to 0.576, below the precommitted 0.60 replication threshold. July was acquired later but occurred earlier in calendar time, so this was a separate historical test rather than a forward forecast.

The August result did not transfer reliably to these concerts. Inventory levels and quote freshness differed between the samples, but I couldn't isolate what caused the model's performance to deteriorate.

These observations are listing quotes, not completed purchases. They exclude fees, can refer to different seats or quantities, and arrive unevenly; the broad time windows do not establish prices available at an exact buying deadline. The research did not produce a reliable universal rule for when to buy.

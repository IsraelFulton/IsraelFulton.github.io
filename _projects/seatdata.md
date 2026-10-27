---
title: "Concert resale price dynamics"
slug: seatdata
category: "Empirical research"
status: "Preliminary research"
date: 2026-10-27
featured: true
order: 1
excerpt: "A study of concert resale prices and inventory using SeatData, with an emphasis on measurement and out-of-sample evaluation."
summary: "When does waiting to buy a resale concert ticket help, and when does it increase the risk of paying more?"
review_note: "This overview describes the September 2026 research snapshot. The full case study and any shareable figures remain draft placeholders."
---

## The question

A concert ticket expires at a fixed time. That creates a reason for sellers to cut prices, but it also gives buyers a reason to act before inexpensive offers disappear. This project asks how resale prices and inventory change as showtime approaches, and whether the state of an individual market helps distinguish those possibilities.

## My approach

I built an analysis of U.S. concert resale markets using [SeatData](https://seatdata.io/). The work compares each event with its own earlier observations, examines the distribution of price changes across events, and evaluates predictive signals on a separate historical sample.

Measurement is central to the analysis. A recorded minimum listing price is not a completed transaction, and a disappearing listing does not necessarily indicate a sale. The research distinguishes broad time windows from observations available at a specific decision point.

## What the preliminary work suggests

A nearly flat median price path can conceal substantial movement in both directions. The preliminary analysis did not validate a universal rule to wait, and a predictive signal that looked promising in one sample weakened in the separate holdout.

The useful result is a clearer account of uncertainty: price dispersion, changing inventory, and observation timing all matter when evaluating a proposed buying rule.

## Scope and limitations

This is exploratory research, not a validated ticket-buying strategy. Recorded listing quotes exclude fees and can reflect different seats or quantities over time. The data do not establish the savings a buyer could have realized in a completed purchase.

The source repository and licensed provider records are private. This overview does not redistribute the dataset or imply that raw records are available on request.

<aside class="draft-note" aria-label="Case study placeholder">
  <p><strong>Draft placeholder — evidence and figures.</strong> Add a reviewed methods note and any figures cleared for public sharing, with sample definitions, denominators, and limitations. No downloadable dataset or results package is published here.</p>
</aside>

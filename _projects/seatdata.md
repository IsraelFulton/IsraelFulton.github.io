---
title: "How getting a deal on Ken Carson tickets led me to study nearly 1,000 concerts"
slug: seatdata
category: "Empirical research"
date: 2026-10-27
last_modified_at: 2026-11-25
header:
  og_image: /assets/images/social/seatdata.png
  og_image_alt: "How getting a deal on Ken Carson tickets led me to study nearly 1,000 concerts, by Israel Fulton."
  og_image_width: 1200
  og_image_height: 630
featured: true
order: 1
excerpt: "I tracked resale prices before a Ken Carson show, then used July and August concert data to test when waiting pays off."
summary: "After getting a deal on a Ken Carson ticket, I tested whether waiting paid off at other shows. In July and August, about a third of concerts got more than 10% cheaper in the final week, while more than a quarter got more than 10% more expensive."
---

In the week before the D.C. show, I built a tool that sent me hourly price updates from several resale sites. My intuition was that people who could no longer attend would put their tickets up for resale, increasing supply and pushing prices down. But other last-minute buyers would be looking for those same bargains, so I needed to be quicker than them. Fortunately, I attended the concert at discount.

After the concert, I wanted to see whether this pattern held across other shows. Using [SeatData](https://seatdata.io/), I pulled 208,175 historical price and inventory snapshots across 632 U.S. concerts in August 2026. I organized the observations by how far away each show was, compared each concert with its own baseline roughly two weeks earlier, and gave every concert equal weight.

## Small median changes, large differences between shows

Between 18 and 36 hours before showtime, the cheapest listed ticket had fallen by a median of just 2.1% across 599 concerts with prices available in both periods. But the middle 80% of concerts saw price changes ranging from a 40.0% decline to a 42.9% increase. At some shows, waiting could have saved me a considerable amount; at others, it could have cost me considerably more.

<figure>
  <a href="{{ '/assets/images/seatdata/figure-1-ticket-price-changes.png' | relative_url }}"><img src="{{ '/assets/images/seatdata/figure-1-ticket-price-changes.png' | relative_url }}" alt="Across 599 August concerts, the cheapest ticket fell 2.1% at the median. The middle 80% ranged from a 40.0% drop to a 42.9% rise. At 13 shows the price more than tripled." width="2850" height="1605" loading="lazy"></a>
</figure>

Ticket inventory fell much more sharply than prices did. Active listings declined by a median of 48.0% across 608 concerts over the same period. Yet grouping concerts by how much inventory remained did little to distinguish which ones would see subsequent discounts. Seeing plenty of tickets left gave me little reason, on its own, to wait.

## A prediction that weakened in another sample

I then tested whether prices, inventory, and recent market changes could help predict which concerts would see a subsequent increase of more than 10% in the cheapest listed ticket. I used regularized logistic regression and kept related artists and tours together during validation, preventing closely related concerts from appearing in both the training and validation sets.

Across 574 August concerts, the model correctly ranked a concert whose cheapest ticket later rose by more than 10% as riskier than one whose did not 66.4% of the time. Note that random rankings would average 50%. I further tested these results against 360 July concerts that shared neither an artist nor a tour with the August training concerts.

The model performed considerably worse in July, scoring just 57.6% on the same measure. Across the two samples, inventory levels and the time between price updates differed, but I am unsure whether those differences explained the decline in performance.

<figure>
  <a href="{{ '/assets/images/seatdata/figure-2-model-performance.png' | relative_url }}"><img src="{{ '/assets/images/seatdata/figure-2-model-performance.png' | relative_url }}" alt="The model ranked 66.4% of concert pairs correctly in August (95% confidence interval 61.2–71.4%) and 57.6% in July (51.0–64.2%). Chance was 50% and the target was 60%." width="2850" height="1425" loading="lazy"></a>
</figure>

## Learning from watching prices

I returned to the hourly price updates that started the project. After observing a concert for a week and noticing its cheapest ticket kept changing price, what can be concluded two days before the show?

I examined 364 August concerts that shared neither an artist nor a tour with the July sample and had sufficient price data. I grouped them by how frequently their cheapest listed ticket changed price during the week preceding my two-day price check.

At 107 concerts, prices changed between consecutive observations more than half the time. Of these concerts, 68% subsequently experienced a price increase or decrease greater than 10%. By contrast, at 194 concerts, prices had changed no more than a quarter of the time. Only 28% of these concerts subsequently experienced a change of that magnitude.

<figure>
  <a href="{{ '/assets/images/seatdata/figure-3-historical-price-activity.png' | relative_url }}"><img src="{{ '/assets/images/seatdata/figure-3-historical-price-activity.png' | relative_url }}" alt="The share of concerts with a later price move over 10% rose with earlier price activity. It was 27.8% when at most a quarter of quotes changed, 63.5% when over a quarter to half changed, and 68.2% when over half changed." width="2850" height="1560" loading="lazy"></a>
</figure>

## Buyers’ Implications

Suppose a buyer finds a ticket one week before a show and decides to wait. Among concerts with prices available at both points, the cheapest ticket was more than 10% cheaper by the final observation at 32% of July shows and 33% of August shows. However, the ticket was more than 10% more expensive at 27% and 28% of shows, respectively. I tested several rules for deciding when to buy—none consistently outperformed both buying a week early and waiting until the final observation.

<figure>
  <a href="{{ '/assets/images/seatdata/figure-4-benefits-and-risks-of-waiting.png' | relative_url }}"><img src="{{ '/assets/images/seatdata/figure-4-benefits-and-risks-of-waiting.png' | relative_url }}" alt="Among 536 July shows, waiting saved over 10% at 32.1% of shows, kept prices within 10% at 40.5%, and cost over 10% more at 27.4%. Among 575 August shows the shares were 33.0%, 39.1%, and 27.8%." width="2850" height="1365" loading="lazy"></a>
</figure>

My strategy worked for Ken Carson. Whether I would employ it again depends on my willingness to pay—this project and the broader economics literature align on this finding. If I’m willing to miss the show, the possibility of saving more than 10% may be worth waiting the risk of waiting. But if I’m committed to attending and found a ticket within budget, I’d rather buy it than risk paying more for the privilege of waiting.

<a href="{{ '/assets/papers/ken-carson-ticket-study.pdf' | relative_url }}" download>Download the article (PDF)</a>

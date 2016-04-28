# Big data processing options 

The term “big data” is definitely hot these days, everyone wants to get their hands on some big data to mine it, for profit if possible. Genomics offers pretty much unlimited amounts of big data, but to process it you need to have serious computing power. Let’s briefly review our options for processing the “big data”.

## Supercomputers

The supercomputers have been around since 1980s with one of the most well known being 80MHz Cray-1 ($8.8 million). Comparing that to newest 1,000MHz Raspberry Pi Zero ($5 - yes, just five dollars), it is million times of magnitude difference!
Today, the most powerful supercomputer is in China and it contains over 3.1 million processor cores. Even if you could get it for free, you would not be able to afford the cost of electricity to run it.
From the very beginning, util this very day, the supercomputers have always had one thing in common - they are prohibitively expensive. This is, for practical reasons, pretty much where my interest in supercomputing ends.

## Cloud computing

When companies like Amazon started to provide Web services to millions of their customers they quickly learned that the expensive infrastructure designed for the peak time utilization (i.e. Black Friday) is idle most of other time. They decided to sell that excess of processing power to growing companies that needed to scale up fast without investing heavily into dedicated servers and their maintenance. 
If you happen to have a startup with a hot, well funded idea and you want to try out that idea immediately, the cloud computing option may be the best. 
However, if you want to run the genetic code algorithms for weeks on end in 256 core setup, cloud computing may become cost prohibitive as they will charge you appropriately by CPU cycle. You might easily end up paying $10,000 per month which, as we will shortly show, is many times more than the total cost of the project proposed in this book.

## DIY cluster computer

In the last couple of years we entered a new era of computing. The Dell server unit I was ordering for my company around year 2000 was containing approximately quad core 800 GHz CPU and cost about $16,000, today I can get a single board computer (SBC) with better performance for $16. One thousand fold decrease in price within my own career!
You can buy many single board computers (SBC) for $5, $8, $16, $36, $50, or $150, each depending if you need a single, 2, 4, 8 or 16 core board with selection of accessories such as Gigabit ethernet card, Bluetooth and WiFi radio.
To build a 256 core cluster computer today it would take about $1,000 if planned properly. That is a price of one cheap laptop. The best thing is you can scale up from there as fast as Amazon Prime can deliver to your door. This is the focus of the rest of this book.

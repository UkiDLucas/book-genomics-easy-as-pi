# BlockChain

Let’s say that you get excited about having your own 256 core cluster computer build using 64 Pi SBCs, but unless you are a big lab processing many genomic orders, you might find the system underutilized at times. It would be good to put the hardware to use to make money. Blockchain may be an interesting option.

## Bitcoin mining is not an option anymore

Few years back, around 2009-2012, it was a great time to use extra computer processing power to mine Bitcoins. Bitcoin is the first and so far the most popular electronic currency. To mine Bitcoins, means to have your computers run transaction verifications for the Bitcoin network, therefore supporting its infrastructure. The operations are not very complex and do not require too much processing power, but they have to be very fast to compete with other Bitcoin miners. The verifications use hashing algorithm called SHA256, which is the most important part of the operation of the miner. The speed of the miner is determined by how many hashes they can perform per second (hash/s).
The times of general purpose computer Bitcoin mining are long gone, 800MHz Raspberry Pi was able to do about 100 kilo-hash/s (x1,000 hashes) which is plenty to support the needs of the currency, however because of the rules of Bitcoin in particular, only the fastest miners get awarded the monetary reward and the rest of this massive computational power is basically wasted and not rewarded. 
When the general purpose computer CPU mining was no longer competitive, there was a period of GPU mining which achieved range of few mega-hash/s (x1,000,000 hashes). The SHA256 algorithm runs very well on massively parallel GPU, however this ended shortly as well because of the development of SHA256 ASIC (application specific integrated circuit) which could move the speed into tera-hash (x1,000,000,000,000 hashes) levels.
As the more powerful miners come online the difficulty of the operations is artificially increased to make the competition even harder, today the unit price for a miner like Neptune 3 tera-hash/s ASIC is about $10,000.
I find this trend unfortunate, as it leads to artificial arm race where only the richest can afford the hardware for mining. In my opinion it is also the biggest weakness of the Bitcoin.
Today, Bitcoin network is considered the biggest supercomputer in the world.  The total power of the Bitcoin network is measured in thousands of peta-hashes (or 1.2  exa-hashes/s, or x1,200,000,000,000,000,000 hashes in April 2016) and as I have already mentioned it is a major waste of resources, money and electricity as these computers are power hungry heat emitters. 
The only reason to increase hashing difficulty is to slow miners down and keep the ability of the network to find blocks every 10 minutes on average. Ten minutes is forever as far the the purchase verification is concerned. Considering that one 10 minute block consist of 500 to 2,500 transactions, which is very little in context of global economy, the system really needs a revision. Do not get me wrong, I still buy Bitcoin, but I mostly invest in alternative BlockChain solutions that I find technologically superior.

## Blockchain proof-of-work equilibrium

When considering BlockChain as a tool we might want to use, it should choose the optimal configuration of that BlockChain. 
All miners should be rewarded for their actual work which is the support of the needs of BlockChain transactions, this should encourage every participant (coin owner) to run the full node mining software on their PC. As a result, the overall network would be more distributed, therefore healthier and budget-minded. 
Currently, 10 minute Bitcoin block winner takes it all, or about $11,000 at today’s prices coin prices.
The perfect equilibrium situation “miner fee” would be less glamorous, but very consistent. When distributed among about 6,500 nodes running today, it would come to about $245 a day, the number would depend on the size of the full node network.
The total size of the network could be controlled by proof-of-ownership, where only owners could run one full node per x coins they own, this makes sense as owner would have a stake in maintain the rules and status quo. The amount of ownership would not have to be large, probably in the range of $1,000 per full node. The idea would be to make full node operators border-line profitable without excess that would drive arm race.
Believe, or not, but a SBC like 1.4GHz 4-core Pi is powerful enough to run a full node at 2 mega-hash per second. Storage is another issue as 64GB SD card is already too small, and 128 GB will run out sooner than later.

### Full node ledger storage problem

As of this writing the 64 GB of storage is not enough for the full Bitcoin ledger, so alternative solutions like USB storage would have to be considered as it grows very fast. If the Bitcoin reaches global acceptance and the system is processing volumes of transactions comparable to major credit cards, the size of the ledger will grow by Peta-Bytes per day. At that point the full-nodes will be hosted only by few major service providers which would be contrary to the Bitcoin original concepts. The alternative “ledger sharding” solutions will have to be found similar to how RAID 5 works today. There would be processing nodes and shard nodes containing parts of the ledger  The processing nodes would still have to reach 51% majority of the votes, but once the ledger exceeds 1TB
In any case the full nodes will have to receive transaction fees to justify the expense.
A minimum block size would have to be established for transactions to be verified as fast as possible, the target rate should be about 10,000 transactions per second to meet future global transaction demand.
Of course the faster computer would be able to build the blocks faster, but since the reward would not be related to the speed, the power-efficiency would be more actually profitable. 
If no node was able to build the block in x seconds, the bonus award would go to the first winner. This would assure that owners would maintain machines to meet current demand, but avoid to be energy wasteful.

## BlockChain as proof-of-work for Genomic calculations 

The BlockChain in our case could be used to maintain the proof-of-work of the genomic analysis. In most simple terms this means that your idle hardware could perform calculations for other scientists by running predefined (and therefore safe) software using their data. The cost of these operations would be defined by the total network demand. The coin tokens to pay for service could be exchanged with fiat currencies  such as USD, etc. when funding of the project is available, but also it would circulate around as researchers would use each other’s hardware as needed.
The should also be small percentage of “developer fees” to pay per transaction to cover the cost of state-of-the art software to run the system.

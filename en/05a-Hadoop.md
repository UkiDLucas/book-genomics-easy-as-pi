# Distributed Operating System

When considering a cluster computer, the main architectural solution would be to use a distributed software model. Distributed programming takes a Big Data processing task and breaks it into smaller-size processes that can run on separate CPU cores. The advantage of correctly designed distributed approach is that if any process fails, it can be re-run on different processor without data loss, or effect on the final outcome. 

If there are more processes to be run then available CPU cores, in well designed distributed computer, adding more computing units, or nodes, will scale up the architecture making extra CPU cores readily available. 

Another benefit of distributed computing is that each process takes a small chunk of data, e.g. 64-124MB instead of 3GB as it is often the case with whole DNA sequences. Such small processes can be easily run on inexpensive hardware such as Pi board.

In summary, Pi boards are a good candidate for distributed computing as can be rapidly scaled up to required processing needs by simply adding a couple of additional boards at the cost of $16-$30 per 4 CPU unit. 

## Hadoop


# Distributed Operating System

When considering a cluster computer, the main architectural solution would be to use a distributed software model. Distributed programming takes a Big Data processing task and breaks it into smaller-size processes that can run on separate CPU cores. The advantage of correctly designed distributed approach is that if any process fails, it can be re-run on different processor without data loss and dos not effect the final outcome. 

If there are more processes to be run then available CPU cores, in well designed distributed computer, adding more computing units, or nodes, will scale up the architecture making extra CPU cores readily available. 

Another benefit of distributed computing is that each process takes a small chunk of data, e.g. 64-124MB instead of 3GB as it is often the case with whole human DNA sequences. Small data processes can be easily run on inexpensive hardware such as Pi board featuring 512 MB of RAM.

In summary, Pi boards are a good candidate for distributed computing as can be rapidly scaled up to required processing needs by simply adding a couple of additional boards at the cost of $16-$30 per 4 CPU unit. 

## Hadoop

Hadoop is a set of open source software tools designed to be used as operating system for distributed computer. 

The two major components of Hadoop are "Distributed File System", or HDFS and Yarn. The HDFS is used to store Big Data in small chunks across distributed set of inexpensive disks, e.g. SD cards in Pi boards. YARN is a manager for distributed processes.

There are multiple other software components that are part of Hadoop, but HDFS and YARN are essential for running the distributed computing software.
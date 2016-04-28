# Software

It is out of scope of this book to explain the particular software solutions, especially that there could be hundreds of different applications. There are however few design considerations that we should review before starting to build the cluster setup.
Divide and conquer
In the perfect world we would like to have the whole genetic sequence in computer’s memory (RAM) and operate on it directly. Unfortunately, because human genome could take up to 3.3GB of computer’s memory, the software would exceed the maximum allowable space (heap size) of programming  languages like Java (4GB, or realistically 2.9GB in practice). Such approach would also not be very efficient either. In addition RAM memory is expensive and if cost is of our concern, we should plan for 512Mb RAM range (as of writing in early 2016).
To compound the problem of RAM, you may be interested in comparing multiple genomes, for example human to human, or human to primates, or one bacterium to another.
The obvious solution is to divide and conquer and that is where cluster computers really shine. Obviously you will want to keep your genome sections (chunks) as optimal as possible taking in consideration the RAM available, the language you are using, and the heap size available for that computer language. A few tests should show you statistical optimum.
If we simply cut the genome in even sections, we would be getting false negatives on the splice points. For example a splice (not a real sequence) …ACGCGTA | CTGTCA… would not allow you to find sequence GTACTG. To solve for that we have to introduce redundancy via overlapping.

## Redundancy - Overlapping splices 

Because we are taking advantage of cluster computer, we can afford redundancy in your coverage. This in a single workstation, regardless how powerful would be a waste of resources (mostly time), but in cluster computing it is desirable. So instead of searching thru the genome once, we split it into widely overlapping sections (chunks). Each process (node) will be responsible to report findings for their chunk of DNA and you may get same (duplicate) results, but the advantage of multiple processes analyzing shorter sections of DNA at the same time is easy to understand.
The calculation of the size of DNA will depend on amount of RAM you have, we will discuss this shortly.
Image: Conceptual representation of dividing genetic code into segments/chunks. Each chunk could be 50Kb-100Mb letters. While sequencing, the machines often read 50 base pairs sequences with multiple overlaps that have to get assembled.



Multiple passes over the same DNA section
In addition it is well known that the base pairs you are comparing can have:  
insertions, 
deletions, 
duplications, 
substitutions, 
reversals,

so it is safe that when you look for a given sequence you will have to compare the same code 5 to 10 times.
Message Passing Interface (MPI)
The MPI running over TCP/IP allows programmers to run their program on multiple nodes in parallel. Although MPI can provide big benefits in the long run to manage the running software, it is not a prerequisite when you have many big chunks of DNA to process and each process takes many hours.
Choice of Java
As mentioned I am using Java for few reasons:
it is the language I have used for 15 years
it is multithreaded unlike many scripting languages
it is one of the most popular servers side languages in the world
it is faster than scripting languages
it is easier than C, C++
runs on all major Linux platforms
Other interesting languages that could be used are R, Swift and Go.
Java in 512MB RAM
Let’s say we take a “small” genome of very commonly studied bacterium, E. Coli., which genome is about 4,639,732 letters. You can easily read it as whole into the memory running under 245MB of heap size. In fact you can have about 6 copies of this DNA code under 256MB. Using 512MB of RAM you could probably squeeze 14 copies of E. Coli DNA, depending on how much other software is running on that board. Let’s say that our operating range for 512MB board is 10 to 64 million base pairs of DNA. To process human genome of 3.3 billion letters we would need:
3.3 billion / 64 boards = 51.5 million base pairs per SBC
51.5 / 4 cores = 12.8 million base pairs per thread
If we tried to load 51.5 million base pairs at once in each board, you would need 64 nodes to process 3.3 billion pairs human genome in parallel, without any redundancy. 
Since we are running multithreaded code on 4 CPU cores per board and we probably would take 12.8 million base pairs per thread, then process the overlapping redundant scans in the next run.
On the more powerful computer you could increase the Java heap size to about 4GB, but in practice it makes little difference after 2.9GB. You can hold about 127 copies of E. Coli in the RAM before you run out of heap space. That is about 593 million letters, which is still far short from 3.3 billion for human genome. Therefore does not matter how we approach it, as mentioned earlier, we have to splice the genome into manageable pieces.

## Using Java byte arrays

When operating on letters (Java String) we are unnecessary consuming memory as each letter takes 16 bits and for all practical purposes we need only 4 (ACGT), or 5 (ACGTU) bits of information. If we use Java byte array instead we are limiting the waste of memory by using only 8 bits. 
To do so we need to assign the letters to numbers as so:
0 - deletion
1 - A
2 - C
3 - G
4 - T
5 - U
and so on if you need degraded bases   
Converting the genetic code upon reading it into a byte array will definitely cut down on the memory footprint, but will add complexity of the code. You may find it worth doing if abstracted well enough. For visual display to the operator (user) you should always use letters.

# Designing cluster computer

## Test configuration

The most sensible approach would be to create a single threaded piece of software that simulates the problem closest to what interests you and run it in the command line on regular computer to measure its timing and performance. The task should be designed to utilize the CPU and having all the data needed available locally on SD card and in RAM, we will discus data transfer bottlenecks later. 
Next thing would be to optimize your code to be multithreaded to run on CPU’s 4 cores (most of the computers today) and measure it again — let’s say it takes about 3 hours to finish. If the task finishes too fast it may mean that there wasn't much to be done and if the tasks take much longer then perhaps you need to think how to sub-divide them further.  
Next you will decide what are your expectations. For example you may want your subtask that has just run on my 2.9 GHz MacBookPro in 3 hours to be able to finish overnight in real “production” scenario, in which case quad core 1.4 GHz computer ($35) might do well, if you want to save money you may choose to go down to 1.2 GHz ($16), or if time is the essence you can update to 2GHz 8-core beast ($150).
The calculation for the final setup would be based on if the subtask is a fraction of the whole job, do I need 10, 20 or 50 SBC units?
## Cables everywhere
Cables may be used for few things, however an effort should be made to minimize their use if they are not necessary.

### Power cables (5V)

Most boards are powered by USB cables, but you have to be aware that some boards like Orange Pi are powered by the cylindrical jack 4mm x 1.7mm, same as Sony PSP. All these wires can add up to cost and your setup can become very messy. One option would be to splice a single main thicker gauge power cable with plugs spaced every inch or so.  This solution would allow you to easily unplug the board as needed. If you are using USB hub, make sure you buy a powered one like this $30 Anker 60W 10-Port USB Charger (shown in the image).  Even cleaner solution would be to run a main cable (5V bus) and wires directly to the board, but that usually requires additional circuit (as described by Josh Kiepert) with the short protection which may, or may no be worth doing. I ended up buying 100 PSP plugs in bulk and installed 5V voltage step-down regulator running off 12V computer power supply.
Ethernet cables
The Ethernet cables ($4 each) are bulky and awkward and they require the hub (48 port, $175) which draws power, too. There may be a strong need to connect each board to Ethernet, especially if you plan to have a massive capacity Network Attached Storage (NAS), we will discuss this further on, however I would encourage you to first consider options that use WiFi instead (+$7 via USB if not included with the board). Another option is to make each board’s job self-contained to 16GB SD card which should be sufficient for couple of complete genomes. We will discuss this further on, too.
Storage USB or SATA cables
You may choose each board to have its own hard drive connection, however again I would prefer to use larger capacity SD card with 8, 16, 32 or even 64GB.
Board specifications
Just a couple of years ago the choice would be simple — a popular Raspberry Pi, but today it may not be the best choice, in fact you have about a dozen of competing boards on the market. Because we are discussing building solutions that are easy to re-create, I would suggest to be cautious with the one-off manufacturers that produce a limited line of boards for which there is limited community support and who have uncertain future.
Here is a short list of requirements:
runs popular Linux version
800MHz to 2GHz CPU
2 to 8 cores (most of SBC come with 4 as of this writing)
500MB - 2GB RAM (there are no better SBC options)
Gigabit Ethernet or WiFi radio
SD card slot
Let me clarify above the list a little.
Linux
We want to run Linux on the board because frankly there is no other sensible alternative. The selection of available Linux command line tools, languages and libraries is better than for any other OS.  If you want to create beautiful visual user interfaces (UI) you may consider Android OS, or Linux running JavaFX, however I am assuming that we want to run command line programs, or scripts. To save the RAM and CPU resources, I would go as far as booting up only from the command line, no desktop windowing system (GUI) on your Linux instance.
CPU speed
Of course you want to get the fastest CPU possible, however the newest, fastest CPUs carry the premium price tag, for this price difference you may be able to double the number of cores, greatly increasing processing power.
Multiple core vs single core CPU
You want each board’s CPU to have multiple cores, otherwise you are increasing cost, wasting space and increasing electricity usage. I am assuming you will be programing using a multi-threaded language which supports multiple cores such as Java 8 (or C, C++, C#, Swift, Go). In theory, it is possible to use multiple cores with scripting languages, but using interpreted scripts without strong data types (choosing 8 bit variables instead of 16, 32, or 64 bit) to process billions of data points is not something that interests me. 
In essence, if you are writing your code for multi-threading buy multiple-core boards, if not, then save money and get single core boards (Raspberry Pi Zero, or CHIP).
RAM
You want as much RAM as you can afford, however most well designed Java programs run just fine in 256MB of heap space. There should be nothing wrong building your system from nodes having only 512MB, or 1GB RAM each. More RAM would be nicer, but there are few inexpensive choices in early 2016. If your software takes more than available physical memory (RAM chip) there is a “swap” memory created on the SD card, which is slow and should be monitored.
Fast SD cards
The Class 10, 16Gb card cost about $8 each. You want your card as fast as it makes sense financially. Check the actual read transfer rate before buying. The rate of 80MB/s, or above is desired.
Internet connection
You should attempt to create software that minimizes the use of Internet as it is a speed bottleneck. 
If your processes are not self-sufficient as far as data management, i.e. input or output data is not stored on SD card, you will have to choose between Ethernet, or WiFi. If you transfer massive amounts of data you may opt of Gigabit Ethernet cable connection, but that increases the cost and size of the setup drastically. 
You will need Internet access to set up at least the first board. You will have to update all the software, download the languages and tools and write all of that to SD card which then you will duplicate. 
You may also want to use Internet access to remotely login to your boards via SSH to administer the running processes.
You can opt for USB WiFi dongle which adds about $8 per board, but takes USB slot that you might need for keyboard. 
Available SBC options as of early 2016
The table below shows you a comparison of few of the boards available as of writing of this book, if you are reading this later, the provided specifications will feel very inadequate, however your research and selection may follow same guidelines.
The comparison shows that for about $1,000 we could get the 256 cores of computing power when using quad-core “Orange Pi”, these boards work with some Linux images including popular Ubuntu. The company was tiny in 2015, about 10 people in China as far as I know and support for the product is minimal, but the community support is growing fast and that is all you need, let’s hope they will stay in business. 
Be aware that Orange Pi boards are not powered from the USB cable like Raspberry Pi, but from the 1.7mm x 4mm yellow-tipped barrel plug, same as Sony PSP. I solved this (potentially very costly) issue by buying 100 of the plugs bulk and running them from common wire connected to voltage regulated 5V power supply.
The challenge with using the inexpensive version will be programming within 512MB RAM footprint, but going to 1GB doubles the price. I would suggest to write more efficient algorithms at cost of using more parallelism.
 Table 1. Comparison of SCB available as of March 2016
 
In discount boards, another constrain may be the lack of included WiFi radio. You can use Ethernet, but they are bulky and add cost. You can add WIFi with $7 per board for USB option.
You can attempt to build the system without Internet. 
Set up the Linux OS and all the tools on the single board with the Internet access and make sure it works on all of your boards. 
Create your software and a batch file that runs automatically after the start of the system. 
On your desktop, create a script that copies the “new job for node X” updated batch file and required data to SD with single press of the button
Insert the updated SD card into board X and restart it
The software runs automatically - as a bonus you can flash a green diode
When the board finishes processing of your data it flashes the red diode
Remove the SD card and enter it into a computer attached to NAS to copy the resulting data for further processing

Example of 2014 the top-end quad core i.MX6 board with 1GB RAM SBC that retailed at about $200, I have used that board professionally for a long time. Today it can be purchased for about $130 and it would be a terribly cost-inefficient option for proposed cluster computer.
Staking boards
LEGO blocks
You can get very creative as far as how to stack multiple boards together. On YouTube I have seen people using LEGO blocks and for a while I used them too, even bringing the setup to work. However, believe or not the LEGO solution became expensive and unstable. I had to glue together the blocks to keep them from coming apart, I also had to cut notches in them for best fit. It was a mess, I do not recommend it.
Clear cases with velcro

Using clear plastic cases designed for the board with velcro tapes is probably the most bulletproof way to stack the SBCs, it protects the board in the best possible way. 
It is however a very expensive solution when your collection of boards grows and it does not deal with the heat dissipation issues. It is very fine solution for individual board, but a poor choice for the 64 node heat monster.
M3 Brass Pillars
I found that going back to electronic basics and using screw pillars is the best way to stack SBCs.
 
I would recommend using M3 (metric) pillars, as they are the right size. I originally bought M2 and they were tiny and flimsy (see image). You will have to space the boards about 1 inch apart, or 25 mm so plan to buy accordingly. 
You can search for “M3 Male-Female Brass PCB Spacer Hex Standoff Screw Pillar 25 mm” for about $10 per 30 pieces, you will obviously need 4 pieces per board you add.
You can use plastic pillars to save weight, or steel versions to increase strength, but I like brass better. 
Putting it all together
Rack, wall mounted or desktop
Before designing the layout and choosing the materials you have to decide where you want to keep your cluster computer. 
Most of the people will start with a desktop setup, but that, aside from taking valuable desk space, is inherently dangerous for your investment as the computer can slide off the desk and break. 
By using plexiglass case with a backing plexiglass wall you can create a wall-mounted display. All you have to do is to drill couple oversized holes in the upper side of the backing plate that will slide over anchor bolts sticking from the wall. If your building uses wood-frame  construction, make sure the anchor bolts are set in frame wood posts (e.g. 2x4) and not in the soft gypsum drywall. The case can be very shallow, especially when SBCs are placed on the side (e.g. Orange Pi One). I am assuming that for the wall mount you are running no Ethernet cables.
If you decide to run a setup with Ethernet cables, you probably want these cables routed to the back of the case which may force you in case of Orange Pi to have extra spacing between the boards for SD card access on the sides. For Ethernet setup I would recommend to compose your setup into a sturdy steel, or aluminum rack.
Spacing and board orientation
I would recommend generous spacing between the boards to allow for air ventilation, but also for easiness of access. I am assuming that you will SSH to the boards if you need to administer them individually. I also assume that you will set up the SD card with the operating system and everything you need on a separate board and simply pop-it in the node you need and re-boot the SBC. You will need access to SD card slot and to the reset button if one is provided. 
On Orange Pi One, for example you might choose to have one side facing you which contains: microUSB, HDMI, SD and 5V power jack, you will have a limited access to USB and  Ethernet as they will face to the side. This setup would be very wide and not very deep, which would make for a nice wall mounted case.
Controlling the temperature
To control the temperature you might want to get a $10 no-touch infrared thermometer (automotive) gun to check the temperature of the individual components of your setup. 
The choice of the “bloated” OS may affect how hot the board is running, turning off unnecessary Linux services will definitely help, but that is a subject for a separate book.
I recommend the ventilation fans, if really needed, to be placed on top so the hot air is being sucked up and does not build up. I did not have need to use fans so far.
If your setup builds up dust it is easy enough to get a can of computer-specific compressed air and clean the components.
 If you will start noticing the overheating problems you can do any of the following things (provided in order):
 verify what OS components are running that are not necessary
 space components farther apart
 drill more ventilation holes in the case sides
 install computer-grade vent fans on top of the case to suck hot air up
 get heat sinks for the CPUs
 solder heavy gauge wire coils  from the “heat sink” to the supporting aluminum rack
 explore solutions such as the cooling copper tubes looping water using simple aquarium pump, make sure fish are warm water tolerant i.e. Nile, or Amazon species.
Case
I think the design provided by Josh Kiepert is very practical and attractive. I would recommend to put heavy 5V power supply box, NAS hard drives, and any hubs on the bottom. The case is easily made of plexiglass panels readily available in stores like Home Depot. 
The simplest way to join plexiglass panels is to use steel 90 degree angle brackets, drill the holes thru the plexiglass and nut and bolt everything together, use blue Locktite once you finalize the design you like.

Another solution would be to cut small pieces of thicker plexiglass for each inside corner, glue them in place with a clear glue, drill the holes thru both wall and the supporting corner pieces, tap them to create a thread and bolt with M3 screws to strengthen the construction. I like using the hex/allan wrench head screws.
I am assuming that you start with couple of SBC boards to test your software. Once proven working, you may expand up to 64 nodes as needed. If your boards are of the same type your design could be organized very nicely. My personal setup is composed from various SBC boards that I collected and tested over the years. There is no sense in not using variety of boards as they all run Linux and Java, the only problem is that initial Linux setup will vary from one type of the board to another and you cannot mix them.
For smaller setups you could get creative. I have saved two, absolutely beautiful, Mac tower computer cases from around year 2001-2002, they already include the cooling fan and power supply and they easily fit 12 boards, which gives me 48 core, desktop cluster computer.
Alternative SBC - Android phones
People replace their smartphones every year, everyone wants the newest most powerful model. The $600 phones 3 years later become obsolete and worthless, yet they still feature a relatively powerful CPU, multiple cores, RAM, WiFI and build in display with virtual keyboard. As Android developer I have a drawer full of them and they can be obtained, used, at low cost, especially if  you are working in university settings with thousands of students around. 
I admit this is an amateur looking solution, but it should be considered. You could build a simple rack with the same M3 standoff brass pillars, but instead of board you use a thin aluminum sheet, just big enough to securely hold one phone each. I would consider brass and aluminum rack for heat dissipation as phones, being encased in plastic do get hot.
Android phones allow you to program in (subset of) Java and having built-in WiFi they can be constantly asking for more work to a central Intranet based sever. That server could be as simple as NAS (SBC board with network attached storage) with the data to process, data results and maybe auto generated XML, or JSON file that describes what each node should be doing next. 
The beauty of this solution is that all you need is powered USB hub and as bonus, your cluster computer can deal with power outages for several hours and having the displays you can check the progress status of a given node.
Finally, if you have an access to a class of students, you might want to experiment with an app that does the calculations totally remotely in the pocket of the student.
Storage and NAS
Every lab will have different needs, if you are working only on few genomes then your needs will be minimal and all you have to care about is a good backup procedures for data for your SD cards.
For labs operating on large quantity of big data, the storage could be by far the most expensive hardware investment. You should use Redundant Array of Inexpensive (~$90 per 3 TB) Disks or RAID 5 or 6. This allows you to put your data on several disks for safety reasons in case when one of the disks fails. Because of this redundancy of the data only about 50% of the purchased disk space is available.
Network Attached Storage (NAS) is nothing else, but a dedicated SBC governing RAID, they can be very expensive on the upper end of the spectrum when designed to stream large quantity of real time HD video, we do not need that. You have to plan the system holistically, if your WiFi router has a gigabit Ethernet connector then that is the max bandwidth that NAS needs to be able to support.
You can start your software experiments with few disks, but this may run out quickly. When you determine that you need NAS, you can start with $180 box that has 4 hard drive bays, if you decide to populate it with four 3TB disks the total cost will be a little above $500 by the time you are reading this.
Use of storage may range of multiple Peta Bytes (PB) for clinical applications.

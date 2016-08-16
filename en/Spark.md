

# Jupyter Scala on Spark

[TOC]

## Jupyter

### Anaconda - install Jupyter

You need to have Anaconda installed with Python 3.5

```shell
$ conda install jupyter
```



### Jupyter version

Make sure you have installed Jupyter

```shell
$ jupyter --version
4.1.0
$ pip install --upgrade jupyter
Requirement already up-to-date: jupyter in /Users/ukilucas/anaconda/lib/python3.5/site-packages
```



### Jupyter Kernels

### Scala - Installing Kernel for Jupyter



Follow instructions:
https://github.com/alexarchambault/jupyter-scala

Jupyter Scala

Scala 2.11 - HIGHER VERSION


```shell
$ curl -L -o jupyter-scala https://git.io/vrHhi 
&& chmod +x jupyter-scala 
&& ./jupyter-scala 
&& rm -f jupyter-scala


  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current

                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--     0
100   150  100   150    0     0     61      0  0:00:02  0:00:02 --:--:--  1428
100 14186  100 14186    0     0   4379      0  0:00:03  0:00:03 --:--:--  4379
Generated /Users/ukilucas/Library/Jupyter/kernels/scala211/kernel.json

Run jupyter console with this kernel with
  jupyter console --kernel scala211

Use this kernel from Jupyter notebook, running
  jupyter notebook
and selecting the "Scala 2.11" kernel.
```

Scala 2.10 - LOWER VERSION

```shell

$ curl -L -o jupyter-scala-2.10 https://git.io/vrHh7 
&& chmod +x jupyter-scala-2.10 
&& ./jupyter-scala-2.10 
&& rm -f jupyter-scala-2.10

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100   155  100   155    0     0    292      0 --:--:-- --:--:-- --:--:--  151k
100 14151  100 14151    0     0  12248      0  0:00:01  0:00:01 --:--:-- 12248
Generated /Users/ukilucas/Library/Jupyter/kernels/scala210/kernel.json

Run jupyter console with this kernel with
  jupyter console --kernel scala210

Use this kernel from Jupyter notebook, running
  jupyter notebook
and selecting the "Scala 2.10" kernel.
```



### R language - Installing Kernel for Jupyter

```shell
~ $ conda install -c r r-essentials
~ $ conda create -n r-kernel -c r r-essentials
~ $ source activate r-kernel
```





### Apache Toree



```shell
$ pip install toree
Requirement already satisfied (use --upgrade to upgrade): toree in /Users/ukilucas/anaconda/lib/python3.5/site-packages
Requirement already satisfied (use --upgrade to upgrade): traitlets<5.0,>=4.0 in /Users/ukilucas/anaconda/lib/python3.5/site-packages (from toree)
Requirement already satisfied (use --upgrade to upgrade): jupyter-client<5.0,>=4.0 in /Users/ukilucas/anaconda/lib/python3.5/site-packages (from toree)
Requirement already satisfied (use --upgrade to upgrade): jupyter-core<5.0,>=4.0 in /Users/ukilucas/anaconda/lib/python3.5/site-packages (from toree)
> dev $ 
```

```shell
$ dev $ jupyter toree install
[ToreeInstall] Installing Apache Toree version 0.1.0.dev8
[ToreeInstall] 
Apache Toree is an effort undergoing incubation at the Apache Software
Foundation (ASF), sponsored by the Apache Incubator PMC.

Incubation is required of all newly accepted projects until a further review
indicates that the infrastructure, communications, and decision making process
have stabilized in a manner consistent with other successful ASF projects.

While incubation status is not necessarily a reflection of the completeness
or stability of the code, it does indicate that the project has yet to be
fully endorsed by the ASF.

Additionally, this release is not fully compliant with Apache release policy
and includes a runtime dependency that is licensed as LGPL v3 (plus a static
linking exception). This package is currently under an effort to re-license
(https://github.com/zeromq/jeromq/issues/327).
[ToreeInstall] Creating kernel Scala
[ToreeInstall] Installed kernelspec apache_toree_scala in /usr/local/share/jupyter/kernels/apache_toree_scala
```



#### Configuration of Apache Toree Scala - Spark Kernel

```shell
$ edit /usr/local/share/jupyter/kernels/apache_toree_scala/kernel.json 
```





### Jupiter Kernels - languages available to write with


```shell

 $ jupyter kernelspec list
Available kernels:
  python3               /Users/ukilucas/anaconda/lib/python3.5/site-packages/ipykernel/resources
  scala210              /Users/ukilucas/Library/Jupyter/kernels/scala210
  scala211              /Users/ukilucas/Library/Jupyter/kernels/scala211
  ir                    /Users/ukilucas/anaconda/share/jupyter/kernels/ir
  apache_toree_scala    /usr/local/share/jupyter/kernels/apache_toree_scala
  
```



### Jupyter Configuration



```shell
$ cd ~/.jupyter
(r-kernel) > .jupyter $ ls -alt
total 8
drwxr-xr-x+ 73 ukilucas  staff  2482 Aug 15 17:24 ..
drwxr-xr-x   3 ukilucas  staff   102 Aug 15 17:14 .
-rw-r--r--   1 ukilucas  staff    26 Aug 15 17:14 migrated

```



### Start Jupyter Notebook

```shell
$ ipython notebook
[TerminalIPythonApp] WARNING | Subcommand `ipython notebook` is deprecated and will be removed in future versions.
[TerminalIPythonApp] WARNING | You likely want to use `jupyter notebook` in the future
[W 17:20:34.215 NotebookApp] Unrecognized JSON config file version, assuming version 1
[I 17:20:36.777 NotebookApp] [nb_conda_kernels] enabled, 3 kernels found
[I 17:20:37.283 NotebookApp] The port 8888 is already in use, trying another port.
[I 17:20:37.603 NotebookApp] [nb_conda] enabled
[I 17:20:37.956 NotebookApp] ✓ nbpresent HTML export ENABLED
[W 17:20:37.956 NotebookApp] ✗ nbpresent PDF export DISABLED: No module named 'nbbrowserpdf'
[I 17:20:38.618 NotebookApp] [nb_anacondacloud] enabled
[I 17:20:38.626 NotebookApp] Serving notebooks from local directory: /Users/ukilucas/Library/Jupyter/kernels
[I 17:20:38.626 NotebookApp] 0 active kernels 
[I 17:20:38.626 NotebookApp] The Jupyter Notebook is running at: http://localhost:8889/
[I 17:20:38.626 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```

It should open a browser with:

http://localhost:8889/tree





## Spark

### Starting Spark



```shell
$ edit ~/.bash_profile
export SPARK_HOME=/Users/ukilucas/Spark/spark-2.0.0-bin-hadoop2.7
```



```shell
~ $ cd /Users/ukilucas/Spark/spark-2.0.0-bin-hadoop2.7/bin/
bin $ ./spark-shell
Spark context Web UI available at http://192.168.1.70:4040
Spark context available as 'sc' (master = local[*], app id = local-1471313270178).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.0.0
      /_/
         
Using Scala version 2.11.8 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_92)
Type in expressions to have them evaluated.
Type :help for more information.

scala> 

```





# Aparapi - Java GPU programming (OpenCL)

Download and run examples.

[Aparapi_2012_01_23_MacOSX_zip](https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/aparapi/Aparapi_2012_01_23_MacOSX_zip)

## GPU info


```shell
$ cd /Applications/Aparapi/Aparapi_2012_01_23_MacOSX_zip/samples/
> info $ sh info.sh
com.amd.aparapi.sample.info.Main
Machine contains 1 OpenCL platforms
Platform 0{
   Name    : "Apple"
   Vendor  : "Apple"
   Version : "OpenCL 1.2 (Feb  7 2016 15:43:50)"
   Platform contains 2 OpenCL devices
   Device 0{
       Type                  : CPU
       GlobalMemSize         : 17179869184
       LocalMemSize          : 32768
       MaxComputeUnits       : 4
       MaxWorkGroupSizes     : 1024
       MaxWorkItemDimensions : 3
   }
   Device 1{
       Type                  : GPU
       GlobalMemSize         : 1610612736
       LocalMemSize          : 65536
       MaxComputeUnits       : 48
       MaxWorkGroupSizes     : 256
       MaxWorkItemDimensions : 3
   }
}
OpenCLDevice.best() returned { 
   Type                  : GPU
   GlobalMemSize         : 1610612736
   LocalMemSize          : 65536
   MaxComputeUnits       : 48
   MaxWorkGroupSizes     : 256
   MaxWorkItemDimensions : 3
}
OpenCLDevice.firstCPU() returned { 
   Type                  : CPU
   GlobalMemSize         : 17179869184
   LocalMemSize          : 32768
   MaxComputeUnits       : 4
   MaxWorkGroupSizes     : 1024
   MaxWorkItemDimensions : 3
}
OpenCLDevice.firstGPU() returned { 
   Type                  : GPU
   GlobalMemSize         : 1610612736
   LocalMemSize          : 65536
   MaxComputeUnits       : 48
   MaxWorkGroupSizes     : 256
   MaxWorkItemDimensions : 3
}
> info $ 
```

### Example of Squares


```shell

$ cd /Applications/Aparapi/Aparapi_2012_01_23_MacOSX_zip/samples/squares 
> squares $ sh squares.sh
Execution mode=GPU
     0        0
     1        1
     2        4
     3        9
     4       16
     5       25
     6       36
     7       49
     8       64
     9       81
    10      100
    11      121
    12      144
  ...
   509   259081
   510   260100
   511   261121
   
```


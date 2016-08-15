# Jupyter-scala

Follow instructions:
https://github.com/alexarchambault/jupyter-scala


Make sure you have installed Jupyter

```shell
jupyter --version

4.1.0

```

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




```shell

$ jupyter kernelspec list
Available kernels:
  python3     /Users/ukilucas/anaconda/lib/python3.5/site-packages/ipykernel/resources
  scala210    /Users/ukilucas/Library/Jupyter/kernels/scala210
  scala211    /Users/ukilucas/Library/Jupyter/kernels/scala211
  
```





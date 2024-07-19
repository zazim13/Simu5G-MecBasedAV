TODO: write tutorial

#  README

This repository is a forked from Simu5G(https://github.com/Unipisa/Simu5G.git) project.
We add a scenario featuring Connected vehicles and MEC. We implemented a parametric "vehiclar" service aiming to mimic the behaviour of real world "application".
This service is composed by a UEApplication and a MECApplication as shown in our model: 



The parameters of this service can be change in order to adapt to experimenteur needs. Tunable parameters are the following:  

- Uplink
  - payload size --> The size of the payload at the applicaiton level
       - Can be modified href="http://github.com/user/project/blob/master/Readme.md#my-anchor">here</a> 
       
         https://github.com/zazim13/Simu5G-MecBasedAV/blob/46be7c3a4f5ccf6b3a294887d2605b4873e6392a/src/apps/PingPong/UEPingPongApp.cc#L642
       - Or in the ini file directly here.
         https://github.com/zazim13/Simu5G-MecBasedAV/blob/5284bb357f1e9413ce2399cb2ba85387022a1069/simulations/NR/mec/vehicularMec/omnetpp.ini#L268
  - Inter sending time 
- Downlink
  - payload size --> The size of the payload at the applicaiton level
  - Inter sending time(for synchronous model) or always answering (for asynchronous model)
- Processing: Millions Instructions associated to each received request 
- Dissemination radius for cooperative applicaitons. This type of applicaiton correspond to applicaiton n°1 as shown in the following figure, where the edge process sensed data and retrieve them to a certain area arround the vehicle that is performing a cooperative service.


![Model](illustrations/model.png)


## Our Model 

![Model](illustrations/system.png)


## Exemple of simulations

Here is the default example:
![image](illustrations/experiment.png)



## Requirements 
This repo has the same requirements than Simu5G. 

## Installation 
### Graphical installation 
- Clone repo
- Import the repo
- Add feature
- Add reference
- Build repo(attention to builder)
### CLI installation
- . setenv
- make makefiles 
- make MODE=debug all (attention)


## Compatibility 

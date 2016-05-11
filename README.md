# Environment Monitoring & Management Agent

EMMA provides software tools to build distributed Smart Environments based on Wireless Sensor & Actor System (WSAN). The different softwares provide a cross-plateforms middleware for tiny embedded  systems (emma-node), a simulation environment based on platform emulation (emma-cooja) and a Java application for system supervision and application design (emma-agent-designer). 

The recent developpment of Web services for user data management like web calendars, sound platforms, etc provides new ways for the consideration of domotic systems. The Internet of Things represents a new kind of technology in which the Internet and physical environments should be linked to augment our daily environments. If on one hand user experience, energy management, security and human protection could be improved by Smart Environments, the data privacy and network management are important challenges. In order to address these issues, the EMMA framework proposes tools to distribute processings onto the WSAN in order to keep local the sensitive data whereas the data exchanges with Internet are limited. An IoT application is supposed to manage the system outputs: the actuators, remote Web applications, etc according to inputs such as sensors or Internet information. For example an application could be a morning clock which turns on progressively the lights and the favorite sound platform according to a Web calendar. 

The framework provides an abstraction of network and node hardwares to a Distributed RestFul Ressource architecture. Each Input-Output (IO) of the system, such as actuators, sensors or remote web services, are accessible thanks to an URI. The middleware provides service container interfaces in order to implement hardcoded processings into the nodes, which are interconnected by Service Choreographies. Three basic services are availables: System (/S/) for the control of sensors, actuators and system parameters, Local (/L/) for the storage of temporary variables or files and an Agent Virtual Machine (/A/). The agents are implemented into tiny JSON files in order to describe rules of Publish-Subscribe patterns according to internal node state. When an agent is triggered, it emits one or several Web / CoAP requests on a ressource URI. Hence a Service Choregraphy is a ressource graph formed by a set of agents which produce computation flows between node services in the WSAN (sensor, ligths, heating, alarm clock, etc), local Web Services (Tablet, SmartPhone, TV, etc) and Internet platforms (sound platform, calendar, etc),.

## emma-node
The middleware is implemented on the micro-kernel Contiki OS which provides a full 6LoWPAN stack (IPv6 Low power Wireless Personnal Area Network) and Operating System functionnalities such as thread and memory management, application scheduling, etc. The Contiki OS application emma-node is based on Erbium CoAP Webservices (Constraint Application Protocol) in order to provide Restful interfaces between networked applications and system services (actuators and sensor drivers, local hardcoded services, Contiki OS configuration (timer, routing, networking, etc). In following Figures, each color represents a particular service with its produced ressources accessible remotely in order to interconnect them thanks to the agents (blue color).

<p align="center">
  <img src="https://github.com/slash6475/emma/blob/master/img/emma-node.png" width="350"/>
  <img src="https://github.com/slash6475/emma/blob/master/img/emma-node-network.png" width="350"/>
</p>

## emma-cooja
The simulator COOJA provided with Contiki OS toolchain allows node platforms to be emulated in a wireless network simulation. The emma-cooja package provides additionnal tools to monitor and control internal EMMA ressources and their interractions. The Border Edge Router (WSAN entry point) connects the hosting OS (Linux or Window) to the WSAN simulation thanks to a tunslip6 interface (tunnel serial line IPv6). Therefore the hosting OS can communicate directly to the nodes without additionnal drivers. Any Web browser or others networked applications can be used to communicate with the nodes over IPv6. In addition, the tunslip6 is a native network interface on Linux which can be used for mixed simulations with emulated and real nodes through network bridges.

<img src="https://github.com/slash6475/emma/blob/master/img/emma-cooja.png">

## emma-agent-designer
The emma-agent-designer is a Java software for the design, the mapping and the deployment of the Service Choreographies over the EMMA middleware. The design model is based on Petri Networks which allows the applications to be simulated and analyzed in order to validated their logical behaviour. Each place represents a ressource which are connected by the transitions (agents). Because the agents are also ressources, each transition is associated to a place in order to be created, modified or deleted by others transitions (agents). Therefore the Service Choreographies can be dynamic and mobile. The deployment process is itself a Service Choreography in which agents populate the different nodes by the ressources including other agents. The ressource mapping is operated by a Pseudo Boolean Optimization in order to minimize network communications over the WSAN.
<img src="https://github.com/slash6475/emma/blob/master/img/emma-designer-tools.png">

# HowTO

## Installation
The installation process will retrieve automatically the different EMMA packages from Github in order to install them in the destination folder.

``
bash install --dest=FOLDER
``

## Uninstall
``
bash install --uninstall --dest=FOLDER
``

# Contributors
This project has been designed in the context of the thesis Toward Organic Ambient Intelligence ? EMMA. The following students have actively participated in the implementation of EMMA packages during their intership supervised by @slash6475. Thanks for their participation: Nicolas Mardegan, Oussama Sabri and Pierre Sauvage.


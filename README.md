# EMMA: Environment Monitoring & Management Agent

EMMA provides software tools to build distributed Smart Environment based on Wireless Sensor & Actor System (WSAN). The different software provides a middleware for tiny embedded plateforms (emma-node), a simulation environment based on platform emulation (emma-cooja) and a Java application for system supervision and application design (emma-agent-designer). 

An application is composed of distributed processings over the WSAN in order to manage the system outputs: actuators, remote Web applications, etc. For example an application could be a morning clock which starts progressively the lights and the favorite sound platform according to a Web calendar. 

The framework provides an abstraction of network and node hardware to a Distributed RestFul Ressource architecture. Each Input-Output (IO) of the system, such as actuators, sensors or remote web services, are accessible thanks to an URI. The middleware provides service container interfaces in order to implement hardcoded processings into the nodes, which are interconnected by Service Choreographies. Three basic services are availables: System (/S/) for the control of sensors, actuators and system parameters, Local (/L/) for the storage of temporary variables or files and Agent Virtual Machine (/A/). The agents are implemented into tiny JSON files which describes rules of Publish-Subscribe patterns according to internal node state. When an agent is trigered, it emits one or several Web / CoAP requests on a ressource URI. Hence a Service Choregraphy is a ressources graph formed by a set of agents which produced distributed computation flows between node services in the WSAN (sensor, ligths, heating, alarm clock, etc), local Web Services (Tablet, SmartPhone, TV, etc) and Internet platforms (sound platform, calendar, etc),.

### emma-node

### emma-cooja

### emma-agent-designer




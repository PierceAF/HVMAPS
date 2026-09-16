# Log

## February 12, 2026

Had Physics IT install:

* Ubuntu (through [WSL](https://ubuntu.com/desktop/wsl))
* Mattermost (had to do [risk assessment](https://it.ufl.edu/security/audiences/faculty--staff/irm/risk-requests-and-assessments/))
* VS Code
* National Instruments Package Manager
  * They also installed:
    * Labview
    * DAQmx

## April 23, 2026

Added device manuals to ``~/Documents/HVMAPS`` folder

Installed some basic VS Code extensions

On Anaconda Navigator, created HVMAPS environment

* [using conda environments on VS Code](https://www.anaconda.com/docs/getting-started/guides/ides/vscode)

* [pip with conda](https://www.anaconda.com/docs/getting-started/working-with-conda/packages/pip-install##understanding-conda-and-pip)

[Tektronix Python Automation](https://www.tek.com/en/solutions/application/test-automation/python-automation)

## April 24, 2026

Following the steps from the [manual](</Equipment/Cables and Adapters/Contec GPIB to USB/Manual.pdf>), started installing GPIB [driver](https://www.contec.com/en/download/contract/contract2/?itemid=311d6ea4-124f-400c-a55d-daa01a477c90&downloaditemid=d859210b-2e39-425e-9b07-884ce6d15db0)

* Stuck on pg 28. In Device Manager, it won't let me put in the device name
* Contacted Contec

[Keithley GitHub](https://github.com/tektronix/keithley) has many useful tutorials and such

Deleted conda HVMAPS env. The python packages needed are not on conda, so will just use python virtual environments

Installed Python Install Manager from Microsoft Store

Installed latest python

Started the steps for VISA and Python on VS Code [setup 1](https://github.com/tektronix/keithley/blob/main/Instrument_Examples/General/Instructables/Get_Started_with_Instr_Control_Python/Getting%25252520Started%25252520with%25252520Instrument%25252520Control%25252520Using%25252520Python%252525203%25252520-%25252520VS%25252520Code%25252520Revision.pdf) and [setup 2](https://dev.tek.com/en/getting-started-guides/simplifying-test-automation-with-tmdevices-and-python)

* In python virtual environments installed:
  * tm_devices
  * numpy
  * matplotlib

## April 29, 2026

Continuing Contec GPIB

* Needed admin to run diagnosis
* Need to test with Keithley

Contacted Tektronix

* Their HV triax cables are different from normal triax
* They do not make adapters to BNC
* Will need their triax to PCB connector
  * Need to see if it can replace the SMA to PCB already on the test board

## May 1, 2026

Installed [git](https://git-scm.com/install/windows)

[Keithley Triax PCB connector](https://www.tek.com/en/datasheet/model-trx-1100v-pcbconn-high-voltage-female-pcb-connector-instructions) is too large for the test board pad

## May 12, 2026

Installed [TSP Toolkit](https://www.tek.com/en/manual/tsp-toolkit-quick-start-guide)

* Connected USB to back panel
* Launched NI-VISA Interactive Control
* Copied the VISA USB string into TSP Toolkit New Connection
* Seems to connect
* In System Configurations, clicked Fetch connected... which seemed to work
* Tried Script Generation but says

    > Script generation requires channels from a selected system configuration.
    > Please select a system configuration that includes:
    > * An MP5103 mainframe
    > * Either MPSU50-2ST or MSMU60-2 modules installed in slots
    > * Located in the localnode or one of the TSP-Link nodes

* Looks like MP5013 mainframe is hardware that needs to be bought, so can't use Script Generation.

Have to log out of GitHub.com for VS Code to not allow sign in without password

Keithley firmware is up to date (1.7.16)

## May 13, 2026

Created git repository

Set up ability to switch between git users on the Lab PC with [newuser.ps1](./Code/User/newuser.ps1) and [whoami.ps1](./Code/User/whoami.ps1)

## May 14, 2026

Updated README

* Create and switch to new branch
* Sign in/out of Lab PC

## May 18, 2026

Moved user profile info from whoami.ps1 to users.ps1 (which is git ignored)

## July 10, 2026

Created Inventory excel sheet in [/Equipment](./Equipment)

**To do:**

- [ ] short R6
- [x] figure out how to put triax connector on J18 (CSA OUT) so that the guard does not connect to AGND

For J57-59, core prong looks too wide for connector strip on PCB. Maybe try to elevate the outer 4 guard prongs with solder, then connect core prong with solder?

## July 13, 2026

The plan for test board with triax connectors is get a box and mount the traix PCB connectors on the box such that they are physically floating over the test board. Then solder some wire connecting the core of the triax connector to test board pad.

## July 16, 2026

Installed [UF Apps Horizon Client](https://it.ufl.edu/ufapps/resources/web-access-and-desktop-client/)

Started modeling test board in SketchUp

## July 21, 2026

Switched to modeling in Autodesk Inventor on UF Apps

## August 25, 2026

Received Scanning TCT

* Started unpacking and setup
  * attached handle
  * attached hose plugs (not sure if o-ring is on right side)
  * taped edges to prevent light entering

* To remove front door on TCT:
  1. Open door
  2. On the hinge, locate the arrow drawn in sharpie
  3. The arrow points to a hole. Place a flat head screwdriver in the hole and pry down. This should release the hinge.
  4. Tilt the top of the door away from the arrow and pull the door out of the elbow joint
  5. Rest the top of the door hing on the elbow joint above the arrow
  6. Repeat for other side
* Door has soft-close going down but not up, so be careful opening

## August 27, 2026

Continued TCT setup:

* mounted optics mount, attached optic, and connected motor control cable
* connected +12V on AM-02A to AMP PWR on box
* connected power and USBs to step motor controllers

Laser needs 220V/50Hz or 110V/50 Hz, but 220V is crossed out and 115V is written below. Need an adapter for US 120V/60Hz? Emailed Particulars.

- [x] Need EU to US outlet converter

May have messed up placement of insert for LEMO FA.0S

 - [ ] Since the laser is class 3b, need to follow these [requirements](https://www.ehs.ufl.edu/departments/research-safety-services/radiation-safety/laser-safety/)

## August 28, 2026

Particulars said laser power supply is correct one for USA

## September 14, 2026

Setup laser for TCT. There are two power ports (LASR PWR and BM/LAS PWR) for the laser on the power supply. Asked Particulars what the difference was

## September 15, 2026

Ordered new power cords to replace EU ones that came with motion table and light for TCT

Ask laser safety officer about:

- [x] sensor for door and interlock
- [x] SOP

## September 16, 2026

Particulars says either port for laser power supply works. BM = beam monitor

Laser Safety Officer (Jason Timm) said if we interlock the door to the TCT, it can be classified as Class 1 laser, so won't need safety glasses or anything.

Started filling out SOP

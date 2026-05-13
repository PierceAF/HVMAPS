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

Added device manuals to ``/Documents/HVMAPS`` folder

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

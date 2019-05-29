Installing Python
https://www.python.org/downloads/release/python-2714/
You will need to use Python 2.7.14 (Python 3 not officially supported at the moment)
Opt to use the 32-bit version, as not all dependencies are available in 64-bit
It should automatically install to C:\Python27 

Set Environment Paths
Add the following locations to your environment path:
C:\Python27
C:\Python27\Scripts
In windows, this is done by going to Start -> Edit The System Environment Variables

Installing Libraries
Once you have PIP up and running (PIP should automatically be installed when you install Python), follow the steps below,

In the command prompt, navigate to 'lib_install.bat' file
Run the 'lib_install.bat' file. This will install all the libraries required to run the framework. 
Install Selenium Browser Drivers
In order for your selenium based Robot scripts to run, you will need to download and install browser drivers for each of the browsers you plan to test. Each driver is simply a single executable (.exe) file that you can download from here:

http://www.seleniumhq.org/download/ 
Opt for 32-bit drivers where possible. Best place to put them is in your Python Scripts folder as that is already part of your windows path (by default it is C:\Python27\Scripts)
Note : Check your Chrome version and download it compatible ChromeDriver. 

Install PyCharm (Community version)
PyCharm is a python IDE which has support for RobotFramework with specific plug-ins. This is the preferred tool to create keywords and test scripts. 

Download PyCharm (community version)
https://download.jetbrains.com/python/pycharm-community-2017.2.7.exe

RobotFramework Plug-in
Steps to install the plugin
Open PyCharm
Click on 'File' -> 'Settings'
Once the 'Settings' window opens, select 'Plugins' and then click 'Browser repositories...'
Search for 'Intellibot' and click 'Install'
Restart PyCharm

External tools (Robot executor)
The 'external tools' is used to create the test executors so that it is possible to execute robot tests from PyCharm. 
Click on 'File' -> 'Settings'
When the 'Settings' window opens, click on 'Tools' -> 'External Tools' then click on the 'add' symbol
When the 'Edit Tool' opens, set the following values and click 'Ok'

Set the Parameters to the following:

Program: C:\Python27\Scripts\robot.exe
Parameters: --pythonpath $ProjectFileDir$:$ProjectFileDir$\*:$ProjectFileDir$\*\*:$ProjectFileDir$\*\*\*:$ProjectFileDir$\*\*\*\*:$ProjectFileDir$\*\*\*\*\*:$ProjectFileDir$\*\*\*\*\*\* --loglevel DEBUG --variablefile $ProjectFileDir$\QA-challange\Resources\EnvironmentConfigs\PROD.py -b $ProjectFileDir$\Results "$FileName$"
Working directory: $FileDir$

This will execute all tests in a file.


How to use the new 'Robot-single test execution' external tool
Open the robot file that contains the tests you want to execute.
Right click and select 'External Tools' -> 'Robot-test execution'

Defects found in the given PHPTravel Website are as follows:

1. No matter what city user slects, it shows up same set of hotels
2. Bookings are not displayed under account profile if we try to book more than 3 bookings
3. Under Refine dates section after searching for rooms, it displays nights with harded coded value as 1 even if we are trying to book for more then 1 night.
4. Under Check Availability section after searching for rooms, it displays all booked out but still lets you proceed with booking any dates.

Defects found in the given WeatherAPI are as follows:

1. When searching on Postcode, if country is not selected, it shows incorrect data as different countries have different post code formats.

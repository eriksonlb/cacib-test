# CACIB Automation Test

This project was developed based on a test for a QA Automation position.

## Setup

**Python:**
It is necessary to have the latest version of Python installed. To do this, simply download the installer and follow the installation instructions: [Python Downloads](https://www.python.org/downloads/)

*Note: Make sure to add the Python PATH to the environment variables during or after the installation.*

To check, after this step, start the CMD or Terminal and type:
```
    python -V
```
Note: The command ***python*** may change depending on your OS system. The expected result is:
```
    Python 3.10.13
```
*Note: The version shown depends on the version that was downloaded and installed.*

### Development Environment and Libraries
It is a good development practice to create a virtual environment for each project, where the used packages will be installed and managed.

3. Therefore, after cloning the project, open the folder in the Terminal or CMD and type the command:
```
    python -m venv env_name
```
5. To activate the enviroment, type:
   
**Windows:**
```
    env_name\Scripts\activate
```
**Linux or MacOS**
```
    source env_name/bin/activate
```	
5. Now, to install the packages used by the project, type:
```
    pip install -r requirements.txt
```

**Web Driver**

  6. For each browser, it is necessary to download the corresponding webdriver for its version. To ensure the correct execution of the test, save the webdriver in the 'Webdrivers' folder.
  
  **Chrome**: [https://googlechromelabs.github.io/chrome-for-testing/](https://googlechromelabs.github.io/chrome-for-testing/)  
  **Firefox**: [https://github.com/mozilla/geckodriver/releases](https://github.com/mozilla/geckodriver/releases) 
 
 7. Change the variable **${WEBDRIVER_PATH}** in **Resources\variables.robot**, line 4, according with the file name of the webdriver.
    
### Project Structure


#### Folders
***
**Keywords**: Folder where the keywords used by the test cases are implemented. 

**Reports**: Folder where the reports of each execution will be saved. 

**Resources**: Folder where libraries and variables used by the tests are imported. 

**TestCases**: Folder where the test cases are written.

**Webdrivers**: Folder where the webdrivers should be saved.


**requirements.txt**: File listing the packages necessary for the project's execution.


### Running
To run the automation test, you need to refer to the file that contains the scenario and specify the path where the test report will be saved. Type the command below:
```
    robot -d Reports\ TestCases\Cart.robot
```
### Report

A report for each execution is automatically generated and saved in the project's root. To organize it, a ***Reports*** folder has been created, and to save the reports in this folder, it is necessary to add the command ***-d Reports*** when running the Robot Framework.

To view the report, open the ***report.html*** file in any browser.

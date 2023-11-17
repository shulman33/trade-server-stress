# Trade Server Stress Tests

## Instructions

- Unzip the python.zip file
- move the Python dir and the bash script to the top level of your Maven project

### Python Edits 
- activate the virtual environment - on mac `source venv/bin/activate` 
- install the requests library `pip install requests`

### Bash Edits
- Give the script the proper permission needed to run `chmod +x run_integration_test.sh`
- change the paths in the bash script to whatever your paths are

### Run the script
`./run_integration_test.sh`

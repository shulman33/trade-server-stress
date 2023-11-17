#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -eq 0 ]; then
    # No argument provided, set default value to 1
    num=1
elif [ "$#" -eq 1 ]; then
    # Extract the number argument
    num="$1"
else
    echo "Usage: $0 [<number>]"
    exit 1
fi

read -p "Enter the number of brokers to use: " broker_count
read -p "Enter the maximum number of threads: " max_threads
read -p "Enter the number of transactions to run: " loop_count

# Change to your Maven project directory
cd /Users/samshulman/Desktop/Shulman_Sam_9736998748/Parallel/trade-server

# Clean and build the Maven project
mvn clean package

# Start the Java server application with the specified number
java -jar ./target/trade-server-1.0.jar "$broker_count" &

# Wait for the server to start (you may need to adjust the sleep duration)
sleep 10
# Change to your Python project directory
cd /Users/samshulman/Desktop/Shulman_Sam_9736998748/Parallel/trade-server/python

# Run the Python stress test script
python3 stress_test.py $max_threads $loop_count $broker_count

# Optionally, you can stop the Java server application after the test
pkill -f "java -jar ./target/trade-server-1.0.jar"

sleep 10

read -p "Enter the number of brokers to use for the second stress test: " broker_count

# Start the Java server application with the specified number
cd /Users/samshulman/Desktop/Shulman_Sam_9736998748/Parallel/trade-server

# Clean and build the Maven project
mvn clean package

# Start the Java server application with the specified number
java -jar ./target/trade-server-1.0.jar "$broker_count" &

# Wait for the server to start (you may need to adjust the sleep duration)
sleep 3
# Change to your Python project directory
cd /Users/samshulman/Desktop/Shulman_Sam_9736998748/Parallel/trade-server/python

python3 stress_test_2.py

pkill -f "java -jar ./target/trade-server-1.0.jar"




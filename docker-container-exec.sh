#!/bin/bash

#Global vars

windowTitle="Docker-Container-Exec"
windowWidth=450
windowHeight=250

#Get the container - image list and creates the string with the next structure : image1 container1 image2 container2 ...
containerList='';
while read -r container; do
	containerList="${containerList} ${container}" 
done <<< $(sudo docker ps |  tr -s " " | cut -f 1-2 -d " " | tail -n +2); 


# Create the dialog to select the container
container=$(zenity --list --column="Container ID" --column="Image" $containerList --text="Select the docker container" --title="${windowTitle}" --width="${windowWidth}" --height="${windowHeight}");

# If no container has been select finalize the script
if [ -z "$container" ]
then
      exit;
fi

# Select the command to execute
commandList=$(cat commandList.json | jq 'keys' | head -n-1| tail -n+2 | tr -d '"' | tr -d ',');

command=$(zenity --list   --title="${windowTitle}"  --column= $commandList);

# If no command has been select finalize the script
if [ -z "$command" ]
then
      exit;
fi

# Get the command template
command=$(cat commandList.json | jq ".$command");

# Replace the command vars
command=${command//\$containerId/$container};

# Remove first and last "
command="${command:1:${#command}-2}";

#Exec the command
echo $command;
$command;

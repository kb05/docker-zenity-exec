# docker-zenity-exec
A simple Graphic UI that allows you to select a active container and a command to execute on it


#### Requirements

* Zenity (sudo apt-get install zenity )
* Docker 

#### How works?

1. Get all active docker containers
2. Create a zenity list interface, and asks the user to select the one that he want to work with (Get the containerID)
3. Get the list of available commands in commandList.json
4. Show the possible commands to execute over the selected container, and ask to the user that select one of them
5. Replace the ContainerID and execute the command with the ContainerID tag replaced with the user ContainerID.

![Script-Image](https://raw.githubusercontent.com/kb05/docker-zenity-exec/master/images/containerList.png)


![Script-Image](https://raw.githubusercontent.com/kb05/docker-zenity-exec/master/images/commands.png)


![Script-Image](https://raw.githubusercontent.com/kb05/docker-zenity-exec/master/images/commandExecuted.png)




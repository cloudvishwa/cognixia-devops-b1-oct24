## task1
* take the backup of jenkins folder , either copy of rsynch which ever
* create docker container for jenkins, and map the volume for the above synched folder, 
* so that the jenkins page running inside the docker , shows the same as your VM jenkins.

Hint: instead of copy of the complete jenkins folder, usin rsync to another folder, and do a volume mount.
Problems: the "Node1" may not WORK on docker jenkins.

## task2
* Migrate the current jenkins running in the current region to another region, without loss of data.

Hint: make sure only one 5GB disk is attached, remove all unwanted disks.


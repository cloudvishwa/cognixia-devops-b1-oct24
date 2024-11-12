
step1

1.  login to python container -- docker exec -it d0448effefe8 /bin/bash
2. create redis container -- docker run -d --name redis redis
3. get the ip of the redis container -- docker inspect redis/containerID | grep IPA
4. on the python , run the below 
   echo "ipaddofredis   redis" >> /etc/hosts

5. testing -- ping redis on python container 
6. refresh the page to test 
# docker-garmin-backup
> A dockerized version of [garmin-connect-export](https://github.com/JohannesHeinrich/garmin-connect-export).

This dockerized implementation of [garmin-connect-export](https://github.com/JohannesHeinrich/garmin-connect-export) is based on [Alpine Linux](https://hub.docker.com/r/_/alpine) and checks daily for updated content on your [Garmin Connect](https://connect.garmin.com)-account.

## Preparation
- git clone this repository
- cp garminbackup_crontab-example to garminbackup_crontab
- Populate the garminbackup_crontab-example file accordingly.

## Building & running the container locally
```bash
docker build -t docker-garmin-backup .
docker run -v /path/where/to/save/your/docker-garmin-backup:/home/garminbackup/data -it docker-garmin-backup
```

## Running the container on AWS (incomplete)
### Creating an Amazon Elastic Container Registry (ECR)
- Log on to your AWS account and head over to the Elastic Container Service
- Create a new repository (ECR)
- Configure aws-cli access if you have not done this before -> 'aws configure', create your Access Keys in AWS/IAM
- Follow the instructions (View Push Commands) as provided by AWS/ECR to push from your build server to ECR
### Running the Container in Amazon Elastic Container Service (ECS) or AWS Fargate (ToDo)
- To store the data in a persistant way you'll need to leverage EFS or work with Elastic Volumes.

## Running the container on Synology (ToDo)

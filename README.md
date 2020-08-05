# CuteLab DDSP Hub

Dockerfile for pushing DDSP training jobs up to [**Google AI Platform**](https://console.cloud.google.com/ai-platform/dashboard). The days of collabing and burning your local GPU are over! 🍺

## Installing and Training [CuteLab] 💅

First make sure you're set up with CuteLab's GCP account, as well as the GCP command line tools and local authentication. Make sure everything is up to date by running...

```
gcloud components update
```
Then log onto CuteLab's Google Cloud account, go to the storage section, and go to the _transference-dump_ gs bucket. Upload training data in the form of .wav files to the _audio-files_ folder.

Next, create a unique job name for your training job. Google Cloud best practices say that you should use the current date/time so that the name is always unique 

```
export JOB_NAME=cutelab_ddsp_job_$(date +%Y%m%d_%H%M%S
```

Finally, push the job to the cloud with the latest docker container from the container registry

```
gcloud ai-platform jobs submit training $JOB_NAME \                          
--scale-tier BASIC_GPU \
--region us-central1 \
--master-image-uri gcr.io/sinthomatic-music/cutelab-ddsp:latest
```

## Installing and Training [Individual] 🍮

[TODO]

## Editing the Dockerfile 🐋

If you want to edit and push a new dockerfile, you can do that with...

```
docker build -f dockerfile -t gcr.io/cutelab-ddsp-hub/cutelab-ddsp:latest ./
docker push gcr.io/cutelab-ddsp-hub/cutelab-ddsp:latest
```

## Training on DDSP Forks 🍴

If you want to train DDSP using an experimental model, such as a fork of the repo... 

[TODO]
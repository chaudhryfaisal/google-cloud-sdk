FROM google/cloud-sdk:alpine

RUN time gcloud --quiet components install app-engine-go
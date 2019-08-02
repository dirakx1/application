# Proposed Solution 

## Proposed arcuitecture

## Terraform 

IAC solution for timeoff, basically it (documented on devops/terraform:

* Creates a GCP proyect.
* Creates GKE clusters
* Creates all needed initial gcloud interacions


## CI/CD
* Travis, when change 


````
git clone https://github.com/dirakx1/application 
cd application
npm install 
npm test

if test are ok :
docker run -d -p 3000:3000 --name alpine_timeoff timeoff
docker exec -ti --user root alpine_timeoff /bin/sh && npm start 

````


## Considerations

* We will use GKE, Gcloud and GCR (google cloud registry, but other cloud providers could be use the same 
referenced solution. 




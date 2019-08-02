# Proposed Solution 

## Proposed arcuitecture
![](app.jpeg)
## Terraform 

IAC solution for timeoff, basically it (documented on devops/terraform):

* Creates a GCP proyect.
* Creates GKE clusters
* Creates all needed initial gcloud interacions

We could use here other kind of clouds like aws, taking the advantage of terraform being multicloud.  

## CI/CD
* We are going to use circleCI for making CI/CD pipelines. (documented on devops/circleci)
but we could also use other tools for this purpose, like Gitlab pipelines or Jenkins pipelines 

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

* We will use GKE, Gcloud sdk and GCR (google cloud registry, but other cloud providers could be use the same 
referenced solution. 
* We are not giving much tought on security or IAC tests 




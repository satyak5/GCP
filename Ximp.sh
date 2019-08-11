#!/bin/bash
for PROJECT in $(gcloud projects list --format="value(projectId)")
    do
        echo "Project: ${PROJECT}"
        echo $(gcloud projects get-iam-policy ${PROJECT} --format="json" > ${PROJECT}.json.orig)
        cat ${PROJECT}.json.orig |  sed -i 's/gmail.com/gmail.com/g' ${PROJECT}.json.orig > ${PROJECT}.json.new
        gcloud projects set-iam-policy $PROJECT ${PROJECT}.json.new
        rm -f ${PROJECT}.json.*
    done
done

for ORG in $(gcloud organizations list --format="value(projectId)")
    do
        echo "Organisation: ${ORG}"
        echo $(gcloud organizations get-iam-policy ${ORG} --format="json" > ${ORG}.json.orig)
        cat ${ORG}.json.orig |  sed -i 's/gmail.com/gmail.com/g' ${ORG}.json.orig > ${ORG}.json.new
        gcloud organizations set-iam-policy $PROJECT ${ORG}.json.new
        rm -f ${ORG}.json.*
    done
done
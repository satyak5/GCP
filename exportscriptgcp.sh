#!/bin/bash
mkdir Exporttocsv
cd Exporttocsv
mkdir Projects
cd Projects
for PROJECT in $(gcloud projects list --format="value(projectId)")
    do
        echo "Project: ${PROJECT}"
        echo $(gcloud projects get-iam-policy ${PROJECT} --flatten="bindings[].members" --format="csv(bindings.members,bindings.role)" > ${PROJECT}.csv)
    done
cd ..
mkdir Organisation
cd Organisation
for ORG in $(gcloud organizations list --format="value(ID)")
    do
        echo "Organisation: ${ORG}"
        echo $(gcloud organizations get-iam-policy ${ORG} --flatten="bindings[].members" --format="csv(bindings.members,bindings.role)" > ${ORG}.csv)
    done

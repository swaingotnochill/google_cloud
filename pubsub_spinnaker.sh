gcloud pubsub topics create projects/$PROJECT/topics/gcr

gcloud pubsub subscriptions create gcr-triggers \
    --topic projects/${PROJECT}/topics/gcr
    
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
    
gcloud beta pubsub subscriptions add-iam-policy-binding gcr-triggers \
    --role roles/pubsub.subscriber --member serviceAccount:$SA_EMAIL    

IMAGE_REPOSITORY="northamerica-northeast1-docker.pkg.dev/bold-landing-367418/niks-tracking-website"
IMAGE_NAME="app"

docker build . -q -t $IMAGE_REPOSITORY/$IMAGE_NAME
docker push $IMAGE_REPOSITORY/$IMAGE_NAME

gcloud run deploy app \
        --image=$IMAGE_REPOSITORY/$IMAGE_NAME \
        --platform managed \
        --allow-unauthenticated \
        --port=5000 \
        --min-instances=1 \
        --max-instances=3 \
        --region=us-central1

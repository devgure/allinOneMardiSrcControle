#!/usr/bin/env bash
# scaffold-sparkly.sh – recreate the *exact* folder & file structure for sparkly
set -euo pipefail

###############################################################################
# helper: create empty file (and all parent dirs)
###############################################################################
touch_file() {
  mkdir -p "$(dirname "$1")"
  touch "$1"
}

###############################################################################
# Complete list of files (files only – directories are implied)
###############################################################################
files=(
  client/mobile/src/auth/.gitkeep
  client/mobile/src/profile/.gitkeep
  client/mobile/src/discovery/.gitkeep
  client/mobile/src/chat/.gitkeep
  client/mobile/src/components/.gitkeep
  client/mobile/src/hooks/.gitkeep
  client/mobile/src/navigation/.gitkeep
  client/mobile/src/services/.gitkeep
  client/mobile/src/i18n/.gitkeep
  client/mobile/src/utils/.gitkeep
  client/mobile/App.tsx
  client/mobile/index.js

  client/web-mobile/public/.gitkeep
  client/web-mobile/src/pages/.gitkeep
  client/web-mobile/src/components/.gitkeep
  client/web-mobile/src/services/.gitkeep
  client/web-mobile/src/i18n/.gitkeep
  client/web-mobile/src/App.tsx
  client/web-mobile/index.html

  client/web-desktop/public/.gitkeep
  client/web-desktop/src/layouts/.gitkeep
  client/web-desktop/src/pages/.gitkeep
  client/web-desktop/src/components/.gitkeep
  client/web-desktop/src/App.tsx
  client/web-desktop/index.html

  gateway/src/routes/auth.route.ts
  gateway/src/routes/user.route.ts
  gateway/src/routes/match.route.ts
  gateway/src/routes/chat.route.ts
  gateway/src/middleware/auth.middleware.ts
  gateway/src/middleware/rate-limit.ts
  gateway/src/middleware/cors.ts
  gateway/src/services/authService.ts
  gateway/src/services/matchService.ts
  gateway/src/app.ts
  gateway/src/kong-config.yaml
  gateway/docker-compose.yml

  services/auth-service/src/auth/.gitkeep
  services/auth-service/src/user/.gitkeep
  services/auth-service/src/main.ts
  services/auth-service/Dockerfile

  services/profile-service/src/profile/.gitkeep
  services/profile-service/src/media/.gitkeep
  services/profile-service/src/facial-recognition/.gitkeep
  services/profile-service/Dockerfile

  services/discovery-service/src/location/.gitkeep
  services/discovery-service/src/search/.gitkeep
  services/discovery-service/src/redis-cache/.gitkeep
  services/discovery-service/Dockerfile

  services/match-service/src/swipe/.gitkeep
  services/match-service/src/match/.gitkeep
  services/match-service/src/queue/.gitkeep
  services/match-service/Dockerfile

  services/chat-service/src/chat/.gitkeep
  services/chat-service/src/websocket/.gitkeep
  services/chat-service/src/notifications/.gitkeep
  services/chat-service/Dockerfile

  services/notification-service/src/fcm/.gitkeep
  services/notification-service/src/email/.gitkeep
  services/notification-service/src/templates/.gitkeep
  services/notification-service/Dockerfile

  services/analytics-service/src/events/.gitkeep
  services/analytics-service/src/reporting/.gitkeep
  services/analytics-service/Dockerfile

  services/admin-service/src/admin/users/.gitkeep
  services/admin-service/src/admin/reports/.gitkeep
  services/admin-service/src/admin/revenue/.gitkeep
  services/admin-service/src/main.ts
  services/admin-service/Dockerfile

  services/media-service/src/controllers/media.js
  services/media-service/src/utils/s3Uploader.js
  services/media-service/src/workers/moderationWorker.js
  services/media-service/Dockerfile

  services/billing-service/src/controllers/checkout.js
  services/billing-service/src/utils/stripeWebhook.js
  services/billing-service/src/models/Subscription.js
  services/billing-service/Dockerfile

  ai-engine/recommendation-engine/models/collaborative_filtering.py
  ai-engine/recommendation-engine/models/content_based.py
  ai-engine/recommendation-engine/api/server.py
  ai-engine/recommendation-engine/requirements.txt

  ai-engine/nlp-analyzer/nlp/sentiment.py
  ai-engine/nlp-analyzer/nlp/icebreaker.py
  ai-engine/nlp-analyzer/nlp/moderation.py
  ai-engine/nlp-analyzer/app.py

  ai-engine/image-moderation/detector/nsfw.py
  ai-engine/image-moderation/detector/face_validator.py
  ai-engine/image-moderation/api.py

  ai-engine/behavioral-predictor/churn_model.py
  ai-engine/behavioral-predictor/swipe_predictor.py

  data/docker/mongodb/.gitkeep
  data/docker/redis/.gitkeep
  data/docker/elasticsearch/.gitkeep
  data/docker/minio/.gitkeep

  data/kubernetes/deployments/auth-deployment.yaml
  data/kubernetes/deployments/chat-deployment.yaml
  data/kubernetes/services/.gitkeep
  data/kubernetes/ingress/.gitkeep
  data/kubernetes/helm-charts/.gitkeep

  data/terraform/aws/vpc.tf
  data/terraform/aws/eks.tf
  data/terraform/aws/rds.tf
  data/terraform/aws/s3.tf
  data/terraform/variables.tf

  monitoring/prometheus/prometheus.yml
  monitoring/grafana/dashboards/.gitkeep
  monitoring/logging/fluentd/.gitkeep
  monitoring/logging/elasticsearch-kibana/.gitkeep
  monitoring/sentry.config.js

  scripts/deploy.sh
  scripts/migrate-db.sh
  scripts/seed-data.js

  docs/API.md
  docs/ARCHITECTURE.md
  docs/i18n-guidelines.md

  docker-compose.yml
  Makefile
  .env.example
  README.md
)

###############################################################################
# Create everything
###############################################################################
for f in "${files[@]}"; do
  touch_file "$f"
done

echo "✅ Sparkly project scaffold created successfully."
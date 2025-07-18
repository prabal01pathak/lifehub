#!/bin/bash

echo "🔍 Platform Independence Check for LifeHub Project"
echo "--------------------------------------------------"

failures=0

check() {
  local desc="$1"
  local cmd="$2"
  echo -n "🔸 $desc... "
  if eval "$cmd" &>/dev/null; then
    echo "✅"
  else
    echo "❌"
    failures=$((failures+1))
  fi
}

check "Dockerfile exists for services" "test -f ../../api-java/auth-service/Dockerfile || test -f ../../api-python/fastapi-service/Dockerfile"
check "Helm charts exist" "test -d apps/infrastructure/kubernetes/helm"
check "ArgoCD application manifests exist" "test -d apps/infrastructure/kubernetes/argocd"
check "No Azure CLI usage in scripts" "! grep -r 'az ' apps/ scripts/ 2>/dev/null"
check "No AWS CLI usage in scripts" "! grep -r 'aws ' apps/ scripts/ 2>/dev/null"
check "No GCP CLI usage in scripts" "! grep -r 'gcloud ' apps/ scripts/ 2>/dev/null"
check "No Azure SDK imports in Java or Python" "! grep -r 'com.azure' ../../api-java && ! grep -r 'azure' ../../api-python"
check "No AWS SDK imports in Java or Python" "! grep -r 'com.amazonaws' ../../api-java && ! grep -r 'boto3' ../../api-python"
check ".env or Kubernetes Secrets used for config" "grep -rE '(env|KUBERNETES_SECRET|dotenv)' apps/ infrastructure/ || test -f .env"
check "Terraform/Pulumi uses variables for resource names" "grep -q 'variable ' apps/infrastructure/terraform/variables.tf"
echo "--------------------------------------------------"

if [ "$failures" -eq 0 ]; then
  echo "✅ All checks passed. Your app is platform independent!"
else
  echo "❌ $failures issues found. Review and fix them to ensure full portability."
  exit 1
fi

#!/bin/bash

echo " -- Remove ArgoCD --"
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete namespace argocd
echo ""
echo " -- Remove Argo Events --"
kubectl delete -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install.yaml
kubectl delete -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install-validating-webhook.yaml
kubectl delete -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/examples/eventbus/native.yaml
kubectl delete -f argo-events/deployment/project.yaml -n argocd
kubectl delete -f argo-events/deployment/application.yaml -n argocd
kubectl delete namespace argo-events
echo ""
echo "-- Remove Argo Worklows --"
kubectl delete -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/stable/manifests/install.yaml
kubectl delete -f argo-workflow/deployment/project.yaml -n argocd
kubectl delete -f argo-workflow/deployment/application.yaml -n argocd
kubectl delete namespace argo
echo ""
echo "-- Remove Falco --"
kubectl delete -f falco/deployment/project.yaml -n argocd
kubectl delete -f falco/deployment/application.yaml -n argocd
kubectl delete namespace falco
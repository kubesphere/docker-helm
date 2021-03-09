FROM alpine:3.11

ARG TARGETARCH
ARG HELM_VERSION=v3.5.2
ARG KUSTOMIZE_VERSION=v4.0.5

RUN apk add --no-cache ca-certificates
RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz && \
    tar xvf helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz && \
    rm helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz && \
    mv linux-${TARGETARCH}/helm /usr/local/bin/ && \
    rm -rf linux-${TARGETARCH}
RUN wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz && \
    tar xvf kustomize_${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz && \
    rm kustomize_${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz && \
    mv kustomize /usr/local/bin/

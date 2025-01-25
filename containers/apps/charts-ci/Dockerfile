# Define Chart Releaser
# hadolint ignore=DL3007
FROM ghcr.io/actions/actions-runner:2.322.0@sha256:c02e8e1b479ea39b196c3bb0a40a66a191302654a6ef5c042eafe11c13323137

SHELL ["/bin/bash", "-c"]

# Environment variables for the versions of the tools
ENV kubectlVersion=1.21.0
ENV kustomizeVersion=4.4.1
ENV helmVersion=3.14.4
ENV oldhelmVersion=3.12.1
ENV kubevalVersion=0.15.0
ENV kubeconformVersion=0.4.12
ENV conftestVersion=0.25.0
ENV goyqVersion=4.44.1
ENV rancherVersion=2.8.4
ENV tiltVersion=0.33.14
ENV skaffoldVersion=1.28.0
ENV kubeScoreVersion=1.18.0
ENV chartReleaserVersion=1.6.1
ENV chartTestingVersion=3.11.0

# Default architecture
ENV arch=amd64

ENV HOMEBREW_NO_ANALYTICS=1 \
    HOMEBREW_NO_ENV_HINTS=1 \
    HOMEBREW_NO_INSTALL_CLEANUP=1 \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

# Install base packages
# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        apt-transport-https \
        ca-certificates \
        curl \
        gcc \
        git \
    gnupg \
        gzip \
        jo \
        jq \
        moreutils \
        tar \
        unrar \
        unzip \
        wget \
        zip \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the tools
RUN mkdir -p /tools/bin

# Set the PATH
ENV PATH="/tools/bin:${PATH}"

# Install python packages
# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    python3 \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install cwebp for website repo
# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    webp \
    && rm -rf /var/lib/apt/lists/*

### Kubernetes-Tools Installer

# Define download and extraction commands
RUN set -eux; \
    download_and_extract() { \
        url=$1; \
        dest_dir=$2; \
        command_path=$3; \
        curl -L "$url" -o temp_archive; \
        if [[ "$url" == *.tar.gz || "$url" == *.tgz ]]; then \
            tar -xzf temp_archive -C "$dest_dir" --strip-components=$(dirname "$command_path" | grep -o "/" | wc -l) || tar -xvpf temp_archive -C "$dest_dir" --strip-components=$(dirname "$command_path" | grep -o "/" | wc -l); \
        elif [[ "$url" == *.zip ]]; then \
            unzip temp_archive -d "$dest_dir"; \
        else \
            cp temp_archive "$dest_dir/$(basename "$command_path")"; \
        fi; \
        rm temp_archive; \
    }; \
    download_and_copy() { \
        tool=$1; \
        version=$2; \
        rename="${3:-$tool}"; \
        url=""; \
        command_path_in_package="$(basename $tool)"; \
        if [ "$arch" = "amd64" ]; then arch_path="amd64"; elif [ "$arch" = "arm64" ]; then arch_path="arm64"; else arch_path="arm"; fi; \
    if [ "$arch" = "amd64" ]; then xarch="x86_64"; elif [ "$arch" = "arm64" ]; then xarch="arm64"; else xarch="arm"; fi; \
        case "$tool" in \
            kubectl) \
                url="https://dl.k8s.io/release/v${version}/bin/linux/${arch}/kubectl"; \
                ;; \
            kustomize) \
                url="https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${version}/kustomize_v${version}_linux_${arch}.tar.gz"; \
                ;; \
            helm) \
                url="https://get.helm.sh/helm-v${version}-linux-${arch}.tar.gz"; \
                command_path_in_package="linux-${arch_path}/helm"; \
                ;; \
            kubeval) \
                url="https://github.com/instrumenta/kubeval/releases/download/${version}/kubeval-linux-${arch}.tar.gz"; \
                ;; \
            kubeconform) \
                url="https://github.com/yannh/kubeconform/releases/download/v${version}/kubeconform-linux-${arch}.tar.gz"; \
                ;; \
            conftest) \
                url="https://github.com/open-policy-agent/conftest/releases/download/v${version}/conftest_${version}_Linux_${xarch}.tar.gz"; \
                ;; \
            go-yq) \
                url="https://github.com/mikefarah/yq/releases/download/v${version}/yq_linux_${arch}"; \
                command_path_in_package="yq_linux_${arch}"; \
                ;; \
            rancher) \
                url="https://github.com/rancher/cli/releases/download/v${version}/rancher-linux-${arch}-v${version}.tar.gz"; \
                command_path_in_package="rancher-v${version}/rancher"; \
                ;; \
            tilt) \
                url="https://github.com/tilt-dev/tilt/releases/download/v${version}/tilt.${version}.linux.${xarch}.tar.gz"; \
                ;; \
            skaffold) \
                url="https://storage.googleapis.com/skaffold/releases/v${version}/skaffold-linux-${arch}"; \
                command_path_in_package="skaffold-linux-${arch}"; \
                ;; \
            kube-score) \
                url="https://github.com/zegl/kube-score/releases/download/v${version}/kube-score_${version}_linux_${arch}.tar.gz"; \
                ;; \
            chart-releaser) \
                url="https://github.com/helm/chart-releaser/releases/download/v${version}/chart-releaser_${version}_linux_${arch}.tar.gz"; \
        command_path_in_package="cr"; \
                rename="cr"; \
                ;; \
            chart-testing) \
                url="https://github.com/helm/chart-testing/releases/download/v${version}/chart-testing_${version}_linux_${arch}.tar.gz"; \
        command_path_in_package="ct"; \
                rename="ct"; \
                ;; \
            *) echo "Unknown tool: $tool"; exit 1 ;; \
        esac; \
        mkdir -p /tools/${tool}; \
        download_and_extract "$url" "/tools/${tool}" "$command_path_in_package"; \
        cp "/tools/${tool}/$command_path_in_package" "/tools/bin/$rename"; \
    rm -rf "/tools/${tool}"; \
    chmod 666 "/tools/bin/$rename"; \
    chmod +x "/tools/bin/$rename"; \
    }; \
    # Download and copy each tool
    download_and_copy "kubectl" "$kubectlVersion"; \
    download_and_copy "kustomize" "$kustomizeVersion"; \
    download_and_copy "helm" "$helmVersion"; \
    download_and_copy "helm" "$oldhelmVersion" "oldhelm"; \
    download_and_copy "kubeval" "$kubevalVersion"; \
    download_and_copy "kubeconform" "$kubeconformVersion"; \
    download_and_copy "conftest" "$conftestVersion"; \
    download_and_copy "go-yq" "$goyqVersion"; \
    download_and_copy "rancher" "$rancherVersion"; \
    download_and_copy "tilt" "$tiltVersion"; \
    download_and_copy "skaffold" "$skaffoldVersion"; \
    download_and_copy "kube-score" "$kubeScoreVersion"; \
    download_and_copy "chart-releaser" "$chartReleaserVersion"; \
    download_and_copy "chart-testing" "$chartTestingVersion";

# Install Pre-Commit
# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    pre-commit \
    && rm -rf /var/lib/apt/lists/*

# Install golang

COPY --from=golang:1.23.5@sha256:8c10f21bec412f08f73aa7b97ca5ac5f28a39d8a88030ad8a339fd0a781d72b4 /usr/local/go/ /usr/local/go/

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# don't auto-upgrade the gotoolchain
# https://github.com/docker-library/golang/issues/472
ENV GOTOOLCHAIN=local

USER runner

# Install homebrew
# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="All-Rights-Reserved"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"

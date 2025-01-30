module github.com/truecharts/public/clustertool

go 1.23.4

require (
    filippo.io/age v1.2.1
    github.com/Masterminds/semver/v3 v3.3.1
    github.com/beevik/ntp v1.4.3
    github.com/budimanjojo/talhelper/v3 v3.0.16
    github.com/getsops/sops/v3 v3.9.4
    github.com/go-git/go-git/v5 v5.13.2
    github.com/go-logr/zerologr v1.2.3
    github.com/go-playground/validator/v10 v10.24.0
    github.com/invopop/jsonschema v0.13.0
    github.com/joho/godotenv v1.5.1
    github.com/knadh/koanf/parsers/yaml v0.1.0
    github.com/knadh/koanf/providers/file v1.1.2
    github.com/knadh/koanf/v2 v2.1.2
    github.com/leaanthony/debme v1.2.1
    github.com/rs/zerolog v1.33.0
    github.com/siderolabs/talos/pkg/machinery v1.10.0-alpha.0.0.20241227120520-01bf8449b917
    github.com/spf13/cobra v1.8.1
    golang.org/x/crypto v0.32.0
    gopkg.in/yaml.v3 v3.0.1
    helm.sh/helm/v3 v3.17.0
    k8s.io/api v0.32.1
    k8s.io/apimachinery v0.32.1
    k8s.io/client-go v0.32.1
    sigs.k8s.io/controller-runtime v0.20.1
    sigs.k8s.io/kustomize/api v0.19.0
    sigs.k8s.io/kustomize/kyaml v0.19.0
    sigs.k8s.io/yaml v1.4.0
)

require (
    cel.dev/expr v0.19.1 // indirect
    cloud.google.com/go v0.117.0 // indirect
    cloud.google.com/go/auth v0.14.0 // indirect
    cloud.google.com/go/auth/oauth2adapt v0.2.7 // indirect
    cloud.google.com/go/compute/metadata v0.6.0 // indirect
    cloud.google.com/go/iam v1.3.0 // indirect
    cloud.google.com/go/kms v1.20.5 // indirect
    cloud.google.com/go/longrunning v0.6.3 // indirect
    cloud.google.com/go/monitoring v1.22.0 // indirect
    cloud.google.com/go/storage v1.50.0 // indirect
    dario.cat/mergo v1.0.1 // indirect
    github.com/AdaLogics/go-fuzz-headers v0.0.0-20240806141605-e8a1dd7889d6 // indirect
    github.com/Azure/azure-sdk-for-go/sdk/azcore v1.17.0 // indirect
    github.com/Azure/azure-sdk-for-go/sdk/azidentity v1.8.1 // indirect
    github.com/Azure/azure-sdk-for-go/sdk/internal v1.10.0 // indirect
    github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys v1.3.0 // indirect
    github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal v1.1.0 // indirect
    github.com/Azure/go-ansiterm v0.0.0-20230124172434-306776ec8161 // indirect
    github.com/AzureAD/microsoft-authentication-library-for-go v1.3.2 // indirect
    github.com/BurntSushi/toml v1.4.0 // indirect
    github.com/GoogleCloudPlatform/opentelemetry-operations-go/detectors/gcp v1.25.0 // indirect
    github.com/GoogleCloudPlatform/opentelemetry-operations-go/exporter/metric v0.49.0 // indirect
    github.com/GoogleCloudPlatform/opentelemetry-operations-go/internal/resourcemapping v0.49.0 // indirect
    github.com/MakeNowJust/heredoc v1.0.0 // indirect
    github.com/Masterminds/goutils v1.1.1 // indirect
    github.com/Masterminds/sprig/v3 v3.3.0 // indirect
    github.com/Masterminds/squirrel v1.5.4 // indirect
    github.com/Microsoft/go-winio v0.6.2 // indirect
    github.com/ProtonMail/go-crypto v1.1.5 // indirect
    github.com/a8m/envsubst v1.4.2 // indirect
    github.com/antlr4-go/antlr/v4 v4.13.1 // indirect
    github.com/asaskevich/govalidator v0.0.0-20230301143203-a9d515a09cc2 // indirect
    github.com/aws/aws-sdk-go-v2 v1.33.0 // indirect
    github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream v1.6.7 // indirect
    github.com/aws/aws-sdk-go-v2/config v1.29.1 // indirect
    github.com/aws/aws-sdk-go-v2/credentials v1.17.54 // indirect
    github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.24 // indirect
    github.com/aws/aws-sdk-go-v2/feature/s3/manager v1.17.53 // indirect
    github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.28 // indirect
    github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.28 // indirect
    github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
    github.com/aws/aws-sdk-go-v2/internal/v4a v1.3.28 // indirect
    github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.12.1 // indirect
    github.com/aws/aws-sdk-go-v2/service/internal/checksum v1.5.2 // indirect
    github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.12.9 // indirect
    github.com/aws/aws-sdk-go-v2/service/internal/s3shared v1.18.9 // indirect
    github.com/aws/aws-sdk-go-v2/service/kms v1.37.13 // indirect
    github.com/aws/aws-sdk-go-v2/service/s3 v1.74.0 // indirect
    github.com/aws/aws-sdk-go-v2/service/sso v1.24.11 // indirect
    github.com/aws/aws-sdk-go-v2/service/ssooidc v1.28.10 // indirect
    github.com/aws/aws-sdk-go-v2/service/sts v1.33.9 // indirect
    github.com/aws/smithy-go v1.22.1 // indirect
    github.com/bahlo/generic-list-go v0.2.0 // indirect
    github.com/beorn7/perks v1.0.1 // indirect
    github.com/blang/semver v3.5.1+incompatible // indirect
    github.com/blang/semver/v4 v4.0.0 // indirect
    github.com/buger/jsonparser v1.1.1 // indirect
    github.com/cenkalti/backoff/v4 v4.3.0 // indirect
    github.com/census-instrumentation/opencensus-proto v0.4.1 // indirect
    github.com/cespare/xxhash/v2 v2.3.0 // indirect
    github.com/chai2010/gettext-go v1.0.2 // indirect
    github.com/cloudflare/circl v1.5.0 // indirect
    github.com/cncf/xds/go v0.0.0-20241223141626-cff3c89139a3 // indirect
    github.com/containerd/containerd v1.7.24 // indirect
    github.com/containerd/errdefs v1.0.0 // indirect
    github.com/containerd/go-cni v1.1.11 // indirect
    github.com/containerd/log v0.1.0 // indirect
    github.com/containerd/platforms v1.0.0-rc.0 // indirect
    github.com/containernetworking/cni v1.2.3 // indirect
    github.com/cosi-project/runtime v0.8.1 // indirect
    github.com/cpuguy83/go-md2man/v2 v2.0.6 // indirect
    github.com/cyphar/filepath-securejoin v0.3.6 // indirect
    github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
    github.com/distribution/reference v0.6.0 // indirect
    github.com/docker/cli v27.4.1+incompatible // indirect
    github.com/docker/distribution v2.8.3+incompatible // indirect
    github.com/docker/docker v27.4.1+incompatible // indirect
    github.com/docker/docker-credential-helpers v0.8.0 // indirect
    github.com/docker/go-connections v0.5.0 // indirect
    github.com/docker/go-metrics v0.0.1 // indirect
    github.com/dustin/go-humanize v1.0.1 // indirect
    github.com/emicklei/go-restful/v3 v3.12.1 // indirect
    github.com/emirpasic/gods v1.18.1 // indirect
    github.com/envoyproxy/go-control-plane v0.13.1 // indirect
    github.com/envoyproxy/protoc-gen-validate v1.1.0 // indirect
    github.com/evanphx/json-patch v5.9.0+incompatible // indirect
    github.com/evanphx/json-patch/v5 v5.9.0 // indirect
    github.com/exponent-io/jsonpath v0.0.0-20210407135951-1de76d718b3f // indirect
    github.com/fatih/color v1.18.0 // indirect
    github.com/felixge/httpsnoop v1.0.4 // indirect
    github.com/fsnotify/fsnotify v1.8.0 // indirect
    github.com/fxamacker/cbor/v2 v2.7.0 // indirect
    github.com/gabriel-vasile/mimetype v1.4.8 // indirect
    github.com/gertd/go-pluralize v0.2.1 // indirect
    github.com/getsops/gopgagent v0.0.0-20241224165529-7044f28e491e // indirect
    github.com/ghodss/yaml v1.0.0 // indirect
    github.com/go-errors/errors v1.4.2 // indirect
    github.com/go-git/gcfg v1.5.1-0.20230307220236-3a3c6141e376 // indirect
    github.com/go-git/go-billy/v5 v5.6.2 // indirect
    github.com/go-gorp/gorp/v3 v3.1.0 // indirect
    github.com/go-jose/go-jose/v4 v4.0.4 // indirect
    github.com/go-logr/logr v1.4.2 // indirect
    github.com/go-logr/stdr v1.2.2 // indirect
    github.com/go-openapi/jsonpointer v0.21.0 // indirect
    github.com/go-openapi/jsonreference v0.21.0 // indirect
    github.com/go-openapi/swag v0.23.0 // indirect
    github.com/go-playground/locales v0.14.1 // indirect
    github.com/go-playground/universal-translator v0.18.1 // indirect
    github.com/go-viper/mapstructure/v2 v2.2.1 // indirect
    github.com/gobwas/glob v0.2.3 // indirect
    github.com/gogo/protobuf v1.3.2 // indirect
    github.com/golang-jwt/jwt/v5 v5.2.1 // indirect
    github.com/golang/groupcache v0.0.0-20241129210726-2c02b8208cf8 // indirect
    github.com/golang/protobuf v1.5.4 // indirect
    github.com/google/btree v1.1.3 // indirect
    github.com/google/cel-go v0.22.1 // indirect
    github.com/google/gnostic-models v0.6.9 // indirect
    github.com/google/go-cmp v0.6.0 // indirect
    github.com/google/gofuzz v1.2.0 // indirect
    github.com/google/s2a-go v0.1.9 // indirect
    github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect
    github.com/google/uuid v1.6.0 // indirect
    github.com/googleapis/enterprise-certificate-proxy v0.3.4 // indirect
    github.com/googleapis/gax-go/v2 v2.14.1 // indirect
    github.com/gookit/filter v1.2.2 // indirect
    github.com/gookit/goutil v0.6.18 // indirect
    github.com/gookit/validate v1.5.4 // indirect
    github.com/gorilla/mux v1.8.0 // indirect
    github.com/gorilla/websocket v1.5.0 // indirect
    github.com/gosuri/uitable v0.0.4 // indirect
    github.com/goware/prefixer v0.0.0-20160118172347-395022866408 // indirect
    github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
    github.com/grpc-ecosystem/grpc-gateway/v2 v2.24.0 // indirect
    github.com/hashicorp/errwrap v1.1.0 // indirect
    github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
    github.com/hashicorp/go-multierror v1.1.1 // indirect
    github.com/hashicorp/go-retryablehttp v0.7.7 // indirect
    github.com/hashicorp/go-rootcerts v1.0.2 // indirect
    github.com/hashicorp/go-secure-stdlib/parseutil v0.1.8 // indirect
    github.com/hashicorp/go-secure-stdlib/strutil v0.1.2 // indirect
    github.com/hashicorp/go-sockaddr v1.0.7 // indirect
    github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
    github.com/hashicorp/vault/api v1.15.0 // indirect
    github.com/hexops/gotextdiff v1.0.3 // indirect
    github.com/huandu/xstrings v1.5.0 // indirect
    github.com/inconshreveable/mousetrap v1.1.0 // indirect
    github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
    github.com/jmoiron/sqlx v1.4.0 // indirect
    github.com/josharian/intern v1.0.0 // indirect
    github.com/josharian/native v1.1.0 // indirect
    github.com/jsimonetti/rtnetlink/v2 v2.0.3-0.20241216183107-2d6e9f8ad3f2 // indirect
    github.com/json-iterator/go v1.1.12 // indirect
    github.com/kevinburke/ssh_config v1.2.0 // indirect
    github.com/klauspost/compress v1.17.11 // indirect
    github.com/knadh/koanf/maps v0.1.1 // indirect
    github.com/kylelemons/godebug v1.1.0 // indirect
    github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 // indirect
    github.com/lann/ps v0.0.0-20150810152359-62de8c46ede0 // indirect
    github.com/leodido/go-urn v1.4.0 // indirect
    github.com/lib/pq v1.10.9 // indirect
    github.com/liggitt/tabwriter v0.0.0-20181228230101-89fcab3d43de // indirect
    github.com/mailru/easyjson v0.7.7 // indirect
    github.com/mattn/go-colorable v0.1.13 // indirect
    github.com/mattn/go-isatty v0.0.20 // indirect
    github.com/mattn/go-runewidth v0.0.9 // indirect
    github.com/mdlayher/ethtool v0.2.0 // indirect
    github.com/mdlayher/genetlink v1.3.2 // indirect
    github.com/mdlayher/netlink v1.7.2 // indirect
    github.com/mdlayher/socket v0.5.1 // indirect
    github.com/mitchellh/copystructure v1.2.0 // indirect
    github.com/mitchellh/go-homedir v1.1.0 // indirect
    github.com/mitchellh/go-wordwrap v1.0.1 // indirect
    github.com/mitchellh/mapstructure v1.5.0 // indirect
    github.com/mitchellh/reflectwalk v1.0.2 // indirect
    github.com/moby/locker v1.0.1 // indirect
    github.com/moby/spdystream v0.5.0 // indirect
    github.com/moby/term v0.5.0 // indirect
    github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
    github.com/modern-go/reflect2 v1.0.2 // indirect
    github.com/monochromegane/go-gitignore v0.0.0-20200626010858-205db1a8cc00 // indirect
    github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
    github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f // indirect
    github.com/opencontainers/go-digest v1.0.0 // indirect
    github.com/opencontainers/image-spec v1.1.0 // indirect
    github.com/opencontainers/runtime-spec v1.2.0 // indirect
    github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
    github.com/pjbgf/sha1cd v0.3.2 // indirect
    github.com/pkg/browser v0.0.0-20240102092130-5ac0b6a4141c // indirect
    github.com/pkg/errors v0.9.1 // indirect
    github.com/planetscale/vtprotobuf v0.6.1-0.20241121165744-79df5c4772f2 // indirect
    github.com/prometheus/client_golang v1.20.5 // indirect
    github.com/prometheus/client_model v0.6.1 // indirect
    github.com/prometheus/common v0.59.1 // indirect
    github.com/prometheus/procfs v0.15.1 // indirect
    github.com/rubenv/sql-migrate v1.7.1 // indirect
    github.com/russross/blackfriday/v2 v2.1.0 // indirect
    github.com/ryanuber/go-glob v1.0.0 // indirect
    github.com/sabhiram/go-gitignore v0.0.0-20210923224102-525f6e181f06 // indirect
    github.com/sergi/go-diff v1.3.2-0.20230802210424-5b0b94c5c0d3 // indirect
    github.com/shopspring/decimal v1.4.0 // indirect
    github.com/siderolabs/crypto v0.5.1 // indirect
    github.com/siderolabs/gen v0.8.0 // indirect
    github.com/siderolabs/go-blockdevice/v2 v2.0.9 // indirect
    github.com/siderolabs/go-pointer v1.0.0 // indirect
    github.com/siderolabs/image-factory v0.6.5 // indirect
    github.com/siderolabs/net v0.4.0 // indirect
    github.com/siderolabs/protoenc v0.2.1 // indirect
    github.com/sirupsen/logrus v1.9.3 // indirect
    github.com/skeema/knownhosts v1.3.0 // indirect
    github.com/spf13/cast v1.7.0 // indirect
    github.com/spf13/pflag v1.0.5 // indirect
    github.com/stoewer/go-strcase v1.3.0 // indirect
    github.com/urfave/cli v1.22.16 // indirect
    github.com/wk8/go-ordered-map/v2 v2.1.8 // indirect
    github.com/x448/float16 v0.8.4 // indirect
    github.com/xanzy/ssh-agent v0.3.3 // indirect
    github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb // indirect
    github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
    github.com/xeipuuv/gojsonschema v1.2.0 // indirect
    github.com/xlab/treeprint v1.2.0 // indirect
    go.opentelemetry.io/auto/sdk v1.1.0 // indirect
    go.opentelemetry.io/contrib/detectors/gcp v1.33.0 // indirect
    go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.58.0 // indirect
    go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.58.0 // indirect
    go.opentelemetry.io/otel v1.33.0 // indirect
    go.opentelemetry.io/otel/metric v1.33.0 // indirect
    go.opentelemetry.io/otel/sdk v1.33.0 // indirect
    go.opentelemetry.io/otel/sdk/metric v1.33.0 // indirect
    go.opentelemetry.io/otel/trace v1.33.0 // indirect
    go.uber.org/multierr v1.11.0 // indirect
    go.uber.org/zap v1.27.0 // indirect
    golang.org/x/exp v0.0.0-20241108190413-2d47ceb2692f // indirect
    golang.org/x/mod v0.22.0 // indirect
    golang.org/x/net v0.34.0 // indirect
    golang.org/x/oauth2 v0.25.0 // indirect
    golang.org/x/sync v0.10.0 // indirect
    golang.org/x/sys v0.29.0 // indirect
    golang.org/x/term v0.28.0 // indirect
    golang.org/x/text v0.21.0 // indirect
    golang.org/x/time v0.9.0 // indirect
    google.golang.org/api v0.218.0 // indirect
    google.golang.org/genproto v0.0.0-20241223144023-3abc09e42ca8 // indirect
    google.golang.org/genproto/googleapis/api v0.0.0-20241223144023-3abc09e42ca8 // indirect
    google.golang.org/genproto/googleapis/rpc v0.0.0-20250115164207-1a7da9e5054f // indirect
    google.golang.org/grpc v1.70.0 // indirect
    google.golang.org/protobuf v1.36.4 // indirect
    gopkg.in/evanphx/json-patch.v4 v4.12.0 // indirect
    gopkg.in/inf.v0 v0.9.1 // indirect
    gopkg.in/ini.v1 v1.67.0 // indirect
    gopkg.in/warnings.v0 v0.1.2 // indirect
    gopkg.in/yaml.v2 v2.4.0 // indirect
    k8s.io/apiextensions-apiserver v0.32.0 // indirect
    k8s.io/apiserver v0.32.0 // indirect
    k8s.io/cli-runtime v0.32.0 // indirect
    k8s.io/component-base v0.32.0 // indirect
    k8s.io/klog/v2 v2.130.1 // indirect
    k8s.io/kube-openapi v0.0.0-20241212222426-2c72e554b1e7 // indirect
    k8s.io/kubectl v0.32.0 // indirect
    k8s.io/utils v0.0.0-20241104100929-3ea5e8cea738 // indirect
    oras.land/oras-go v1.2.5 // indirect
    sigs.k8s.io/json v0.0.0-20241010143419-9aa6b5e7a4b3 // indirect
    sigs.k8s.io/structured-merge-diff/v4 v4.4.2 // indirect
)

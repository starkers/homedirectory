#!/usr/bin/env bash
set -ou pipefail

yell() { echo -e "\e[32m$fname: $*\e[0m" >&2; }
die()  { echo -e "\e[31m$*\e[0m"; exit 1; }
try()  { "$@" || die "cannot $*"; }


delete_if_exists(){
  if [ -f "$1" ]; then
    yell rm $1
    try rm -f "$1"
  fi
}



generic_binary(){
  local name="${1}"
  local ver="${2}"
  local url="${3}"
  local out_dir="${software}/${name}"
  local out_file="${name}-${ver}"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" "${url}" -c --show-progress
  try chmod +x "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${out_file}" "${name}"
  yell ${1} is installed and ready
}

##############################################
#: krew
install_krew(){
  name=krew
  ver="0.2.1"
  out_dir="${software}/${name}-v${ver}"
  out_file="${name}-${ver}.tgz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://storage.googleapis.com/krew/v${ver}/krew.tar.gz -c
  try wget -O krew.yaml https://storage.googleapis.com/krew/v${ver}/krew.yaml -c
  try tar xf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/krew-linux_amd64" "${name}"
  try krew install --manifest=${out_dir}/krew.yaml
  try kubectl plugin list
}

##############################################
#: drone
install_drone(){
  name=drone
  ver="${1:-1.2.0}"
  out_dir="${software}/${name}-v${ver}"
  out_file="${name}-${ver}.tgz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://github.com/drone/drone-cli/releases/download/v${ver}/drone_linux_amd64.tar.gz -c
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/drone" drone
}

# ##############################################
# #: hub
# install_hub(){
#   name=hub
#   ver="2.3.0-pre9"
#   out_dir="${software}/${name}-v${ver}"
#   out_file="${name}-${ver}.tgz"
#   try mkdir -p "${out_dir}"
#   try cd "${out_dir}"
#   try wget -O "${out_file}" https://github.com/github/hub/releases/download/v${ver}/hub-linux-amd64-${ver}.tgz -c
#   try tar xvf "${out_file}"
#   try mkdir -p "${software}/bin"
#   try cd "${software}/bin"
#   try ln -sf "${software}/hub-v${ver}/hub-linux-amd64-${ver}/bin/hub" "${name}"
# }

##############################################
#: jabba
install_jabba(){
  name=jabba
  ver="${1:-0.11.2}"
  url=https://github.com/shyiko/jabba/releases/download/${ver}/jabba-${ver}-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: terragrunt
install_terragrunt(){
  name=terragrunt
  ver="${1:-0.21.6}"
  url=https://github.com/gruntwork-io/terragrunt/releases/download/v${ver}/terragrunt_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: tanka
install_tanka(){
  name=tanka
  ver="${1:-0.8.0}"
  url=https://github.com/grafana/tanka/releases/download/v${ver}/tk-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: kompose
install_kompose(){
  name=kompose
  ver="${1:-1.18.0}"
  url=https://github.com/kubernetes/kompose/releases/download/v${ver}/kompose-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: kops
install_kops(){
  name=kops
  ver="${1:-1.12.3}"
  url=https://github.com/kubernetes/kops/releases/download/${ver}/kops-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

# ##############################################
# #: kind
# install_kind(){
#   name=kind
#   ver="${1:-0.5.1}"
#   url=https://github.com/kubernetes-sigs/kind/releases/download/v${ver}/kind-linux-amd64
#   generic_binary "${name}" "${ver}" "${url}"
# }

##############################################
#: kustomize
install_kustomize(){
  name=kustomize
  ver="${1:-3.1.0}"
  url=https://github.com/kubernetes-sigs/kustomize/releases/download/v${ver}/kustomize_${ver}_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: helmfile
install_helmfile(){
  name=helmfile
  ver="${1:-0.45.3}"
  url=https://github.com/roboll/helmfile/releases/download/v${ver}/helmfile_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: deis
install_deis(){
  name=deis
  ver="${1:-2.0.0}"
  url=https://storage.googleapis.com/workflow-cli-release/v${ver}/deis-v${ver}-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: kubectl
install_kubectl(){
  name=kubectl
  # find latest version:
  # curl https://storage.googleapis.com/kubernetes-release/release/stable.txt
  ver="${1:-1.15.2}"
  url=https://storage.googleapis.com/kubernetes-release/release/v${ver}/bin/linux/amd64/kubectl
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: kubedb
install_kubedb(){
  name=kubedb
  ver="${1:-0.11.0}"
  url=https://github.com/kubedb/cli/releases/download/${ver}/kubedb-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}
##############################################
#: minikube
install_minikube(){
  name=minikube
  ver="${1:0.27.0}"
  url=https://storage.googleapis.com/minikube/releases/v${ver}/minikube-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: jsonnet
install_jsonnet(){
  name=jsonnet
  name2=jsonnetfmt # there are two commands
  ver="${1:-0.15.0}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" -v https://github.com/google/jsonnet/releases/download/v${ver}/jsonnet-bin-v${ver}-linux.tar.gz
  try delete_if_exists "${name}"
  try delete_if_exists "${name2}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}" "${name}"
  try ln -sf "${out_dir}/${name2}" "${name2}"
}


##############################################
#: docker-credential-gcr
install_docker-credential-gcr(){
  name=docker-credential-gcr
  ver="${1:-2.0.1}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" -v https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v${ver}/docker-credential-gcr_linux_amd64-${ver}.tar.gz
  try delete_if_exists "${name}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: gotop
install_gotop(){
  name=gotop
  ver="${1:-3.0.0}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" -v https://github.com/cjbassi/gotop/releases/download/${ver}/gotop_${ver}_linux_amd64.tgz
  try delete_if_exists "${name}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: topgrade
install_topgrade(){
  name=topgrade
  ver="${1:-4.5.0}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" -v https://github.com/r-darwish/topgrade/releases/download/v${ver}/topgrade-v${ver}-x86_64-unknown-linux-musl.tar.gz
  try delete_if_exists "${name}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: kubebuilder
install_kubebuilder(){
  name=kubebuilder
  ver="${1:-2.2.0}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${ver}/kubebuilder_${ver}_linux_amd64.tar.gz -c
  try delete_if_exists "${name}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}_${ver}_linux_amd64/bin/kubebuilder" "${name}"
  try ln -sf "${out_dir}/${name}_${ver}_linux_amd64/bin/etcd" "etcd"
  try ln -sf "${out_dir}/${name}_${ver}_linux_amd64/bin/kube-apiserver" "kube-apiserver"
}

##############################################
#: saml2aws
install_saml2aws(){
  name=saml2aws
  ver="${1:-2.9.1}"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://github.com/Versent/saml2aws/releases/download/v${ver}/saml2aws_${ver}_linux_amd64.tar.gz -c
  try delete_if_exists "${name}"
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: skaffold
install_skaffold(){
  name=skaffold
  ver="${1:-0.33.0}"
  url=https://github.com/GoogleContainerTools/skaffold/releases/download/v${ver}/skaffold-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: sops
install_sops(){
  name=sops
  ver="${1:-3.0.5}"
  url=https://github.com/mozilla/sops/releases/download/${ver}/sops-${ver}.linux
  generic_binary "${name}" "${ver}" "${url}"
}

install_stern(){
  name=stern
  ver="${1:-1.11.0}"
  url=https://github.com/wercker/stern/releases/download/${ver}/stern_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: dive
install_dive(){
  name=dive
  ver="${1:-0.8.1}"
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  fname=dive_${ver}_linux_amd64.tar.gz
  #file to expect relative to the extraction point
  inside_archive=dive
  try wget https://github.com/wagoodman/dive/releases/download/v${ver}/${fname} -c
  delete_if_exists "${name}"
  try tar xvf ${fname}
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${inside_archive}" ${name}
}

##############################################
#: helm
install_helm(){
  name=helm
  ver="${1:-2.14.3}"
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  # url=http://storage.googleapis.com/kubernetes-helm/helm-v${ver}-linux-amd64.tar.gz
  url=https://get.helm.sh/helm-v${ver}-linux-amd64.tar.gz
  try wget ${url} -c
  delete_if_exists "${name}"
  try tar xvf helm-v${ver}-linux-amd64.tar.gz
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/linux-amd64/${name}" ${name}
}

##############################################
#: onessl
install_onessl(){
  name=onessl
  ver="${1:-0.3.0}"
  url=https://github.com/kubepack/onessl/releases/download/${ver}/onessl-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: op (1pass cli)
install_op(){
  name=op
  ver=0.10.0
  local zip=op_linux_amd64_v${ver}.zip
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try delete_if_exists "${zip}"
  try wget -c https://cache.agilebits.com/dist/1P/op/pkg/v${ver}/${zip} -O "${zip}"
  try delete_if_exists "${name}"
  try unzip -o ${zip}
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}
}

##############################################
#: ngrok
install_ngrok(){
  name=ngrok
  ver=4VmDzA7iaHb
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget https://bin.equinox.io/c/${ver}/ngrok-stable-linux-amd64.zip -c
  try delete_if_exists "${name}"
  try unzip ngrok-stable-linux-amd64.zip
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}
}

##############################################
#: packer
install_packer(){
  name=packer
  ver=0.10.1
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget https://releases.hashicorp.com/packer/${ver}/packer_${ver}_linux_amd64.zip -c
  try delete_if_exists "${name}"
  try unzip packer_${ver}_linux_amd64.zip
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}
}

##############################################
#: terraform
install_terraform(){
  name=terraform
  ver="${1:-0.11.13}"
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip -c
  try delete_if_exists "${name}"
  try unzip terraform_${ver}_linux_amd64.zip
  try mkdir -p "${software}/bin"; cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}-${ver}
}

##############################################
#: vault
install_vault(){
  name=vault
  ver="${1:-0.10.4}"
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget https://releases.hashicorp.com/vault/${ver}/vault_${ver}_linux_amd64.zip -c
  try delete_if_exists "${name}"
  try unzip vault_${ver}_linux_amd64.zip
  try mkdir -p "${software}/bin"; cd "${software}/bin"
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}
  try ln -sf "${software}/${name}-${ver}/${name}" ${name}-${ver}
}

##############################################
#: cfssljson
install_cfssljson(){
  name=cfssljson
  ver="${1:-1.2}"
  url=https://pkg.cfssl.org/R${ver}/cfssljson_linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

install_cfssl(){
  name=cfssl
  ver="${1:-1.2}"
  url=https://pkg.cfssl.org/R${ver}/cfssl_linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

install_direnv(){
  name=direnv
  ver="${1:-2.9.0}"
  url=https://github.com/direnv/direnv/releases/download/v${ver}/direnv.linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

install_fluxctl(){
  name=fluxctl
  ver="${1:-1.14.2}"
  url=https://github.com/weaveworks/flux/releases/download/${ver}/fluxctl_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

install_kubeseal(){
  name=kubeseal
  ver="${1:-0.7.0}"
  url=https://github.com/bitnami-labs/sealed-secrets/releases/download/v${ver}/kubeseal-linux-amd64
  generic_binary "${name}" "${ver}" "${url}"
}

install_psmem(){
  try mkdir -p "${software}/bin"; cd "${software}/bin"
  try wget https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py -O psmem -c
  chmod +x psmem
}


software="${HOME}/.software"
bin="${HOME}/.bin"
try mkdir -p "${bin}"
try mkdir -p "${software}"
try cd "${bin}"

self="$(realpath $0)"
fname=$(basename -- "${self}")

if [ "$#" == 0 ]; then
  echo "Usage: ${fname} <thing_to_install> <version(optional)>"
  echo "eg:" ; echo
  echo "${fname} terraform 0.12.3"
  echo
  echo "..'things' available are: "
  grep "^#:" "$self" | cut -d " " -f 2 | sort
else
  # | Form	| Meaning
  # |-------|---------------
  # | $*	  | $1 $2 $3...
  # | $@	  | $1 $2 $3...
  # | "$*"	| "$1 $2 $3..."
  # | "$@"	| "$1" "$2" "$3"...
  yell install_$*
  install_$*
fi


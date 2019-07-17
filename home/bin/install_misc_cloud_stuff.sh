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
  try wget -O "${out_file}" https://storage.googleapis.com/krew/v${ver}/krew.tar.gz
  try wget -O krew.yaml https://storage.googleapis.com/krew/v${ver}/krew.yaml
  try tar xf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${out_dir}/krew-linux_amd64" "${name}"
  try krew install --manifest=${out_dir}/krew.yaml
  try kubectl plugin list
}

##############################################
#: hub
install_hub(){
  name=hub
  ver="2.3.0-pre9"
  out_dir="${software}/${name}-v${ver}"
  out_file="${name}-${ver}.tgz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://github.com/github/hub/releases/download/v${ver}/hub-linux-amd64-${ver}.tgz
  try tar xvf "${out_file}"
  try mkdir -p "${software}/bin"
  try cd "${software}/bin"
  try ln -sf "${software}/hub-v${ver}/hub-linux-amd64-${ver}/bin/hub" "${name}"
}

##############################################
#: kustomize
install_kustomize(){
  name=kustomize
  ver="${1:-2.0.3}"
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
  ver="${1:-1.14.1}"
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
#: saml2aws
install_saml2aws(){
  name=saml2aws
  ver="2.9.1"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  try mkdir -p "${out_dir}"
  try cd "${out_dir}"
  try wget -O "${out_file}" https://github.com/Versent/saml2aws/releases/download/v${ver}/saml2aws_${ver}_linux_amd64.tar.gz
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
  ver="${1:-1.7.0}"
  url=https://github.com/wercker/stern/releases/download/${ver}/stern_linux_amd64
  generic_binary "${name}" "${ver}" "${url}"
}

##############################################
#: helm
install_helm(){
  name=helm
  ver="${1:-2.12.3}"
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget http://storage.googleapis.com/kubernetes-helm/helm-v${ver}-linux-amd64.tar.gz
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
#: packer
install_packer(){
  name=packer
  ver=0.10.1
  try mkdir -p "${software}/${name}-${ver}"
  try cd "${software}/${name}-${ver}"
  try wget https://releases.hashicorp.com/packer/${ver}/packer_${ver}_linux_amd64.zip
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
  try wget https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip
  try delete_if_exists "${name}"
  try unzip terraform_${ver}_linux_amd64.zip
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

install_kops(){
  name=kops
  ver="${1:-1.11.1}"
  url=https://github.com/kubernetes/kops/releases/download/${ver}/${file}
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
  ver="${1:-1.12.3}"
  wget https://github.com/weaveworks/flux/releases/download/${ver}/fluxctl_linux_amd64 -c
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
  try wget https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py -O psmem
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


#!/bin/sh

software="${HOME}/.software"
bin="${HOME}/.bin"

delete_if_exists(){
  if [ -f "$1" ]; then
    rm -f "$1"
  fi
}


alias wget="wget -q --show-progress -c"


set -e
mkdir -p "${bin}"
mkdir -p "${software}"
cd "${bin}"

##############################################
#: hub
install_hub(){
  name=hub
  ver="2.3.0-pre9"
  out_dir="${software}/${name}-v${ver}"
  out_file="${name}-${ver}.tgz"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/github/hub/releases/download/v${ver}/hub-linux-amd64-${ver}.tgz
  tar xvf "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${software}/hub-v${ver}/hub-linux-amd64-${ver}/bin/hub" "${name}"
}

##############################################
#: deis
install_deis(){
  name=deis
  ver="2.0.0"
  out_dir="${software}/${name}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  # https://storage.googleapis.com/workflow-cli-release/v2.0.0/deis-v2.0.0-darwin-386
  wget -O "${out_file}" https://storage.googleapis.com/workflow-cli-release/v${ver}/deis-v${ver}-linux-amd64
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: gofabric8
install_gofabric8(){
  name="gofabric8"
  ver="0.4.104"
  out_dir="${software}/${name}"
  out_file="${name}-v${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/fabric8io/gofabric8/releases/download/v${ver}/gofabric8-linux-amd64
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: kubectl
install_kubectl(){
  name=kubectl
  # find latest version:
  # curl https://storage.googleapis.com/kubernetes-release/release/stable.txt
  ver=1.12.2
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://storage.googleapis.com/kubernetes-release/release/v${ver}/bin/linux/amd64/kubectl
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: minikube
install_minikube(){
  name=minikube
  ver=0.27.0
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://storage.googleapis.com/minikube/releases/v${ver}/minikube-linux-amd64 -q
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: saml2aws
install_saml2aws(){
  name=saml2aws
  ver="2.9.1"
  out_dir="${software}/${name}-${ver}"
  out_file="${name}-${ver}.tar.gz"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/Versent/saml2aws/releases/download/v${ver}/saml2aws_${ver}_linux_amd64.tar.gz
  delete_if_exists "${name}"
  tar xvf "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: skaffold
install_skaffold(){
  name=skaffold
  ver=0.19.0
  out_dir="${software}/${name}-${ver}"
  out_file="${name}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/GoogleContainerTools/skaffold/releases/download/v${ver}/skaffold-linux-amd64
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${name}" "${name}"
}

##############################################
#: sops
install_sops(){
  name=sops
  ver="3.0.5"
  out_dir="${software}/${name}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/mozilla/sops/releases/download/${ver}/sops-${ver}.linux
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: stern
install_stern(){
  name=stern
  ver="1.7.0"
  out_dir="${software}/${name}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://github.com/wercker/stern/releases/download/${ver}/stern_linux_amd64
  chmod +x "${out_file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: helm
install_helm(){
  name=helm
  ver="2.10.0"
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget http://storage.googleapis.com/kubernetes-helm/helm-v${ver}-linux-amd64.tar.gz
  delete_if_exists "${name}"
  tar xvf helm-v${ver}-linux-amd64.tar.gz
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${software}/${name}-${ver}/linux-amd64/${name}" ${name}
}

##############################################
#: helmc (helm classic)
install_helmc(){
  name=helmc
  ver="latest"  #0.8.1+a9c55cf at time of writing
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget https://storage.googleapis.com/helm-classic/helmc-latest-linux-amd64
  chmod +x helmc-latest-linux-amd64
  # delete_if_exists "${name}"
  # tar xvf helm-v${ver}-linux-amd64.tar.gz
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${software}/${name}-${ver}/helmc-latest-linux-amd64" ${name}
}

##############################################
#: packer
install_packer(){
  name=packer
  ver=0.10.1
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget https://releases.hashicorp.com/packer/${ver}/packer_${ver}_linux_amd64.zip
  delete_if_exists "${name}"
  unzip packer_${ver}_linux_amd64.zip
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${software}/${name}-${ver}/${name}" ${name}
}

##############################################
#: terraform
install_terraform(){
  name=terraform
  ver=0.11.8
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip
  delete_if_exists "${name}"
  unzip terraform_${ver}_linux_amd64.zip
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${software}/${name}-${ver}/${name}" ${name}
  ln -sf "${software}/${name}-${ver}/${name}" ${name}-${ver}
}

##############################################
#: cfssljson
install_cfssljson(){
  name=cfssljson
  ver=1.2
  dest="${software}/${name}-${ver}"
  mkdir -p "$dest"
  cd "${dest}"
  wget https://pkg.cfssl.org/R${ver}/cfssljson_linux-amd64
  chmod +x cfssljson_linux-amd64
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/cfssljson_linux-amd64" ${name}
}

##############################################
#: cfssl
install_cfssl(){
  name=cfssl
  ver=1.2
  dest="${software}/${name}-${ver}"
  mkdir -p "$dest"
  cd "${dest}"
  wget https://pkg.cfssl.org/R${ver}/cfssl_linux-amd64
  chmod +x cfssl_linux-amd64
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/cfssl_linux-amd64" ${name}
}

##############################################
#: kops
install_kops(){
  # go get -d k8s.io/kops
  # cd ${GOPATH}/src/k8s.io/kops/
  # make
  name=kops
  ver=1.10.0
  dest="${software}/${name}-${ver}"
  file=kops-linux-amd64
  mkdir -p "$dest"
  cd "${dest}"
  wget https://github.com/kubernetes/kops/releases/download/${ver}/${file}
  chmod +x "${file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/${file}" "${name}"
}

##############################################
#: direnv
install_direnv(){
  # go get -d k8s.io/kops
  # cd ${GOPATH}/src/k8s.io/kops/
  # make
  name=direnv
  ver=2.9.0
  dest="${software}/${name}-${ver}"
  file=direnv.linux-amd64
  mkdir -p "$dest"
  cd "${dest}"
  wget https://github.com/direnv/direnv/releases/download/v${ver}/direnv.linux-amd64
  chmod +x "${file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/${file}" "${name}"
}

##############################################
#: fluxctl
install_fluxctl(){
  name=fluxctl
  ver=1.8.1
  dest="${software}/${name}-${ver}"
  file=fluxctl_linux_amd64
  mkdir -p "$dest"
  cd "${dest}"
  wget https://github.com/weaveworks/flux/releases/download/${ver}/fluxctl_linux_amd64 -c
  chmod +x "${file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/${file}" "${name}"
}

##############################################
#: kubeseal
install_kubeseal(){
  name=kubeseal
  ver=0.7.0
  dest="${software}/${name}-${ver}"
  file=kubeseal-linux-amd64
  mkdir -p "$dest"
  cd "${dest}"
  wget -c https://github.com/bitnami-labs/sealed-secrets/releases/download/v${ver}/kubeseal-linux-amd64
  chmod +x "${file}"
  mkdir -p "${software}/bin"; cd "${software}/bin"
  ln -sf "${dest}/${file}" "${name}"
}

##############################################
#: psmem
install_psmem(){
  mkdir -p "${software}/bin"; cd "${software}/bin"
  wget https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py -O psmem
  chmod +x psmem
}

self="$(realpath $0)"
if [ "X$1" = X ]; then
  echo "Usage: $0 thing_to_install"
  echo "..'things' available are: "
  grep "^#:" "$self" | cut -d " " -f 2 | sort
else
  set -x
  install_$1
fi


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
  cd "${bin}"
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
  cd "${bin}"
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
  cd "${bin}"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: kubectl
install_kubectl(){
  name=kubectl
  ver=1.3.6
  out_dir="${software}/${name}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://storage.googleapis.com/kubernetes-release/release/v${ver}/bin/linux/amd64/kubectl
  chmod +x "${out_file}"
  cd "${bin}"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: minikube
install_minikube(){
  name=minikube
  ver=0.11.0
  out_dir="${software}/${name}"
  out_file="${name}-${ver}"
  mkdir -p "${out_dir}"
  cd "${out_dir}"
  wget -O "${out_file}" https://storage.googleapis.com/minikube/releases/v${ver}/minikube-linux-amd64 -q
  chmod +x "${out_file}"
  cd "${bin}"
  ln -sf "${out_dir}/${out_file}" "${name}"
}

##############################################
#: helm
install_helm(){
  name=helm
  ver="2.0.0-beta.2"
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget http://storage.googleapis.com/kubernetes-helm/helm-v${ver}-linux-amd64.tar.gz
  delete_if_exists "${name}"
  tar xvf helm-v${ver}-linux-amd64.tar.gz
  cd "${bin}"
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
  cd "${bin}"
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
  cd "${bin}"
  ln -sf "${software}/${name}-${ver}/${name}" ${name}
}



##############################################
#: terraform
install_terraform(){
  name=terraform
  ver=0.9.11
  mkdir -p "${software}/${name}-${ver}"
  cd "${software}/${name}-${ver}"
  wget https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip
  delete_if_exists "${name}"
  unzip terraform_${ver}_linux_amd64.zip
  cd "${bin}"
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
  cd "${bin}"
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
  cd "${bin}"
  ln -sf "${dest}/cfssl_linux-amd64" ${name}
}

##############################################
#: kops
install_kops(){
  # go get -d k8s.io/kops
  # cd ${GOPATH}/src/k8s.io/kops/
  # make
  name=kops
  ver=1.4.1
  dest="${software}/${name}-${ver}"
  file=kops-linux-amd64
  mkdir -p "$dest"
  cd "${dest}"
  wget https://github.com/kubernetes/kops/releases/download/v${ver}/${file}
  chmod +x "${file}"
  cd "${bin}"
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
  cd "${bin}"
  ln -sf "${dest}/${file}" "${name}"
}
##############################################
#: psmem
install_psmem(){
  cd "${bin}"
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


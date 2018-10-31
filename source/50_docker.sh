
# Docker/kubernetes shortcuts

alias d='docker'
alias k='kubectl'
alias kp='k get pod'
alias dps='d ps'
alias di='d images'
alias dco='docker-compose'

function k8se() {
  cmd='bash';
  if [ "$2" != "" ]
  then
       cmd=$2
  fi   
  
if [ "$1" != "" ]
  then
      pod=`kubectl get pod | grep $1 | head -n 1 | awk '{ print $1 }'`;
      container=`kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' | tr ' ' '\n' | grep $1`;
      kubectl exec -it $pod --container=$container $cmd;
  fi
}

function k8sl() {
  if [ "$1" != "" ]
  then
      pod=`kubectl get pod | grep $1 | head -n 1 | awk '{ print $1 }'`;
      container=`kubectl get pods $pod -o jsonpath='{.spec.containers[*].name}' | head -n 1 | tr ' ' '\n' | grep $1`;
      kubectl logs -f $pod $container;
  fi
}

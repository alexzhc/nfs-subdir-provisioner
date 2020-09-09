module alexzhc/nfs-dubdir-provisioner

go 1.14

require (
    k8s.io/kubernetes/pkg/apis/core/v1/helper 
	github.com/golang/glog
	github.com/kubernetes-sigs/sig-storage-lib-external-provisioner/controller
	k8s.io/api/core/v1
	k8s.io/api/storage/v1
	k8s.io/apimachinery/pkg/apis/meta/v1
	k8s.io/apimachinery/pkg/util/wait
	k8s.io/client-go/kubernetes
	k8s.io/client-go/rest
)
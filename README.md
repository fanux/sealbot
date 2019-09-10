# 定制kubernetes patch文件
```
cd fanux/kube
git checkout v1.16.0 -b v1.16.0-lvscare
git am ../sealbot/*patch
git commit -m "v1.16.0-lvscare"
git tag  v1.16.0-lvscare
git push --tags
```

fanux/kube CI will build super kubeadm

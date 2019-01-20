docker run -d \
  --network mntzcn_default \
  --name metastore \
  -v /Users/miguelhalysortuno/Documents/Master/TFM/devops/docker/mntzcn/container_data/mysql:/var/lib/mysql \
  mntzcn/metastore:5.6.38 

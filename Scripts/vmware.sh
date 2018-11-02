#!/bin/sh
sudo systemctl start vmware-networks.service
sudo systemctl start vmware-usbarbitrator
sudo vmware-usbarbitrator

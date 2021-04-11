# Summary
Quick [Terraform](https://www.terraform.io/) project to deploy a GCP Compute Instance, running [Cowrie Honeypot](https://github.com/cowrie/cowrie).
git
Most of the heavy lifting is done via the [Start-Up script](scripts/cowrie-boot-ubuntu.sh), which was a copy/paste from a previous project of mine; it's far from pretty, but works well enough to get an active Cowrie instance up and running

## Notes
1) To keep costs down, a micro instance is deployed. This /works/ but means the initial installation is *slow*, upto 10mins in some test deployments. Take note of /home/build.log to view progress from the initial build script
2) Initial observations indicate that GCP instances are currently getting more attention than their AWS counterparts, possibly something to investigate further.
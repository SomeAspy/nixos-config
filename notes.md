# Notes

## If nix decides to nuke the TPM
Should fix PCRlock fails:
`sudo rm /var/lib/systemd/pcrlock.json`

Re-enroll keys into TPM:
`sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrlock=/var/lib/systemd/pcrlock.json /dev/nvme0n1p2`

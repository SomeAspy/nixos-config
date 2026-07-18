# Notes

## If nix decides to nuke the TPM
`sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrlock=/var/lib/systemd/pcrlock.json /dev/nvme0n1p2`

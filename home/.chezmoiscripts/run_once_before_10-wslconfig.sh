{{ if (eq .chezmoi.os "linux") }}
  {{ if (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
sudo tee -a /etc/wsl.conf << EOF
[boot]
systemd=true

[automount]
enabled = true
options = "metadata,umask=22,fmask=11"
EOF
  {{ end }}
{{ end }}
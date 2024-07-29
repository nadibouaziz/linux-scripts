# Default iptables rules for personal computer

## Give execute permissions to the iptables.sh file
```bash
chmod +x iptables.sh
```

## Load the iptables rules by default when restart
```bash 
cat <<EOF > /etc/network/if-pre-up.d/iptablesload
#!/bin/sh
iptables-restore < /etc/iptables_rules
exit 0
EOF
```

## Finally, add the permissions to execute the script:

```bash
chmod +x /etc/network/if-pre-up.d/iptablesload
```

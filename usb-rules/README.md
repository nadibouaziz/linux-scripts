# Set USB Rules

## Create the default rules

```bash
sudo cp 99-whitelist-usb.rules /usr/lib/udev/rules.d/
```

At the end of the script `99-whitelist-usb.rules`, you'll need to specify the path for the script `udev-blocked` in case any device are blocked

## Adding a new USB device

- First launch the script without the new USB device plugged in

```bash
bash usb-gen-whitelist
```

- Then launch the script once more when your USB is plugged in

```bash
bash usb-gen-whitelist
```

- check the difference between the 2 results and edit your rules `99-whitelist-usb.rules` then restart the computer.

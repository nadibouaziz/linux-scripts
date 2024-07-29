# Synchronise 2 USB folder

### Install the new service and enable service
1/ Copy the default service
```bash
sudo cp sync-usb.service /etc/systemd/system
```
Note : On line 9 of the above file, the path of the following script is required


2/ Script that do the synchronisation between the 2 USB devices

```bash
cp synchro-unison /same/path/specificied/on/line/9/of/sync-usb.service
```

3/ Enable the service
```bash
sudo systemctl enable your.service
```

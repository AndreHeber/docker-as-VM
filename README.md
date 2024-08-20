# Alpine with S6-Overlay

I want a docker image that behaves more like a VM:

1. I can start / stop many processes, also the main process (usually PID 1)
   Why? To test things out. Changing environment variables, debugging with the coredump file or recompiling the app without crashing the container follows much more my development process
2. Logging to a seperate file with logrotation
   Why? Docker logs (and Kibana) are a pain in the ass!
3. Watchdog: k8s restarts containers when they are crashing. That should be done by the s6-overlay.

## Tested

- [x] Starting & Stopping services with `s6-rc start myapp` and `s6-rc stop myapp`
- [x] `docker exec` into the container and run myapp manually, it uses the env vars of the shell
- [x] Logging: `/var/log/myapp/current` is filled
- [ ] Logrotation
- [ ] Cron
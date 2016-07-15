#Facebook Live Downloader RoR5 test

Duplicate the `application.yml.example` and rename it to `application.yml`. change the following values.

```yml
FB_APPID: "********************"
FB_APPSECRET: "********************"
```

You'll need to edit your `hosts` files. run:

```shell
sudo nano /etc/hosts
```

add the appropriate url for your facebook app. for example:

```shell
0.0.0.0 fblivetest.dev
```

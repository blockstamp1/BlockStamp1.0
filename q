[0;1;32m●[0m blockstamp.service - Blockstamp Application
     Loaded: loaded (/lib/systemd/system/blockstamp.service; enabled; vendor preset: enabled)
     Active: [0;1;32mactive (running)[0m since Thu 2022-09-15 11:57:34 UTC; 9min ago
   Main PID: 143814 (npm)
      Tasks: 59 (limit: 614)
     Memory: 153.9M
     CGroup: /system.slice/blockstamp.service
             ├─143814 npm
             ├─143825 sh -c concurrently "npm run ui:start" "npm run server"
             ├─143826 node /var/www/proofofexistence/node_modules/.bin/concurrently npm run ui:start npm run server
             ├─143834 /bin/sh -c npm run server
             ├─143840 npm
             ├─143861 sh -c nodemon server/app.js
             ├─143864 node /var/www/proofofexistence/node_modules/.bin/nodemon server/app.js
             └─143900 /usr/bin/node server/app.js

Sep 15 11:57:34 blockstamp-vps.me systemd[1]: Started Blockstamp Application.
Sep 15 11:57:35 blockstamp-vps.me npm[143814]: > Blockstamp@1.0.1 start /var/www/proofofexistence
Sep 15 11:57:35 blockstamp-vps.me npm[143814]: > concurrently "npm run ui:start" "npm run server"
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [1]
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [1] > Blockstamp@1.0.1 server /var/www/proofofexistence
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [1] > nodemon server/app.js
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [1]
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [0]
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [0] > Blockstamp@1.0.1 ui:start /var/www/proofofexistence
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [0] > NODE_ENV=production webpack
Sep 15 11:57:37 blockstamp-vps.me npm[143826]: [0]
Sep 15 11:57:39 blockstamp-vps.me npm[143826]: [1] [nodemon] 1.18.9
Sep 15 11:57:39 blockstamp-vps.me npm[143826]: [1] [nodemon] to restart at any time, enter `rs`
Sep 15 11:57:39 blockstamp-vps.me npm[143826]: [1] [nodemon] watching: *.*
Sep 15 11:57:39 blockstamp-vps.me npm[143826]: [1] [nodemon] starting `node server/app.js`
Sep 15 11:57:43 blockstamp-vps.me npm[143826]: [1] incomingPKey: <HDPrivateKey: zprvAfUp27PhmZoZyYguZGfgpjhFZHTQQYmjRKKvBzqLSgRnyQcrrJJUZsE3cehdzzknqP9M7gEmxGDSpRQGLyAvuLXmDqkAmeKaRmKJqJRNGhm>
Sep 15 11:57:44 blockstamp-vps.me npm[143826]: [1] (node:143883) [DEP0079] DeprecationWarning: Custom inspection function on Objects via .inspect() is deprecated
Sep 15 11:57:44 blockstamp-vps.me npm[143826]: [1] Proof of Existence listening at http://:::3004
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [1] [nodemon] restarting due to changes...
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0] Hash: bc17781ee875842ad10a
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0] Version: webpack 3.12.0
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0] Time: 18373ms
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]                                                                                    Asset     Size  Chunks                    Chunk Names
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]   ../_/node_modules/@poexio/light-bootstrap-dashboard/dist/assets/fonts/nucleo-icons.eot  27.6 kB          [emitted]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0] ../_/node_modules/@poexio/light-bootstrap-dashboard/dist/assets/fonts/nucleo-icons.woff2  13.3 kB          [emitted]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  ../_/node_modules/@poexio/light-bootstrap-dashboard/dist/assets/fonts/nucleo-icons.woff  15.9 kB          [emitted]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]   ../_/node_modules/@poexio/light-bootstrap-dashboard/dist/assets/fonts/nucleo-icons.ttf  27.4 kB          [emitted]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]   ../_/node_modules/@poexio/light-bootstrap-dashboard/dist/assets/fonts/nucleo-icons.svg   149 kB          [emitted]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]                                                                            client.min.js   667 kB       0  [emitted]  [big]  main
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [161] ../ui/app/index.jsx 2.6 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [194] ../ui/app/App.jsx 2.01 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [207] ../ui/scss/main.css 1.15 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [208] ../node_modules/css-loader!../node_modules/sass-loader/lib/loader.js!../ui/scss/main.css 1.15 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [209] ../ui/public/theme/style.css 1.18 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [210] ../node_modules/css-loader!../node_modules/sass-loader/lib/loader.js!../ui/public/theme/style.css 823 bytes {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [211] ../ui/app/pages/Home.jsx 9.03 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [456] ../ui/app/crypto.js 9.9 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [457] ../ui/app/pages/Detail.jsx 1.23 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [459] ../ui/app/pages/Error404.jsx 414 bytes {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]  [460] ../ui/app/registerServiceWorker.js 4.36 kB {0} [built]
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0]     + 450 hidden modules
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [1] [nodemon] starting `node server/app.js`
Sep 15 11:58:00 blockstamp-vps.me npm[143826]: [0] npm run ui:start exited with code 0
Sep 15 11:58:01 blockstamp-vps.me npm[143826]: [1] incomingPKey: <HDPrivateKey: zprvAfUp27PhmZoZyYguZGfgpjhFZHTQQYmjRKKvBzqLSgRnyQcrrJJUZsE3cehdzzknqP9M7gEmxGDSpRQGLyAvuLXmDqkAmeKaRmKJqJRNGhm>
Sep 15 11:58:01 blockstamp-vps.me npm[143826]: [1] (node:143900) [DEP0079] DeprecationWarning: Custom inspection function on Objects via .inspect() is deprecated
Sep 15 11:58:01 blockstamp-vps.me npm[143826]: [1] Proof of Existence listening at http://:::3004
Sep 15 11:58:08 blockstamp-vps.me npm[143826]: [1] randomPath: m/976894011/1723291495/491365749
Sep 15 11:58:08 blockstamp-vps.me npm[143826]: [1] version argument is not a buffer
